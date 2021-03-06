;;
;; str-arg.el
;; Wed Jun  1 18:02:11 1994
;; Authour: S.Namba
;;

;; Hitting C-c C-z repeatedly copys word(s) one by one towards EOL(EOB)
;; and feed them as `string argument' into Emacs command which requires
;; any string argument.

;; Not inspired by dired-x-find-file.
;; 
;; Originally, get-string-arg-and-call was implemented in my private
;; version of MicoEMACS V30 as C-c (copy-token) around '88 or '89.
;; The MicoEMACS has no dired and I used to C-c C-c ... C-x C-f in the
;; directory list generated by C-x # (forgot the name of the command to
;; get the transient shell command output) ls -[Cl] RET.
;; 
;; I called the `copyed token' `universal string argument' in the
;; document for the MicroEMACS, which was never distributed publicly
;; (godd MicroEMACSen were already distributed, and I had no network
;; connection at that time).
;; 

;; get-string-arg-and-call was written in '94, probably on Nemacs (18.55).

;; key-bind:
(global-set-key "\C-c\C-z" 'get-string-arg-and-call)

(defun get-string-arg-and-call (arg)
  "Get a word or concatenation of words from point, read key sequence, and \
give the word or concatenation as a argument for a command bound to the read \
sequence.
If ARG is present, gives this ARG for second argument for the command."
  (interactive "P")
  (or (looking-at "\\b.")  ;; If in a word, move to the top.
      (backward-word 1))   ;; Always with this sideeffect. Cheap.
  (let* ((count 1) (str-arg (get-str-arg count))
	 (sequence
	  (read-key-sequence 
	   (format
	    "Now type key sequence for the string '%s': " str-arg)))
	 (func (key-binding sequence)))
    ;; While same key for this command is hit,
    ;; trapping this recursiveness, extend concatenation of words to the right.
    (while (eq func 'get-string-arg-and-call) 
      (setq str-arg (get-str-arg (setq count (1+ count))))
      (setq sequence
	    (read-key-sequence 
	     (format "Type key sequence for the string '%s': " str-arg)))
      (setq func
	    (key-binding sequence)))
    (if  (string-equal sequence "\C-g")
	(progn (message "get-string-arg-and-call aborted...") (ding))
      (if arg 
	  (funcall func str-arg arg)
	(funcall func str-arg)))))

(defun get-str-arg (count)
  (mark-word count)
  (buffer-substring (region-beginning) (region-end)))
