;;; emacspeak-perl.el --- Speech enable Perl Mode 
;;; $Id: emacspeak-perl.el 4151 2006-08-30 00:44:57Z tv.raman.tv $
;;; $Author: tv.raman.tv $ 
;;; DescriptionEmacspeak extensions for perl-mode
;;; Keywords:emacspeak, audio interface to emacs perl
;;{{{  LCD Archive entry: 

;;; LCD Archive Entry:
;;; emacspeak| T. V. Raman |raman@cs.cornell.edu 
;;; A speech interface to Emacs |
;;; $Date: 2006-08-29 17:44:57 -0700 (Tue, 29 Aug 2006) $ |
;;;  $Revision: 4151 $ | 
;;; Location undetermined
;;;

;;}}}
;;{{{  Copyright:
;;;Copyright (C) 1995 -- 2006, T. V. Raman 
;;; Copyright (c) 1994, 1995 by Digital Equipment Corporation.
;;; All Rights Reserved. 
;;;
;;; This file is not part of GNU Emacs, but the same permissions apply.
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
;;; along with GNU Emacs; see the file COPYING.  If not, write to
;;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;}}}

;;{{{  Introduction:

;;; Provide additional advice to perl-mode 

;;}}}
;;{{{ requires
(require 'emacspeak-preamble)

;;}}}
;;{{{  Advice electric insertion to talk:

(defadvice electric-perl-terminator  (after emacspeak pre act comp )
  "Speak what you inserted."
  (when (interactive-p)
    (emacspeak-speak-this-char last-input-char)))

;;}}}
;;{{{  Program structure:

(defadvice mark-perl-function (after emacspeak pre act comp)
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'mark-object)
    (message "Marked procedure")))

(defadvice perl-beginning-of-function (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

(defadvice perl-end-of-function (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)))

;;}}}

(provide  'emacspeak-perl)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; byte-compile-dynamic: t
;;; end: 

;;}}}
