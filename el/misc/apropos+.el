;;; apropos+.el --- Extensions to `apropos.el'
;;
;; Filename: apropos+.el
;; Description: Extensions to `apropos.el'
;; Author: Drew Adams
;; Maintainer: Drew Adams
;; Copyright (C) 1996-2006, Drew Adams, all rights reserved.
;; Created: Thu Jun 22 15:07:30 2000
;; Version: 21.0
;; Last-Updated: Fri Jan 13 14:38:31 2006 (-28800 Pacific Standard Time)
;;           By: dradams
;;     Update #: 37
;; URL: http://www.emacswiki.org/cgi-bin/wiki/apropos+.el
;; Keywords: help
;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x
;;
;; Features that might be required by this library:
;;
;;   `apropos'.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; New command `apropos-user-options'.
;;
;;  It only lists user-definable variables.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'apropos)

;;;;;;;;;;;;;;;;;;;;;;;;;


;;;###autoload
(defun apropos-user-options (regexp)
  "Show user variables that match REGEXP."
  (interactive (list (read-string "Apropos user options (regexp): ")))
  (let ((apropos-do-all nil))
    (apropos-variable regexp)))

;;;;;;;;;;;;;;;;;;;;;;;

(provide 'apropos+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; apropos+.el ends here
