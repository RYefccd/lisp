;;; w3-java.el --- Rudimentary java support
;; Author: $Author: wmperry $
;; Created: $Date: 1999/12/05 08:36:07 $
;; Version: $Revision: 1.2 $
;; Keywords: hypermedia, scripting

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Copyright (c) 1999 Free Software Foundation, Inc.
;;;
;;; This file is part of GNU Emacs.
;;;
;;; GNU Emacs is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; GNU Emacs is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Emacs; see the file COPYING.  If not, write to the
;;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;;; Boston, MA 02111-1307, USA.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'mailcap)

(defgroup w3-java nil
  "Emacs/W3 Java Runtime support"
  :prefix "w3-java"
  :group 'w3)

(defcustom w3-java-vm-program "hotjava"
  "*The program name of the Java virtual machine."
  :type '(choice (string :tag "External program")
		 (function :tag "Lisp function"))
  :group 'w3-java)

(defcustom w3-java-vm-arguments '(file)
  "*Arguments that should be passed to the program `w3-java-vm-program'.
The special symbol 'file may be used in the list of arguments and will
be replaced with the name of a file containing the commands to run a
Java applet."
  :type 'list
  :group 'w3-java)

(defun w3-java-run-applet (options params)
  (let ((file (mailcap-generate-unique-filename "%s-runjava.html")))
    (save-excursion
      (set-buffer (get-buffer-create " *java*"))
      (erase-buffer)
      (insert "<html>\n"
	      " <head>\n"
	      "  <title>Emacs/W3 Java Application</title>\n"
	      " </head>\n"
	      " <body>\n"
	      "  <p>\n"
	      "   This page was automatically generated by Emacs/W3 to\n"
	      "   run this Java applet.  Any problems with the HTML should\n"
	      "   be referred to <a href='mailto:w3-bugs@xemacs.org'>\n"
	      "   the Emacs/W3 bug list</a>.\n"
	      "  </p>\n"
	      "  <hr>\n"
	      "  <applet "
	      (mapconcat (lambda (x) (format "%s=\"%s\"" (car x) (cdr x))) options " ")
	      ">\n"
	      (mapconcat (lambda (x) (format "   <param name=\"%s\" value=\"%s\">" (car x) (cdr x))) params "\n")
	      "  </applet>\n"
	      " </body>\n"
	      "</html>\n")
      (write-region (point-min) (point-max) file)

      (if (stringp w3-java-vm-program)
	  (let ((process-connection-type nil)
		(proc nil))
	    (setq proc (eval
			(`
			 (start-process name buffer w3-java-vm-program
					(,@ w3-java-vm-arguments)))))
	    (process-kill-without-query proc)
	    proc)
	(eval (` (funcall w3-java-vm-program
			  (,@ w3-java-vm-arguments))))))))

(provide 'w3-java)