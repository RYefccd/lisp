;;; Saved through ges-version 0.3.3dev at 2003-11-04 11:27
;;; ;;; From: Arjen Wiersma <arjen@wiersma.org>
;;; ;;; Subject: worklog.el 2.3 - XEmacs Compatible
;;; ;;; Newsgroups: gnu.emacs.sources
;;; ;;; Date: Mon, 29 Sep 2003 10:42:38 GMT
;;; ;;; Organization: chello broadband

;;; Hi all,

;;; worklog.el 2.3 was released... this release makes it totally compatible
;;; with XEmacs. Thanks to Mats Lidell for his efforts here!

;;; regards,

;;; Arjen

;;; worklog.el starts here

;; Copyright (C) 1998,2001,2002 Kai Grossjohann
;; Copyright (C) 2003 Arjen Wiersma

;; Author: Kai.Grossjohann@CS.Uni-Dortmund.DE
;; Maintainer: Arjen@Wiersma.org
;; Version: 2.3
;; Keywords: timetracker
;; Homepage: http://www.wiersma.org

;; This file is not (yet) part of GNU Emacs.

;; worklog.el is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation,  Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This code lets you keep track of stuff you do.  It writes
;; time-stamps and some data into a file, formatted for easy parsing.
;; The format of the file is as follows: Each entry starts in the
;; beginning of a line with a date and time of the format YYYY-MM-DD
;; HH:MM (24 h clock).  Then comes whitespace and the entry itself.
;; The entry may be continued on the next line, continuation lines
;; begin with whitespace.
;;
;; The most important commands are M-x worklog RET and M-x
;; worklog-show RET (the former automatically adds an entry).  Type
;; C-h m when looking at the worklog file for information what you can
;; do.
;;
;; In addition to facilitating event logging, worklog.el also provides
;; task duration calculation and summarization by task and date.  To
;; realize these benefits, you must enter login, logout and task stop
;; (or done) information.  If your worklog buffer looks like this:
;;
;; 2003-07-22 17:20 done
;; 2003-07-22 18:33 Hacking on worklog
;; 2003-07-22 20:00 done
;; 2003-07-22 20:00 logout
;; 
;; 2003-07-23 06:44 login
;; 2003-07-23 06:44 Website redesign
;; 2003-07-23 07:07 stop
;; 2003-07-23 07:07 logout
;; 
;; Then, M-x worklog-summarize-tasks produces something like this:
;;
;; *worklog summary* (2003-07-23 07:45)
;; 
;; by-date
;; -------
;; 2003-07-23
;;   0.23	Website redesign
;; 2003-07-22
;;   1.27	Hacking on worklog
;; 
;; tasks
;; -----
;; 1.27	Hacking on worklog
;; 0.23	Website redesign
;; 
;; See `worklog-task-begin' for more info.  If non-nil, the normal hook
;; `worklog-summarize-tasks-hook' is run in the output buffer prior to
;; display.
;;
;; From version 2.0 on it is possible to automate worklog via your .emacs.
;; Add the following to your .emacs in order to to have a standard task
;; 'Hacking emacs' start as soon as you start emacs. When emacs gets killed
;; it will also log an logout task.
;;
;; (require 'worklog)
;; (setq worklog-automatic-login t)
;; (add-hook 'emacs-startup-hook
;;           (function (lambda ()
;;                       (worklog-do-task "Hacking emacs" t)
;;                       )))
;; 
;; (add-hook 'kill-emacs-hook
;;           (function (lambda ()
;;                       (worklog-do-task "logout" t)
;;                       (worklog-finish)
;;                       )))
;;
;; When `worklog-automatic-login' is set to non-nil it will automatically
;; insert your 'login' task. The non-nil 2nd argument to `worklog-do-task'
;; will add an stop task for any running tasks.
;;
;; If you don't want to use `worklog-automatic-login' you will need to insert
;; a 'login' task yourselfs manually.
;;
 
;;; History:

;; 1999/04/23 kai    releases worklog 1.6
;; 2001/01/11 ttn    adds task duration-handling and summarization
;; 2003/07/22 arjen  Using eval-when-compile to load timezone and cl
;; 2003/07/22 arjen  Fixed worklog-sum-to-hours to correctly handle minutes
;; 2003/07/23 arjen  Refactored the task insertion code. `worklog-do-task' 
;;                   can now be used non-interactively in your .emacs for instance
;; 2003/07/24 arjen  `worklog-do-task' can now log you in automagically when
;;                   `worklog-automatic-login' is set to non-nil
;; 2003/07/24 arjen  `worklog-summarize-tasks' now makes sure there is only 1
;;                   day entry per day, multiple login/logouts are folded
;;                   into 1 task list.
;; 2003/08/11 sp1ff  actually like the old percentages, so he made a flag for it,
;;                   you can thus customize it. 
;;                   "I'm working on a contract that requires me to report daily 
;;                    hours - so, I added an option to sum up the hours spent 
;;                    working on various tasks daily."
;; 2003/09/12 sp1ff  reuse summary of buffer.
;; 2003/09/22 matts  Patches supplied for XEmacs support finally went in.

;;; Todo:

;; * Allow other date formats.
;; * file management tools?
;; * limit the summary to N days?

;;; Code:

(eval-when-compile (require 'timezone) (require 'cl)) 

(defgroup worklog nil
  "Keep track of what you do.")

;;; User customizable variables:

(defcustom worklog-file "~/.worklog"
  "Where worklog info should be put."
  :type 'file
  :group 'worklog)

(defcustom worklog-fill-prefix "   "
  "Fill prefix to use for worklog mode."
  :type 'string
  :group 'worklog)

(defcustom worklog-automatic-login nil
  "Insert an 'login' task automagically if you are not logged in.
While you use `worklog-do-task' to insert a new task worklog will 
enter the 'login' task for you.

Because worklog will need to parse your tasks when doing this it will
make task insertion slower. Set to nil by default for backward compatibility"
  :type 'boolean
  :group 'worklog)

(defcustom worklog-mode-hook nil
  "Standard mode hook."
  :type 'hook
  :group 'worklog)

(defcustom worklog-use-minutes t
  "Set to `nil' to express minutes as percentages of hours."
  :type 'boolean
  :group 'worklog)

(defcustom worklog-summarize-show-totals nil
  "Set to `t' to show daily totals in the summary."
  :type 'boolean
  :group 'worklog)

(defcustom worklog-reuse-summary-buffer nil
  "Set to t to have worklog just re-use the same buffer for generating
summaries. `nil' (the default) will create a new buffer each time
`worklog-summarize-tasks' is invoked."
  :type 'boolean
  :group 'worklog)

(defcustom worklog-summarize-tasks-hook nil
  "Hook run at the end of `worklog-summarize-tasks'.
The output buffer is current when called."
  :type 'hook
  :group 'worklog)

;;; Other variables:

(defvar worklog-mode-map
  (let ((m (copy-keymap text-mode-map)))
    (define-key m "\C-c\C-c"     'worklog-finish)
    (define-key m "\C-c\C-a"     'worklog-add-entry)
    (define-key m "\C-c\C-d"     'worklog-kill-entry)
    (define-key m "\C-c\C-k"     'worklog-kill-entry)
    (define-key m "\C-c\C-s"     'worklog-summarize-tasks)
    (define-key m "\C-c\C-l\C-i" 'worklog-add-entry-login)
    (define-key m "\C-c\C-l\C-o" 'worklog-add-entry-logout)
    (define-key m "\C-c\C-l\C-b" 'worklog-task-begin)
    (define-key m "\C-c\C-l\C-s" 'worklog-task-stop)
    (define-key m "\C-c\C-l\C-d" 'worklog-task-done)
    (define-key m "\C-c\C-n"     'worklog-forward-entry)
    (define-key m "\C-c\C-p"     'worklog-backward-entry)
    (define-key m "\M-n"         'worklog-forward-entry)
    (define-key m "\M-p"         'worklog-backward-entry)
    m)
  "Keymap for worklog mode.")

(defvar worklog-font-lock-defaults
  (list 'worklog-font-lock-keywords nil nil nil nil)
  "Font lock defaults for worklog mode.")

(defvar worklog-font-lock-keywords
  (list "^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]")
  "Font lock keywords for worklog mode.")

(defvar worklog-target-column 17
  "Where the text of an entry starts.")

(defvar worklog-task-history nil
  "History of tasks.")

(defvar worklog-logged-in nil
  "Determines if we are currently logged in or not.")

;;; Entry points:

(defun worklog ()
  "Enter worklog file, add a new entry."
  (interactive)
  (find-file worklog-file)
  (worklog-mode)
  (worklog-add-entry))

(defun worklog-show ()
  "Enter worklog file."
  (interactive)
  (find-file worklog-file)
  (worklog-mode))

(defun worklog-mode ()
  "Mode for editing worklog sheets.
\\{worklog-mode-map}"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'worklog-mode)
  (setq mode-name "WorkLog")
  (use-local-map worklog-mode-map)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults worklog-font-lock-defaults)
  (setq fill-prefix worklog-fill-prefix)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat paragraph-separate "\\|[0-9][0-9][0-9][0-9]"))
  (turn-on-auto-fill)
  (run-hooks 'text-mode-hook)
  (run-hooks 'worklog-mode-hook))

;;; Aliases and compatibility functions

;;; In XEmacs the read-char function does not take an optional
;;; argument. This function came from GNUS and was modified to our
;;; needs - Patch by Mats Lidell
(defun worklog-xmas-read-char (&optional prompt)
  "Get the next event."
  (when prompt
    (message "%s" prompt))
  (let ((event (next-command-event)))
    (sit-for 0)
    ;; We junk all non-key events.  Is this naughty?
    (while (not (or (key-press-event-p event)
                    (button-press-event-p event)))
      (dispatch-event event)
      (setq event (next-command-event)))
    (and (key-press-event-p event)
         (event-to-character event))))

(if (featurep 'xemacs)
    (defalias 'worklog-read-char 'worklog-xmas-read-char)
  (defalias 'worklog-read-char 'read-char))

;;; This is the timezone-parse-date function from GNU Emacs. The XEmacs
;;; version does not handle our date format (8). Until we support multiple
;;; dates or until the XEmacs timezone function is expanded we will need to
;;; overload the function here...
(defun timezone-parse-date (date)
  "Parse DATE and return a vector [YEAR MONTH DAY TIME TIMEZONE].
Two-digit dates are `windowed'.  Those <69 have 2000 added; otherwise 1900
is added.  Three-digit dates have 1900 added.
TIMEZONE is nil for DATEs without a zone field.

Understands the following styles:
 (1) 14 Apr 89 03:20[:12] [GMT]
 (2) Fri, 17 Mar 89 4:01[:33] [GMT]
 (3) Mon Jan 16 16:12[:37] [GMT] 1989
 (4) 6 May 1992 1641-JST (Wednesday)
 (5) 22-AUG-1993 10:59:12.82
 (6) Thu, 11 Apr 16:17:12 91 [MET]
 (7) Mon, 6  Jul 16:47:20 T 1992 [MET]
 (8) 1996-06-24 21:13:12 [GMT]
 (9) 1996-06-24 21:13-ZONE"
  ;; Get rid of any text properties.
  (and (stringp date)
       (or (text-properties-at 0 date)
           (next-property-change 0 date))
       (setq date (copy-sequence date))
       (set-text-properties 0 (length date) nil date))
  (let ((date (or date ""))
        (year nil)
        (month nil)
        (day nil)
        (time nil)
        (zone nil))                     ;This may be nil.
    (cond ((string-match
            "\\([0-9]+\\)[ \t]+\\([^ \t,]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9:]+\\)[ \t]*\\([-+a-zA-Z0-9]+\\)" date)
           ;; Styles: (1) and (2) with timezone and buggy timezone
           ;; This is most common in mail and news,
           ;; so it is worth trying first.
           (setq year 3 month 2 day 1 time 4 zone 5))
          ((string-match
            "\\([0-9]+\\)[ \t]+\\([^ \t,]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9:]+\\)[ \t]*\\'" date)
           ;; Styles: (1) and (2) without timezone
           (setq year 3 month 2 day 1 time 4 zone nil))
          ((string-match
            "\\([^ \t,]+\\),[ \t]+\\([0-9]+\\)[ \t]+\\([^ \t,]+\\)[ \t]+\\([0-9]+:[0-9:]+\\)[ \t]+\\(T[ \t]+\\|\\)\\([0-9]+\\)[ \t]*\\'" date)
           ;; Styles: (6) and (7) without timezone
           (setq year 6 month 3 day 2 time 4 zone nil))
          ((string-match
            "\\([^ \t,]+\\),[ \t]+\\([0-9]+\\)[ \t]+\\([^ \t,]+\\)[ \t]+\\([0-9]+:[0-9:]+\\)[ \t]+\\(T[ \t]+\\|\\)\\([0-9]+\\)[ \t]*\\([-+a-zA-Z0-9]+\\)" date)
           ;; Styles: (6) and (7) with timezone and buggy timezone
           (setq year 6 month 3 day 2 time 4 zone 7))
          ((string-match
            "\\([^ \t,]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9:]+\\)[ \t]+\\([0-9]+\\)" date)
           ;; Styles: (3) without timezone
           (setq year 4 month 1 day 2 time 3 zone nil))
          ((string-match
            "\\([^ \t,]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9:]+\\)[ \t]+\\([-+a-zA-Z0-9]+\\)[ \t]+\\([0-9]+\\)" date)
           ;; Styles: (3) with timezone
           (setq year 5 month 1 day 2 time 3 zone 4))
          ((string-match
            "\\([0-9]+\\)[ \t]+\\([^ \t,]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\([0-9]+\\)[ \t]*\\([-+a-zA-Z0-9]+\\)" date)
           ;; Styles: (4) with timezone
           (setq year 3 month 2 day 1 time 4 zone 5))
          ((string-match
            "\\([0-9]+\\)-\\([A-Za-z]+\\)-\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9]+:[0-9]+\\)\\(\\.[0-9]+\\)?[ \t]+\\([-+a-zA-Z0-9]+\\)" date)
           ;; Styles: (5) with timezone.
           (setq year 3 month 2 day 1 time 4 zone 6))
          ((string-match
            "\\([0-9]+\\)-\\([A-Za-z]+\\)-\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9]+:[0-9]+\\)\\(\\.[0-9]+\\)?" date)
           ;; Styles: (5) without timezone.
           (setq year 3 month 2 day 1 time 4 zone nil))
          ((string-match
            "\\([0-9]+\\)-\\([0-9]+\\)-\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9]+:[0-9]+\\)[ \t]+\\([-+a-zA-Z0-9]+\\)" date)
           ;; Styles: (8) with timezone.
           (setq year 1 month 2 day 3 time 4 zone 5))
          ((string-match
            "\\([0-9]+\\)-\\([0-9]+\\)-\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9]+\\)[ \t]+\\([-+a-zA-Z0-9:]+\\)" date)
           ;; Styles: (8) with timezone with a colon in it.
           (setq year 1 month 2 day 3 time 4 zone 5))
          ((string-match
            "\\([0-9]+\\)-\\([0-9]+\\)-\\([0-9]+\\)[ \t]+\\([0-9]+:[0-9]+:[0-9]+\\)" date)
           ;; Styles: (8) without timezone.
           (setq year 1 month 2 day 3 time 4 zone nil))
          )
    (when year
      (setq year (match-string year date))
      ;; Guess ambiguous years.  Assume years < 69 don't predate the
      ;; Unix Epoch, so are 2000+.  Three-digit years are assumed to
      ;; be relative to 1900.
      (if (< (length year) 4)
          (let ((y (string-to-int year)))
            (if (< y 69)
                (setq y (+ y 100)))
            (setq year (int-to-string (+ 1900 y)))))
      (setq month
            (if (= (aref date (+ (match-beginning month) 2)) ?-)
                ;; Handle numeric months, spanning exactly two digits.
                (substring date
                           (match-beginning month)
                           (+ (match-beginning month) 2))
              (let* ((string (substring date
                                        (match-beginning month)
                                        (+ (match-beginning month) 3)))
                     (monthnum
                      (cdr (assoc (upcase string) timezone-months-assoc))))
                (if monthnum
                    (int-to-string monthnum)))))
      (setq day (match-string day date))
      (setq time (match-string time date)))
    (if zone (setq zone (match-string zone date)))
    ;; Return a vector.
    (if (and year month)
        (vector year month day time zone)
      (vector "0" "0" "0" "0" nil))))

;;;###autoload
(defun worklog-do-task (task &optional autostop)
  "Append TASK to the worklog.
If there is an ongoing task, you are given the option to declare it done or
stopped, or to cancel the operation.

`worklog-do-task' allows you to insert tasks into your worklog without
the need to interactively call it.

If autostop is set to non-nil, any running task will automatically be stopped.
"
  (worklog-show)

  (if worklog-automatic-login
      (worklog-grok-region (point-min) (point-max)))

  ;; worklog-task-history will not be set if we are not being intelligent
  (if (not worklog-task-history)
      (worklog-grok-region (point-min) (point-max)))

  (goto-char (point-max))
  (forward-word -1)
  (if (and (= 17 (current-column))
           (or (looking-at "done")
               (looking-at "stop")
               (looking-at "login")
               (looking-at "logout")))
      (goto-char (point-max))
    (move-to-column 17)
    (let ((ongoing (buffer-substring
                    (point) (progn (end-of-line) (point)))))
      (let (c)
        (if autostop
            (setq c ?s))
        (while (not (memq c '(?s ?d ?q)))
          (when c
            (message "Please type s (stop), d (done), or c (cancel).")
            (sit-for 2))
          (setq c (worklog-read-char (format "Ongoing: %s -- s, d, c? " ongoing))))
        (cond ((= ?s c) (worklog-task-stop))
              ((= ?d c) (worklog-task-done))
              ((= ?c c) (error "(worklog-do-task cancelled)"))))))
  ;; if we are not logged in and worklog-automatic-login is set to t, log me in
  (if (and (not worklog-logged-in) worklog-automatic-login)
      (worklog-add-entry-login))
  (worklog-add-entry)
  (insert task "\n"))

;;;###autoload
(defun worklog-task-begin (task)
  "Convenience function for `worklog-do-task'.

Does the same as calling`worklog-do-task' with a string parameter."
  (interactive  (progn
                  (unless worklog-task-history
                    (worklog-show)
                    (worklog-grok-region (point-min) (point-max)))
                  (let (c)
                    (list (read-string "What are you doing now? " nil
                                       'worklog-task-history c)))))
  (worklog-do-task task))

;;;###autoload
(defun worklog-task-stop ()
  "Append a \"stop\" entry to the worklog."
  (interactive) 
  (worklog-show) 
  (worklog-add-entry) (insert "stop\n"))

;;;###autoload
(defun worklog-task-done ()
  "Append a \"done\" entry to the worklog."
  (interactive) 
  (worklog-show) 
  (worklog-add-entry) (insert "done\n"))

;;;###autoload
(defun worklog-summarize-tasks ()
  "Display a summary of the worklog in two sections.
The first section is a reverse-chronological list of tasks and their durations,
and the second is an unsorted compendium of all tasks and total durations.
Durations are measured in hours.  If invoked non-interactively (i.e., \"emacs
--batch\"), the display buffer is sent to `message'."
  (interactive)
  (let* ((buf (and worklog-reuse-summary-buffer
                   (get-buffer "*worklog summary*")))
         (grok (save-current-buffer
                 (worklog-show)
                 (worklog-grok-region (point-min) (point-max))))
         (tasks (car grok))
         (cur-date nil)
         (by-date (cadr grok))
         (daily-total))
    (unless buf
      (setq buf (generate-new-buffer "*worklog summary*")))
    (switch-to-buffer buf)
    (erase-buffer)
    (insert (format-time-string "*worklog summary* (%Y-%m-%d %H:%M)\n"))
    (insert "\nby-date\n-------\n")
    (dolist (day by-date)
      (unless (string= cur-date (car day))
        (insert (car day) "\n")
        (setq cur-date (car day)))
      (setq daily-total 0)
      (maphash (lambda (task durations)
                 (let ((total (apply #'+ durations)))
                   (insert (format "  %s\t%s\n"
                                   (worklog-sum-to-hours-1 total)
                                   task))
                   (setq daily-total (+ daily-total total))))
               (cdr day))
      (if worklog-summarize-show-totals
          (insert (format " %s\tTotal\n"
                          (worklog-sum-to-hours-1 daily-total)))))
    (insert "\ntasks\n-----\n")
    (maphash (lambda (task durations)
               (insert (format "%s\t%s\n"
                               (worklog-sum-to-hours durations)
                               task)))
             tasks)
    (run-hooks 'worklog-summarize-tasks-hook)
    (when noninteractive                ; batch mode
      (message (buffer-string)))))

;;; Interactive commands:



(defun worklog-finish ()
  "Save and bury worklog buffer."
  (interactive)
  (save-buffer)
  (bury-buffer))

(defun worklog-add-entry ()
  "Insert the timestamp and trailing space that come before an task name."
  (interactive)
  (end-of-buffer)
  (unless (bolp)
    (newline))
  (insert (worklog-make-date-time) " "))

(defun worklog-add-entry-login ()
  "Adds a login entry"
  (interactive)
  (worklog-add-entry)
  (insert "login\n"))

(defun worklog-add-entry-logout ()
  "Inserts a 'logout' entry"
  (interactive)
  (worklog-add-entry)
  (insert "logout\n"))

(defun worklog-kill-entry (n)
  "Kills the task entry at point"
  (interactive "p")
  (kill-region (progn (backward-paragraph 1) (point))
               (progn (forward-paragraph n) (point))))

(defun worklog-backward-entry (n)
  "Move backward one (or N if prefix arg) entries."
  (interactive "p")
  (worklog-forward-entry (- n)))

(defun worklog-forward-entry (n)
  "Move forward one (or N if prefix arg) entries."
  (interactive "p")
  (when (< n 0) (backward-paragraph 1))
  (forward-paragraph n)
  (move-to-column worklog-target-column))

;;; Util code:

(defun worklog-make-date-time (&optional time)
  "Makes the worklog timestamp"
  ;; CCC apparently, %02m and %02d don't work on all Emacsen?
  ;; Hopefully, this generates two-digit months and days by prepending
  ;; zeros.
  (format-time-string "%Y-%m-%d %H:%M" time))

;;; snarfed from zenirc-2.112/src/zenirc.el -- thanks!
;;; renamed from zenirc-time-diff to avoid naming conflicts for
;;; zenirc users
(defun worklog-time-diff (a b)
  "Return the difference between two times. This function requires
the second argument to be earlier in time than the first argument."
  (cond ((= (nth 0 a) (nth 0 b)) (list 0 (- (nth 1 a) (nth 1  b))))
        ((> (nth 1 b) (nth 1 a)) (list (- (nth 0 a) (nth 0 b) 1)
                                       (- (+ 65536 (nth 1 a)) (nth 1 b))))
        (t (list (- (nth 0 a) (nth 0 b))
                 (- (nth 1 a) (nth 1 b))))))

(defun worklog-parse-date/time (date/time)
  "Parses the date/time format"
  ;; next line: nil was t -- XEmacs incompatibility?
  (let ((v (timezone-fix-time date/time nil (current-time-zone))))
    (encode-time 0 (aref v 4) (aref v 3) (aref v 2) (aref v 1) (aref v 0))))

(defun worklog-grok-region (b e)
  "Parse a region for worklog syntax (YYYY-MM-DD HH:MM TASK)"
  (setq worklog-task-history nil)
  (let ((worklog-line-re (or (get 'worklog-grok-region 'line-re)
                             (put 'worklog-grok-region
                                  'line-re
                                  (let ((d "[0-9]"))
                                    (concat "^\\(\\(" d d d d "-" d d "-" d d
                                            "\\) " d d ":" d d
                                            "\\) \\(.+\\)$")))))
        (cur-date nil)
        (cur-task nil)
        (cur-start nil)
        (tasks (make-hash-table :test 'equal))
        (days-tasks nil)
        (by-date nil))
    (goto-char b)
    (while (re-search-forward worklog-line-re e t)
      (let ((task (match-string 3))
            (date (match-string 2))
            (task-time (worklog-parse-date/time
                        ;; normal worklog format lacks seconds
                        (concat (match-string 1) ":00"))))
        (cond ((string= "login" task)
               (setq cur-date date
                     days-tasks (make-hash-table :test 'equal)
                     worklog-logged-in t))
              ((string= "logout" task)
               (push (cons cur-date days-tasks) by-date)
               (setq cur-date nil
                     days-tasks nil
                     worklog-logged-in nil))
              ((or (string= "stop" task)
                   (string= "done" task))
               (let ((so-far (gethash cur-task tasks))
                     (so-far-today (gethash cur-task days-tasks))
                     ;; assume all durations less than 2^16 seconds (18 hours)
                     (dur (cadr (worklog-time-diff task-time cur-start))))
                 (setf (gethash cur-task tasks)      (cons dur so-far))
                 (setf (gethash cur-task days-tasks) (cons dur so-far-today))
                 (setq cur-task nil)))
              (t (setq cur-task task
                       cur-start task-time)
                 (push task worklog-task-history)))))
    (when cur-date                      ; ongoing day, but not ongoing tasks
      (push (cons cur-date days-tasks) by-date))
    (list tasks by-date)))              ; `by-date' most-recent-first

(defun worklog-sum-to-hours-1 (seconds)
  "Take a list of seconds worked on a task and calculate the ammount
of hours and minutes worked."
  (let ((total (format "%2.2f" (/ seconds 60.0 60.0))))
    (if (not worklog-use-minutes)
        total
      ;; Perhaps this can be done more efficiently???
      (let* ((index (string-match "\\." total))
             (percent (substring total (1+ index)))
             (hours (substring total 0 index))
             (minutes 0))
        (setq minutes (format "%02.0f" (* 0.6 (string-to-number percent))))
        (concat hours "." minutes)
        ))))

(defun worklog-sum-to-hours (seconds-list)
  "Take a list of seconds worked on a task and calculate the ammount
of hours and minutes worked."
  (worklog-sum-to-hours-1 (apply #'+ seconds-list)))

(provide 'worklog)
 
;;; worklog.el ends here


