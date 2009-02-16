;;; Saved through ges-version 0.3.3dev at 2003-07-29 15:35
;;; ;;; From: Kevin Rodgers <ihs_4664@yahoo.com>
;;; ;;; Subject: goto-last-change.el 1.1
;;; ;;; Newsgroups: gnu.emacs.sources
;;; ;;; Date: Tue, 29 Jul 2003 13:18:40 -0600

;;; [1. text/plain]
;;; Thanks to Dan Nicolaescu, who wrote:
;;;  > I have a suggestion to make the function even more useful:
;;;  >   -when called the first time it would do what it does now, go to the
;;;  >   location of the last change
;;;  >   -when called again with no other intervening command calls it would
;;;  >   position the point to the location of the change before last
;;;  >   and so on, cycling through all the change locations.

;;; -- 
;;; Kevin Rodgers

;;; [2. text/plain; goto-last-change.el]
;;; ;;; -*-unibyte: t; coding: iso-8859-1;-*-

;;; goto-last-change.el --- Move point through buffer-undo-list positions

;; Copyright � 2003 Kevin Rodgers

;; Author: Kevin Rodgers <ihs_4664@yahoo.com>
;; Created: 17 Jun 2003
;; Version: $Revision: 1.1 $
;; Keywords: convenience
;; RCS: $Id: goto-last-change.el,v 1.1 2003/07/29 19:06:39 kevinr Exp kevinr $

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;; Commentary:

;; After installing goto-last-change.el in a `load-path' directory and
;; compiling it with `M-x byte-compile-file', load it with
;; 	(require 'goto-last-change)
;; or autoload it with
;; 	(autoload 'goto-last-change "goto-last-change"
;; 	  "Set point to the position of the last change." t)
;; 
;; You may also want to bind a key to `M-x goto-last-change', e.g.
;; 	(global-set-key "\C-x\C-\\" 'goto-last-change)

;; goto-last-change.el was written in response to to the following:
;; 
;; From: Dan Jacobson <jidanni@jidanni.org>
;; Newsgroups: gnu.emacs.bug
;; Subject: function to go to spot of last change
;; Date: Sun, 15 Jun 2003 00:15:08 +0000 (UTC)
;; Sender: news <news@main.gmane.org>
;; Message-ID: <mailman.7910.1055637181.21513.bug-gnu-emacs@gnu.org>
;; NNTP-Posting-Host: monty-python.gnu.org
;; 
;; 
;; Why of course, a function to get the user to the spot of last changes
;; in the current buffer(s?), that's what emacs must lack.
;; 
;; How many times have you found yourself mosying [<-not in spell
;; checker!?] thru a file when you wonder, where the heck was I just
;; editing?  Well, the best you can do is hit undo, ^F, and undo again,
;; to get back.  Hence the "burning need" for the additional function,
;; which you might name the-jacobson-memorial-function, due to its brilliance.
;; -- 
;; http://jidanni.org/ Taiwan(04)25854780

;;; Code:
(provide 'goto-last-change)

(or (fboundp 'last)			; Emacs 20
    (require 'cl))			; Emacs 19

(defvar goto-last-change-undo nil
  "The `buffer-undo-list' entry of the previous \\[goto-last-change] command.")
(make-variable-buffer-local 'goto-last-change-undo)

;;;###autoload
(defun goto-last-change (&optional mark-point)
  "Set point to the position of the last change.
Consecutive calls set point to the position of the previous change.
With a prefix arg (optional arg MARK-POINT non-nil), set mark so \
\\[exchange-point-and-mark]
will return point to the current position."
  (interactive "P")
  ;; (or (buffer-modified-p)
  ;;     (error "Buffer not modified"))
  (and (eq buffer-undo-list t)
       (error "No undo information in this buffer"))
  (if mark-point (push-mark))
  (let ((position nil)
	(undo-list (if (and (eq this-command last-command)
			    goto-last-change-undo)
		       (cdr (memq goto-last-change-undo buffer-undo-list))
		     buffer-undo-list))
	undo)
    (while undo-list
      (setq undo (car undo-list))
      (cond ((and (consp undo) (integerp (car undo)) (integerp (cdr undo)))
	     ;; (BEG . END)
	     (setq position (cdr undo)
		   undo-list '()))
	    ((and (consp undo) (stringp (car undo))) ; (TEXT . POSITION)
	     (setq position (abs (cdr undo))
		   undo-list '()))
	    ((and (consp undo) (eq (car undo) t))) ; (t HIGH . LOW)
	    ((and (consp undo) (null (car undo)))
	     ;; (nil PROPERTY VALUE BEG . END)
	     (setq position (cdr (last undo))
		   undo-list '()))
	    ((and (consp undo) (markerp (car undo)))) ; (MARKER . DISTANCE)
	    ((integerp undo))		; POSITION
	    ((null undo))		; nil
	    (t (error "Invalid undo entry: %s" undo)))
      (setq undo-list (cdr undo-list)))
    (cond (position
	   (setq goto-last-change-undo undo)
	   (goto-char position))
	  ((and (eq this-command last-command)
		goto-last-change-undo)
	   (setq goto-last-change-undo nil)
	   (error "No further undo information"))
	  (t
	   (setq goto-last-change-undo nil)
	   (error "Buffer not modified")))))

;; (global-set-key "\C-x\C-\\" 'goto-last-change)

;;; goto-last-change.el ends here


