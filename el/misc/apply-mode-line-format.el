;;; apply-mode-line-format.el --- Return `mode-line-format' as a string
;;; -*-unibyte: t; coding: iso-8859-1;-*-

;; Copyright � 2002,2005 Kevin Rodgers

;; Author: Kevin Rodgers <ihs_4664@yahoo.com>
;; Created: 19 Mar 2002
;; Version: $Revision: 1.4 $
;; Keywords: modeline
;; RCS $Id: apply-mode-line-format.el,v 1.4 2005/06/03 22:45:38 kevinr Exp $

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

;; Emacs 22 provides the format-mode-line function, which obsoletes this
;; package.

;; But Emacs 21 doesn't provide distinct functions for (1) generating a
;; string from `mode-line-format' and (2) displaying it in the mode
;; line.  In src/xdisp.c, display_mode_element() does both, and it
;; doesn't have a Lisp binding.  apply-mode-line-format.el defines an
;; eponymous Lisp function that returns any `mode-line-format' template
;; as a string.

;;; Code:

(provide 'apply-mode-line-format)

(defun apply-mode-line-format (format &optional width)
  "Return the string generated by FORMAT, a template like `mode-line-format'."
  (let ((result
	 (cond ((stringp format)
		(apply-mode-line-format-string format width))
	       ((symbolp format)
		(cond 	((not (boundp format)) "") ; ignore (Emacs 21)
			((eq (symbol-value format) t) "") ; ignore
			((eq (symbol-value format) nil) "") ; ignore
			((stringp (symbol-value format)) ; verbatim
			 (symbol-value format))
			(t (apply-mode-line-format (symbol-value format) ; recur
						   width))))
	       ((listp format)
		(cond ((symbolp (car format))
                       (cond ((eq (car format) :eval) ; Emacs 21
			      (condition-case nil
                                  (eval (cadr format))
                                (error "")))
                             ((keywordp (car format)) ; Emacs 21
                              (if (cdr format)
                                  (apply-mode-line-format (cadr format))
                                "*invalid*"))
                             ((boundp (car format)) ; Emacs 21
                              (if (symbol-value (car format))
                                  (apply-mode-line-format (cadr format))
                                (apply-mode-line-format (car (cddr format)))))
                             (t "")))
		      ((or (stringp (car format)) (consp (car format)))
		       (concat (apply-mode-line-format (car format) width)
			       (apply 'concat
				      (mapcar (lambda (subformat)
						(apply-mode-line-format subformat
									width))
					      (cdr format)))))
		      ((integerp (car format))
		       (apply-mode-line-format (cdr format) (car format)))
		      (t (error "invalid format: %s" format))))
	       (t (error "invalid format: %s" format)))))
    (apply-mode-line-format-width result (or width (- (window-width))))))

(defun apply-mode-line-format-string (format &optional width)
  "Like `apply-mode-line-format', but FORMAT must be a string."
  (let ((i 0)
	(result "")
	(length (length format)))
    (while (string-match "%\\(-?[0-9]*\\)\\(.\\)" format i)
      (let ((f (elt format (match-beginning 2)))
	    (w (if (> (match-end 1) (match-beginning 1))
		   (string-to-int (match-string 1 format)))))
	(setq result
	      (concat result
		      (substring format i (match-beginning 0))
		      (apply-mode-line-format-width
		       (cond ((= f ?b) (buffer-name))
			     ((= f ?f) buffer-file-name)
			     ((= f ?F)	; Emacs 20
			      (or (frame-parameter (selected-frame) 'name)
				  (frame-parameter (selected-frame) 'title)))
			     ((= f ?*)
			      (cond (buffer-read-only "%")
				    ((buffer-modified-p) "*")
				    (t "-")))
			     ((= f ?+)
			      (cond ((buffer-modified-p) "*")
				    (buffer-read-only "%")
				    (t "-")))
			     ((= f ?s)
			      (condition-case nil
                                  (symbol-value (process-status nil))
                                (error "")))
			     ((= f ?l)
			      (let ((i 1)
				    (p (point)))
				(save-match-data
				  (save-excursion
				    (goto-char (point-min))
				    (while (re-search-forward "\n" p t)
				      (setq i (1+ i))))
				  (int-to-string i))))
			     ((= f ?c)
			      (int-to-string (current-column)))
			     ((= f ?p)
			      (cond ((= (window-start) (point-min))
				     (if (= (window-end) (point-max))
					 "All"
				       "Top"))
				    ((= (window-end) (point-max))
				     "Bot")
				    (t (concat (int-to-string
						(round (/ (* 100.0
							     (window-start))
							  (point-max))))
					       "%"))))
			     ((= f ?P)
			      (cond ((= (window-end) (point-max))
				     (if (= (window-start) (point-min))
					 "All"
				       "Bot"))
				    (t (concat (int-to-string
						(round (/ (* 100.0
							     (window-end))
							  (point-max))))
					       "%"
					       (if (= (window-end)
						      (point-max))
						   " Top"
						 "")))))
			     ((= f ?m) mode-name) ; Emacs 20
			     ((= f ?n)
			      (let ((min (point-min))
				    (max (point-max)))
				(save-restriction
				  (widen)
				  (if (or (/= (point-min) min)
					  (/= (point-max) max))
				      " Narrow"
				    ""))))
			     ((= f ?t)	; Emacs 19
			      (if buffer-file-type
				  "B"
				"T"))
			     ((or (= f ?z) (= f ?Z)) ; Emacs 20
			      (concat (if (null window-system)
					  (mapconcat
					   'apply-mode-line-format-coding-system
					   (list (keyboard-coding-system)
						 (terminal-coding-system))
					   ""))
				      (apply-mode-line-format-coding-system
				       buffer-file-coding-system
				       (= f ?Z))))

			     ((= f ?\[)
			      (if (> (recursion-depth) 5)
				  "[[[..."
				(make-string (recursion-depth) ?\[)))
			     ((= f ?\])
			      (if (> (recursion-depth) 5)
				  "...]]]"
				(make-string (recursion-depth) ?\])))
			     ((= f ?%) "%")
			     ((= f ?-)
			      (make-string (window-width) ?-))
			     (t (error "invalid format: %c" f)))
		       w)))
	(setq i (match-end 0))))
    (setq result
	  (concat result (substring format i)))
    (apply-mode-line-format-width result width)))

(defun apply-mode-line-format-coding-system (coding-system-symbol
					     &optional including-eol)
  "Return the mnemonic string for CODING-SYSTEM-SYMBOL.
If INCLUDING-EOL is non-nil, append the end-of-line mnemonic."
  ;; See xdisp.c:decode_mode_spec_coding():
  (let ((coding-system (get coding-system-symbol 'coding-system))
	(eol-type (get coding-system-symbol 'eol-type))
	coding-system-mnemonic
	eol-type-mnemonic)
    (if (vectorp coding-system)
	(progn
	  (if enable-multibyte-characters
	      (setq coding-system-mnemonic
		    (char-to-string (aref coding-system 1))))
	  (cond ((null eol-type)
		 (setq eol-type-mnemonic eol-mnemonic-undecided))
		((vectorp eol-type)
		 (setq eol-type-mnemonic eol-mnemonic-undecided))
		((= eol-type 0)
		 (setq eol-type-mnemonic eol-mnemonic-unix))
		((= eol-type 1)
		 (setq eol-type-mnemonic eol-mnemonic-dos))
		((= eol-type 2)
		 (setq eol-type-mnemonic eol-mnemonic-mac))))
      (progn
	(if enable-multibyte-characters
	    (setq coding-system-mnemonic "-"))
	(setq eol-type-mnemonic eol-mnemonic-undecided)))
    (if including-eol
	(concat coding-system-mnemonic
		(cond ((stringp eol-type-mnemonic) eol-type-mnemonic)
		      ((and (integerp eol-type-mnemonic)
			    (char-valid-p eol-type-mnemonic))
		       (number-to-string eol-type-mnemonic))
		      (t "(*invalid*)")))
      coding-system-mnemonic)))

(defun apply-mode-line-format-width (string width)
  "Pad or truncate STRING according to WIDTH (null, positive, or negative)."
  (cond ((null width) string)
	((zerop width) "")
	((> width 0)
	 (if (< (length string) width)
	     (concat string (make-string (- width (length string)) ? ))
	   string))
	((< width 0)
	 (if (> (length string) (- width))
	     (substring string 0 (- width))
	   string))
	(t (error "invalid width: %s" width))))

;;; apply-mode-line-format.el ends here
