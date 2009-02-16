;;; ethiopic.el --- support for Ethiopic	-*- coding: utf-8-emacs; -*-

;; Copyright (C) 1997  Free Software Foundation, Inc.
;; Copyright (C) 1995, 2001, 2006
;;   National Institute of Advanced Industrial Science and Technology (AIST)
;;   Registration Number H14PRO021

;; Keywords: multilingual, Ethiopic

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;; Author: TAKAHASHI Naoto <ntakahas@m17n.org>

;;; Commentary:

;;; Code:

(define-ccl-program ccl-encode-ethio-font
  '(0
    ;; In:  R0:ethiopic (not checked)
    ;;      R1:position code 1
    ;;      R2:position code 2
    ;; Out: R1:font code point 1
    ;;      R2:font code point 2
    ((r1 -= 33)
     (r2 -= 33)
     (r1 *= 94)
     (r2 += r1)
     (if (r2 < 256)
	 (r1 = #x12)
       (if (r2 < 448)
	   ((r1 = #x13) (r2 -= 256))
	 ((r1 = #xfd) (r2 -= 208))
	 ))))
  "CCL program to encode an Ethiopic code to code point of Ethiopic font.")

(setq font-ccl-encoder-alist
      (cons (cons "ethiopic" ccl-encode-ethio-font) font-ccl-encoder-alist))

(set-language-info-alist
 "Ethiopic" '((setup-function . setup-ethiopic-environment-internal)
	      (exit-function . exit-ethiopic-environment)
	      (charset ethiopic)
	      (coding-system utf-8-emacs)
	      (coding-priority utf-8-emacs)
	      (input-method . "ethiopic")
	      (features ethio-util)
	      (sample-text . "ፊደል")
	      (documentation .
"This language envrironment provides these function key bindings:
    [f3]   ethio-fidel-to-sera-buffer
    [S-f3] ethio-fidel-to-sera-region
    [C-f3] ethio-fidel-to-sera-marker

    [f4]   ethio-sera-to-fidel-buffer
    [S-f4] ethio-sera-to-fidel-region
    [C-f4] ethio-sera-to-fidel-marker

    [S-f5] ethio-toggle-punctuation
    [S-f6] ethio-modify-vowel
    [S-f7] ethio-replace-space

    [S-f9] ethio-replace-space
    [C-f9] ethio-toggle-space"
)))

;; For automatic composition
(aset composition-function-table ?���� 'ethio-composition-function)
(aset composition-function-table ?፟ 'ethio-composition-function)

(provide 'ethiopic)

;;; arch-tag: e81329d9-1286-43ba-92fd-54ce5c7b213c
;;; ethiopic.el ends here