;;;;;; Scheme-lookup: lookup documentation for Scheme symbols
;;;;;; Version $Version$

;;; This code is written by Trent W. Buck <trentbuck@gmail.com>
;;; (except where explicitly noted) and placed in the Public Domain.
;;; All warranties are disclaimed.

;;; This implementation uses the info version of MIT/GNU Scheme
;;; Reference Manual; it the info manual to be installed on your
;;; system.  On Debian, you can get it by apt-get installing the
;;; mit-scheme package.

;;; This index was generated with the following shell script
;; info mit-scheme-ref 'Binding index' 2>/dev/null |
;; grep '^\*.*: ' |
;; (read; cat) |
;; sed -e 's/"/\\&/g' |
;; sed -e 's/^\*\ /"/' |
;; sed -e 's/: \(.*\)/"/' |
;; sed -e 's/\\/\\\\/' |
;; grep -v '<[1-9]>"$'

(require 'scheme-lookup)

(defun scheme-lookup-mit-scheme-ref (symbol-name &optional redirect)
  (scheme-lookup-info "mit-scheme-ref" (or redirect symbol-name)))

(put 'scheme-lookup-mit-scheme-ref
     'scheme-lookup-pretty-name
     "MIT/GNU Scheme Reference Manual")

(mapc
 (lambda (x) (scheme-lookup-add-reference (list 'scheme-lookup-mit-scheme-ref x)))
 '("#" "#!optional" "#!rest" "#(" "#\\" "#\\altmode" "#\\backnext"
   "#\\backspace" "#\\call" "#\\linefeed" "#\\newline" "#\\page"
   "#\\return" "#\\rubout" "#\\space" "#\\tab" "#\\U+" "#b" "#d" "#e"
   "#f" "#i" "#o" "#t" "#x" "%delete-dib" "'" "(" "()" ")" "*"
   "*default-pathname-defaults*" "*matcher" "*parser"
   "*parser-canonicalize-symbols?*" "*parser-radix*" "*random-state*"
   "*unparse-with-maximum-readability?*"
   "*unparser-list-breadth-limit*" "*unparser-list-depth-limit*"
   "*unparser-radix*" "*unparser-string-length-limit*" "+" "+inf" ","
   ",@" "-" "-1+" "->namestring" "->pathname" "->truename" "-inf" "."
   "..."  "/" "1+" "1d-table/alist" "1d-table/get" "1d-table/lookup"
   "1d-table/put!"  "1d-table/remove!"  "1d-table?"  "2d-get"
   "2d-get-alist-x" "2d-get-alist-y" "2d-put!"  "2d-remove!"
   "8-bit-alphabet?"  "<" "<=" "<xml-!attlist>" "<xml-!element>"
   "<xml-!entity>" "<xml-!notation>" "<xml-declaration>"
   "<xml-document>" "<xml-dtd>" "<xml-element>" "<xml-external-id>"
   "<xml-parameter-!entity>" "<xml-processing-instructions>"
   "<xml-uninterpreted>" "<xml-unparsed-!entity>" "=" "=>" ">" ">="
   "?"  "\\" "\\f" "\\n" "\\t" "`" "abort" "abs" "access"
   "access-condition" "acos" "activate-window on os2-graphics-device"
   "alist->rb-tree" "alist->wt-tree" "alist-copy" "alist?"
   "allocate-host-address" "alphabet" "alphabet+" "alphabet-"
   "alphabet->char-set" "alphabet->code-points" "alphabet->string"
   "alphabet?"  "alt" "and" "angle" "append" "append!"  "append-map"
   "append-map!"  "append-map*" "append-map*!"  "apply"
   "apply-hook-extra" "apply-hook-procedure" "apply-hook?"
   "ascii->char" "ascii-range->char-set" "asin" "assoc"
   "association-procedure" "assq" "assv" "atan" "beep" "begin"
   "bind-cell-contents!"  "bind-condition-handler"
   "bind-default-condition-handler" "bit-string->signed-integer"
   "bit-string->unsigned-integer" "bit-string-allocate"
   "bit-string-and" "bit-string-and!"  "bit-string-andc"
   "bit-string-andc!"  "bit-string-append" "bit-string-clear!"
   "bit-string-copy" "bit-string-fill!"  "bit-string-length"
   "bit-string-move!"  "bit-string-movec!"  "bit-string-not"
   "bit-string-or" "bit-string-or!"  "bit-string-ref"
   "bit-string-set!"  "bit-string-xor" "bit-string-xor!"
   "bit-string-zero?"  "bit-string=?"  "bit-string?"  "bit-substring"
   "bit-substring-find-next-set-bit" "bit-substring-move-right!"
   "bitmap-from-dib" "bool" "boolean/and" "boolean/or" "boolean=?"
   "boolean?"  "bound-restart" "bound-restarts" "break-on-signals"
   "buffered-input-chars on input port" "buffered-output-chars on
   output port" "byte" "caaaar" "caaadr" "caaar" "caadar" "caaddr"
   "caadr" "caar" "cadaar" "cadadr" "cadar" "caddar" "cadddr" "caddr"
   "cadr" "call-with-binary-input-file" "call-with-binary-output-file"
   "call-with-current-continuation" "call-with-input-file"
   "call-with-output-file" "call-with-output-string"
   "call-with-temporary-file-pathname" "call-with-values"
   "call-with-wide-output-string" "canonical-host-name" "capture-image
   on os2-graphics-device" "capture-syntactic-environment" "car"
   "case" "cd" "cdaaar" "cdaadr" "cdaar" "cdadar" "cdaddr" "cdadr"
   "cdar" "cddaar" "cddadr" "cddar" "cdddar" "cddddr" "cdddr" "cddr"
   "cdr" "ceiling" "ceiling->exact" "cell-contents" "cell?"  "char"
   "char*" "char->ascii" "char->digit" "char->integer" "char->name"
   "char-alphabetic?"  "char-alphanumeric?"  "char-ascii?"
   "char-bits" "char-bits-limit" "char-ci" "char-ci<=?"  "char-ci<?"
   "char-ci=?"  "char-ci>=?"  "char-ci>?"  "char-code"
   "char-code-limit" "char-downcase" "char-graphic?"
   "char-in-alphabet?"  "char-integer-limit" "char-lower-case?"
   "char-numeric?"  "char-ready?"  "char-ready? on input port"
   "char-set" "char-set->alphabet" "char-set-difference"
   "char-set-intersection" "char-set-invert" "char-set-member?"
   "char-set-members" "char-set-union" "char-set:alphabetic"
   "char-set:alphanumeric" "char-set:graphic" "char-set:lower-case"
   "char-set:not-graphic" "char-set:not-whitespace" "char-set:numeric"
   "char-set:standard" "char-set:upper-case" "char-set:whitespace"
   "char-set=?"  "char-set?"  "char-standard?"  "char-upcase"
   "char-upper-case?"  "char-whitespace?"  "char<=?"  "char<?"
   "char=?"  "char>=?"  "char>?"  "char?"  "chars->char-set"
   "chars-remaining on input port" "circular-list" "clear"
   "close-all-open-files" "close-input-port" "close-output-port"
   "close-port" "close-syntax" "close-tcp-server-socket"
   "code-points->alphabet" "color?"  "color? on os2-graphics-device"
   "compiled-procedure?"  "complex?"  "compound-procedure?"
   "conc-name" "cond" "cond-expand" "condition-accessor"
   "condition-constructor" "condition-predicate" "condition-signaller"
   "condition-type/error?"  "condition-type/field-names"
   "condition-type/generalizations" "condition-type:arithmetic-error"
   "condition-type:bad-range-argument" "condition-type:breakpoint"
   "condition-type:control-error" "condition-type:datum-out-of-range"
   "condition-type:derived-file-error"
   "condition-type:derived-port-error" "condition-type:divide-by-zero"
   "condition-type:error" "condition-type:file-error"
   "condition-type:file-operation-error"
   "condition-type:floating-point-overflow"
   "condition-type:floating-point-underflow"
   "condition-type:illegal-datum" "condition-type:inapplicable-object"
   "condition-type:macro-binding" "condition-type:no-such-restart"
   "condition-type:not-loading" "condition-type:port-error"
   "condition-type:primitive-procedure-error"
   "condition-type:serious-condition"
   "condition-type:simple-condition" "condition-type:simple-error"
   "condition-type:simple-warning"
   "condition-type:subprocess-abnormal-termination"
   "condition-type:subprocess-signalled"
   "condition-type:subprocess-stopped"
   "condition-type:system-call-error"
   "condition-type:unassigned-variable"
   "condition-type:unbound-variable" "condition-type:variable-error"
   "condition-type:warning" "condition-type:wrong-number-of-arguments"
   "condition-type:wrong-type-argument"
   "condition-type:wrong-type-datum" "condition-type?"
   "condition/continuation" "condition/error?"
   "condition/report-string" "condition/restarts" "condition/type"
   "condition?"  "conjugate" "cons" "cons*" "cons-stream"
   "console-i/o-port" "console-input-port" "console-output-port"
   "constructor" "continuation?"  "continue" "copier" "copy-area on
   win32-graphics-device" "copy-area on x-graphics-device"
   "copy-bitmap" "copy-file" "cos" "create-dib" "create-image on
   graphics-device" "crop-bitmap" "current-file-time"
   "current-input-port" "current-output-port" "current-parser-macros"
   "day-of-week/long-string" "day-of-week/short-string"
   "deactivate-window on os2-graphics-device" "debug"
   "decoded-time->file-time" "decoded-time->string"
   "decoded-time->universal-time" "decoded-time/date-string"
   "decoded-time/day" "decoded-time/day-of-week"
   "decoded-time/daylight-savings-time?"  "decoded-time/hour"
   "decoded-time/minute" "decoded-time/month" "decoded-time/second"
   "decoded-time/time-string" "decoded-time/year" "decoded-time/zone"
   "default-object?"  "define" "define-*matcher-expander"
   "define-*matcher-macro" "define-*parser-expander"
   "define-*parser-macro" "define-color on os2-graphics-device"
   "define-color on win32-graphics-device" "define-record-type"
   "define-similar-windows-type" "define-structure" "define-syntax"
   "define-windows-type" "del-assoc" "del-assoc!"  "del-assq"
   "del-assq!"  "del-assv" "del-assv!"  "delay" "delete" "delete!"
   "delete-association-procedure" "delete-dib" "delete-directory"
   "delete-file" "delete-file-no-errors" "delete-matching-items"
   "delete-matching-items!"  "delete-member-procedure" "delq" "delq!"
   "delv" "delv!"  "denominator" "desktop-size on os2-graphics-device"
   "dib" "dib-blt" "dib-from-bitmap" "dib-height"
   "dib-set-pixels-unaligned" "dib-width" "digit->char"
   "directory-namestring" "directory-pathname"
   "directory-pathname-as-file" "directory-pathname?"
   "directory-read" "discard-char on input port" "discard-chars on
   input port" "discard-events on os2-graphics-device"
   "discard-matched" "discard-parser-buffer-head!"
   "discretionary-flush-output" "discretionary-flush-output on output
   port" "display" "do" "draw-arc" "draw-arc on x-graphics-device"
   "draw-circle" "draw-circle on x-graphics-device" "draw-ellipse on
   win32-graphics-device" "draw-image on graphics-device" "draw-lines
   on os2-graphics-device" "draw-subimage on graphics-device"
   "dynamic-wind" "eighth" "else" "encapsulate" "end-of-input"
   "enough-namestring" "enough-pathname" "entity-extra"
   "entity-procedure" "entity?"  "enumerate-graphics-types"
   "environment" "environment-assign!"  "environment-assignable?"
   "environment-assigned?"  "environment-bindings"
   "environment-bound-names" "environment-bound?"
   "environment-definable?"  "environment-define"
   "environment-define-macro" "environment-has-parent?"
   "environment-lookup" "environment-lookup-macro"
   "environment-macro-names" "environment-parent"
   "environment-reference-type" "environment?"  "eof-object?"  "eof?
   on input port" "epoch" "eq-hash" "eq-hash-mod" "eq?"  "equal-hash"
   "equal-hash-mod" "equal?"  "eqv-hash" "eqv-hash-mod" "eqv?"
   "er-macro-transformer" "error" "error-irritant/noise"
   "error:bad-range-argument" "error:datum-out-of-range"
   "error:derived-file" "error:derived-port" "error:divide-by-zero"
   "error:file-operation-error" "error:no-such-restart"
   "error:wrong-number-of-arguments" "error:wrong-type-argument"
   "error:wrong-type-datum" "eval" "even?"  "exact->inexact"
   "exact-integer?"  "exact-nonnegative-integer?"  "exact-rational?"
   "exact?"  "except-last-pair" "except-last-pair!"  "exp" "expt"
   "extend-top-level-environment" "false" "false?"  "fifth"
   "file-access" "file-access-time" "file-access-time-direct"
   "file-access-time-indirect" "file-attributes"
   "file-attributes-direct" "file-attributes-indirect"
   "file-attributes/access-time" "file-attributes/allocated-length"
   "file-attributes/change-time" "file-attributes/gid"
   "file-attributes/inode-number" "file-attributes/length"
   "file-attributes/mode-string" "file-attributes/modes"
   "file-attributes/modification-time" "file-attributes/n-links"
   "file-attributes/type" "file-attributes/uid" "file-directory?"
   "file-eq?"  "file-executable?"  "file-exists-direct?"
   "file-exists-indirect?"  "file-exists?"  "file-length" "file-modes"
   "file-modification-time" "file-modification-time-direct"
   "file-modification-time-indirect" "file-namestring" "file-pathname"
   "file-readable?"  "file-regular?"  "file-symbolic-link?"
   "file-time->global-decoded-time" "file-time->global-time-string"
   "file-time->local-decoded-time" "file-time->local-time-string"
   "file-time->universal-time" "file-touch" "file-type-direct"
   "file-type-indirect" "file-writeable?"  "fill-circle" "fill-circle
   on x-graphics-device" "fill-polygon" "fill-polygon on
   win32-graphics-device" "find-color on os2-graphics-device"
   "find-color on win32-graphics-device" "find-matching-item"
   "find-module" "find-restart" "first" "fix:*" "fix:+" "fix:-"
   "fix:-1+" "fix:1+" "fix:<" "fix:<=" "fix:=" "fix:>" "fix:>="
   "fix:and" "fix:andc" "fix:divide" "fix:fixnum?"  "fix:gcd"
   "fix:lsh" "fix:negative?"  "fix:not" "fix:or" "fix:positive?"
   "fix:quotient" "fix:remainder" "fix:xor" "fix:zero?"  "flo:*"
   "flo:+" "flo:-" "flo:/" "flo:<" "flo:=" "flo:>" "flo:abs"
   "flo:acos" "flo:asin" "flo:atan" "flo:atan2" "flo:ceiling"
   "flo:ceiling->exact" "flo:cos" "flo:exp" "flo:expt" "flo:finite?"
   "flo:flonum?"  "flo:floor" "flo:floor->exact" "flo:log"
   "flo:negate" "flo:negative?"  "flo:positive?"  "flo:random-unit"
   "flo:round" "flo:round->exact" "flo:sin" "flo:sqrt" "flo:tan"
   "flo:truncate" "flo:truncate->exact" "flo:zero?"
   "flonum-parser-fast?"  "flonum-unparser-cutoff" "floor"
   "floor->exact" "fluid-let" "flush-output" "flush-output on output
   port" "fold-left" "fold-right" "font-structure on
   x-graphics-device" "for-all?"  "for-each" "force" "format"
   "format-error-message" "fourth" "fresh-line" "fresh-line on output
   port" "gcd" "gdi32.dll" "ge" "general-car-cdr"
   "generate-uninterned-symbol" "get-default on x-graphics-device"
   "get-host-by-address" "get-host-by-name" "get-host-name"
   "get-output-string" "get-parser-buffer-pointer"
   "get-parser-buffer-tail" "get-universal-time" "global-decoded-time"
   "global-parser-macros" "graphics-bind-drawing-mode"
   "graphics-bind-line-style" "graphics-clear" "graphics-close"
   "graphics-coordinate-limits" "graphics-device-coordinate-limits"
   "graphics-disable-buffering" "graphics-drag-cursor"
   "graphics-draw-line" "graphics-draw-point" "graphics-draw-text"
   "graphics-enable-buffering" "graphics-erase-point" "graphics-flush"
   "graphics-move-cursor" "graphics-operation"
   "graphics-reset-clip-rectangle" "graphics-set-clip-rectangle"
   "graphics-set-coordinate-limits" "graphics-set-drawing-mode"
   "graphics-set-line-style" "graphics-type-available?"
   "guarantee-i/o-port" "guarantee-input-port" "guarantee-output-port"
   "guarantee-port" "handle" "hard-link-file" "hash"
   "hash-table->alist" "hash-table/clean!"  "hash-table/clear!"
   "hash-table/constructor" "hash-table/count" "hash-table/datum-list"
   "hash-table/entries-list" "hash-table/entries-vector"
   "hash-table/entry-datum" "hash-table/entry-key"
   "hash-table/entry-valid?"  "hash-table/for-each" "hash-table/get"
   "hash-table/key-hash" "hash-table/key-list" "hash-table/key=?"
   "hash-table/lookup" "hash-table/make" "hash-table/make-entry"
   "hash-table/put!"  "hash-table/rehash-size"
   "hash-table/rehash-threshold" "hash-table/remove!"
   "hash-table/set-entry-datum!"  "hash-table/size" "hash-table?"
   "hbitmap" "hbrush" "hcursor" "hdc" "hicon" "hide-window on
   os2-graphics-device" "hinstance" "hmenu" "host-address-any"
   "host-address-loopback" "host-namestring" "host=?"  "host?"
   "hpalette" "hpen" "hrgn" "hwnd" "i/o-port-type?"  "i/o-port?"
   "identifier=?"  "identifier?"  "if" "ignore-error" "ignore-errors"
   "imag-part" "image/destroy" "image/fill-from-byte-vector"
   "image/height" "image/width" "image?"
   "implemented-primitive-procedure?"  "inexact->exact" "inexact?"
   "init-file-pathname" "initial-offset" "input" "input-buffer-size"
   "input-buffer-size on input port" "input-line-translation"
   "input-port->parser-buffer" "input-port-type?"
   "input-port/char-ready?"  "input-port/discard-char"
   "input-port/discard-chars" "input-port/peek-char"
   "input-port/read-char" "input-port/read-string"
   "input-port/read-substring" "input-port?"  "int" "integer->char"
   "integer-ceiling" "integer-divide" "integer-divide-quotient"
   "integer-divide-remainder" "integer-floor" "integer-round"
   "integer-truncate" "integer?"  "interaction-i/o-port" "intern"
   "intern-soft" "internal-time/seconds->ticks"
   "internal-time/ticks->seconds" "interpreter-environment?"
   "invoke-restart" "invoke-restart-interactively"
   "keep-matching-items" "keep-matching-items!"  "kernel32.dll"
   "keyword-constructor" "lambda" "last-pair" "lcm" "length" "let"
   "let*" "let*-syntax" "let-syntax" "letrec" "letrec-syntax"
   "link-variables" "list" "list->stream" "list->string"
   "list->vector" "list-copy" "list-deletor" "list-deletor!"
   "list-head" "list-ref" "list-search-negative"
   "list-search-positive" "list-tail" "list-transform-negative"
   "list-transform-positive" "list?"  "load-bitmap on
   win32-graphics-device" "load-option" "local-decoded-time"
   "local-host" "log" "long" "lower-window on os2-graphics-device"
   "magnitude" "make-1d-table" "make-apply-hook" "make-bit-string"
   "make-cell" "make-char" "make-circular-list" "make-condition"
   "make-condition-type" "make-decoded-time" "make-directory"
   "make-entity" "make-eof-object" "make-eq-hash-table"
   "make-equal-hash-table" "make-eqv-hash-table"
   "make-graphics-device" "make-initialized-vector" "make-list"
   "make-parser-macros" "make-pathname" "make-polar" "make-port"
   "make-port-type" "make-primitive-procedure" "make-random-state"
   "make-rb-tree" "make-record-type" "make-rectangular"
   "make-root-top-level-environment" "make-string"
   "make-string-hash-table" "make-syntactic-closure"
   "make-synthetic-identifier" "make-vector" "make-wide-string"
   "make-wt-tree" "make-wt-tree-type" "make-xml-!attlist"
   "make-xml-!element" "make-xml-!entity" "make-xml-!notation"
   "make-xml-declaration" "make-xml-document" "make-xml-dtd"
   "make-xml-element" "make-xml-external-id"
   "make-xml-parameter-!entity" "make-xml-processing-instructions"
   "make-xml-uninterpreted" "make-xml-unparsed-!entity" "map" "map*"
   "map-window on x-graphics-device" "match"
   "match-parser-buffer-char" "match-parser-buffer-char-ci"
   "match-parser-buffer-char-ci-no-advance"
   "match-parser-buffer-char-in-set"
   "match-parser-buffer-char-in-set-no-advance"
   "match-parser-buffer-char-no-advance"
   "match-parser-buffer-not-char" "match-parser-buffer-not-char-ci"
   "match-parser-buffer-not-char-ci-no-advance"
   "match-parser-buffer-not-char-no-advance"
   "match-parser-buffer-string" "match-parser-buffer-string-ci"
   "match-parser-buffer-string-ci-no-advance"
   "match-parser-buffer-string-no-advance"
   "match-parser-buffer-substring" "match-parser-buffer-substring-ci"
   "match-parser-buffer-substring-ci-no-advance"
   "match-parser-buffer-substring-no-advance"
   "match-utf8-char-in-alphabet" "max" "maximize-window on
   os2-graphics-device" "measure-interval" "member" "member-procedure"
   "memq" "memv" "merge-pathnames" "merge-sort" "merge-sort!"
   "microcode-id/operating-system"
   "microcode-id/operating-system-name"
   "microcode-id/operating-system-variant" "min" "minimize-window on
   os2-graphics-device" "modulo" "month/long-string" "month/max-days"
   "month/short-string" "move-window on win32-graphics-device"
   "move-window on x-graphics-device" "muffle-warning" "name->char"
   "named" "named-lambda" "NaN" "nearest-repl/environment" "negative?"
   "newline" "nil" "ninth" "noise" "not" "not-char" "not-char-ci"
   "notification-output-port" "nt-file-mode/archive"
   "nt-file-mode/compressed" "nt-file-mode/directory"
   "nt-file-mode/hidden" "nt-file-mode/normal"
   "nt-file-mode/read-only" "nt-file-mode/system"
   "nt-file-mode/temporary" "null?"  "number->string" "number-wt-type"
   "number?"  "numerator" "object-hash" "object-hashed?"
   "object-unhash" "odd?"  "open-binary-i/o-file"
   "open-binary-input-file" "open-binary-output-file" "open-dib"
   "open-i/o-file" "open-input-file" "open-input-string"
   "open-output-file" "open-output-string" "open-tcp-server-socket"
   "open-tcp-stream-socket" "open-wide-input-string"
   "open-wide-output-string" "or" "os/hostname"
   "os2-file-mode/archived" "os2-file-mode/directory"
   "os2-file-mode/hidden" "os2-file-mode/read-only"
   "os2-file-mode/system" "output" "output-buffer-size"
   "output-buffer-size on output port" "output-line-translation"
   "output-port-type?"  "output-port/discretionary-flush-output"
   "output-port/flush-output" "output-port/fresh-line"
   "output-port/write-char" "output-port/write-string"
   "output-port/write-substring" "output-port/x-size"
   "output-port/y-size" "output-port?"  "pair?"  "parse-namestring"
   "parse-xml-document" "parser-buffer-pointer-index"
   "parser-buffer-pointer-line" "parser-buffer-pointer?"
   "parser-buffer-position-string" "parser-buffer-ref"
   "parser-buffer?"  "parser-macros?"  "pathname-absolute?"
   "pathname-as-directory" "pathname-default"
   "pathname-default-device" "pathname-default-directory"
   "pathname-default-name" "pathname-default-type"
   "pathname-default-version" "pathname-device" "pathname-directory"
   "pathname-host" "pathname-name" "pathname-new-device"
   "pathname-new-directory" "pathname-new-name" "pathname-new-type"
   "pathname-new-version" "pathname-simplify" "pathname-type"
   "pathname-version" "pathname-wild?"  "pathname=?"  "pathname?"
   "peek-char" "peek-char on input port" "peek-parser-buffer-char"
   "port-type/operation" "port-type/operation-names"
   "port-type/operations" "port-type?"  "port/input-blocking-mode"
   "port/input-terminal-mode" "port/operation" "port/operation-names"
   "port/output-blocking-mode" "port/output-terminal-mode"
   "port/set-input-blocking-mode" "port/set-input-terminal-mode"
   "port/set-output-blocking-mode" "port/set-output-terminal-mode"
   "port/state" "port/type" "port/with-input-blocking-mode"
   "port/with-input-terminal-mode" "port/with-output-blocking-mode"
   "port/with-output-terminal-mode" "port?"  "positive?"  "pp"
   "predicate" "predicate->char-set" "primitive-procedure-name"
   "primitive-procedure?"  "print-procedure" "procedure-arity"
   "procedure-arity-valid?"  "procedure-environment" "procedure?"
   "process-time-clock" "promise-forced?"  "promise-value" "promise?"
   "prompt-for-command-char" "prompt-for-command-expression"
   "prompt-for-confirmation" "prompt-for-evaluated-expression"
   "prompt-for-expression" "pwd" "quasiquote" "quick-sort"
   "quick-sort!"  "quote" "quotient" "raise-window on
   os2-graphics-device" "random" "random-state?"  "rational?"
   "rationalize" "rationalize->exact" "rb-tree->alist" "rb-tree/copy"
   "rb-tree/datum-list" "rb-tree/delete!"  "rb-tree/delete-max!"
   "rb-tree/delete-max-datum!"  "rb-tree/delete-max-pair!"
   "rb-tree/delete-min!"  "rb-tree/delete-min-datum!"
   "rb-tree/delete-min-pair!"  "rb-tree/empty?"  "rb-tree/equal?"
   "rb-tree/height" "rb-tree/insert!"  "rb-tree/key-list"
   "rb-tree/lookup" "rb-tree/max" "rb-tree/max-datum"
   "rb-tree/max-pair" "rb-tree/min" "rb-tree/min-datum"
   "rb-tree/min-pair" "rb-tree/size" "rb-tree?"  "re-match-end-index"
   "re-match-extract" "re-match-start-index" "re-string-match"
   "re-string-search-backward" "re-string-search-forward"
   "re-substring-match" "re-substring-search-backward"
   "re-substring-search-forward" "read" "read-button on
   os2-graphics-device" "read-char" "read-char on input port"
   "read-char-no-hang" "read-line" "read-only"
   "read-parser-buffer-char" "read-string" "read-string on input port"
   "read-string!"  "read-substring on input port" "read-substring!"
   "read-user-event on os2-graphics-device" "read-utf16-be-char"
   "read-utf16-char" "read-utf16-le-char" "read-utf32-be-char"
   "read-utf32-char" "read-utf32-le-char" "read-utf8-char" "real-part"
   "real-time-clock" "real?"  "receive" "record-accessor"
   "record-constructor" "record-keyword-constructor" "record-modifier"
   "record-predicate" "record-type-descriptor"
   "record-type-field-names" "record-type-name" "record-type?"
   "record?"  "redisplay-hook" "reduce" "reduce-right" "regexp-group"
   "remainder" "rename-file" "resize-window on win32-graphics-device"
   "resize-window on x-graphics-device" "resource-id"
   "restart/effector" "restart/interactor" "restart/name" "restart?"
   "restore-window on os2-graphics-device" "retry" "reverse"
   "reverse!"  "reverse-string" "reverse-string!"  "reverse-substring"
   "reverse-substring!"  "rexp*" "rexp+" "rexp->regexp"
   "rexp-alternatives" "rexp-any-char" "rexp-case-fold" "rexp-compile"
   "rexp-group" "rexp-line-end" "rexp-line-start"
   "rexp-not-syntax-char" "rexp-not-word-char" "rexp-not-word-edge"
   "rexp-optional" "rexp-sequence" "rexp-string-end"
   "rexp-string-start" "rexp-syntax-char" "rexp-word-char"
   "rexp-word-edge" "rexp-word-end" "rexp-word-start" "rexp?"  "round"
   "round->exact" "rsc-macro-transformer" "run-shell-command"
   "run-synchronous-subprocess" "runtime" "safe-accessors"
   "save-bitmap on win32-graphics-device" "sc-macro-transformer"
   "scheme-subprocess-environment" "second" "select-user-events on
   os2-graphics-device" "seq" "sequence" "set!"
   "set-apply-hook-extra!"  "set-apply-hook-procedure!"
   "set-background-color" "set-background-color on
   os2-graphics-device" "set-background-color on
   win32-graphics-device" "set-background-color on x-graphics-device"
   "set-border-color on x-graphics-device" "set-border-width on
   x-graphics-device" "set-car!"  "set-cdr!"  "set-cell-contents!"
   "set-current-input-port!"  "set-current-output-port!"
   "set-current-parser-macros!"  "set-entity-extra!"
   "set-entity-procedure!"  "set-file-modes!"  "set-file-times!"
   "set-font on os2-graphics-device" "set-font on
   win32-graphics-device" "set-font on x-graphics-device"
   "set-foreground-color" "set-foreground-color on
   os2-graphics-device" "set-foreground-color on
   win32-graphics-device" "set-foreground-color on x-graphics-device"
   "set-hash-table/rehash-size!"  "set-hash-table/rehash-threshold!"
   "set-input-buffer-size on input port" "set-interaction-i/o-port!"
   "set-internal-border-width on x-graphics-device" "set-line-width on
   win32-graphics-device" "set-mouse-color on x-graphics-device"
   "set-mouse-shape on x-graphics-device"
   "set-notification-output-port!"  "set-output-buffer-size on output
   port" "set-parser-buffer-pointer!"  "set-port/state!"
   "set-record-type-unparser-method!"  "set-string-length!"
   "set-trace-output-port!"  "set-window-name on
   win32-graphics-device" "set-window-position on os2-graphics-device"
   "set-window-size on os2-graphics-device" "set-window-title on
   os2-graphics-device" "set-working-directory-pathname!"
   "set-xml-!attlist-definitions!"  "set-xml-!attlist-name!"
   "set-xml-!element-content-type!"  "set-xml-!element-name!"
   "set-xml-!entity-name!"  "set-xml-!entity-value!"
   "set-xml-!notation-id!"  "set-xml-!notation-name!"
   "set-xml-declaration-encoding!"  "set-xml-declaration-standalone!"
   "set-xml-declaration-version!"  "set-xml-document-declaration!"
   "set-xml-document-dtd!"  "set-xml-document-misc-1!"
   "set-xml-document-misc-2!"  "set-xml-document-misc-3!"
   "set-xml-document-root!"  "set-xml-dtd-external!"
   "set-xml-dtd-internal!"  "set-xml-dtd-root!"
   "set-xml-element-attributes!"  "set-xml-element-contents!"
   "set-xml-element-name!"  "set-xml-external-id-id!"
   "set-xml-external-id-uri!"  "set-xml-parameter-!entity-name!"
   "set-xml-parameter-!entity-value!"
   "set-xml-processing-instructions-name!"
   "set-xml-processing-instructions-text!"
   "set-xml-uninterpreted-text!"  "set-xml-unparsed-!entity-id!"
   "set-xml-unparsed-!entity-name!"
   "set-xml-unparsed-!entity-notation!"  "seventh" "sexp"
   "shell-file-name" "short" "signal-condition"
   "signed-integer->bit-string" "simplest-exact-rational"
   "simplest-rational" "sin" "singleton-wt-tree" "sixth"
   "soft-link-file" "sort" "sort!"  "source->parser-buffer" "sqrt"
   "standard-error-handler" "standard-error-hook"
   "standard-unparser-method" "standard-warning-handler"
   "standard-warning-hook" "store-value" "stream" "stream->list"
   "stream-car" "stream-cdr" "stream-first" "stream-head"
   "stream-length" "stream-map" "stream-null?"  "stream-pair?"
   "stream-ref" "stream-rest" "stream-tail" "string"
   "string->alphabet" "string->char-set" "string->decoded-time"
   "string->file-time" "string->list" "string->number"
   "string->parser-buffer" "string->symbol"
   "string->uninterned-symbol" "string->universal-time"
   "string->wide-string" "string-append" "string-capitalize"
   "string-capitalize!"  "string-capitalized?"  "string-ci"
   "string-ci<=?"  "string-ci<?"  "string-ci=?"  "string-ci>=?"
   "string-ci>?"  "string-compare" "string-compare-ci" "string-copy"
   "string-downcase" "string-downcase!"  "string-fill!"
   "string-find-next-char" "string-find-next-char-ci"
   "string-find-next-char-in-set" "string-find-previous-char"
   "string-find-previous-char-ci" "string-find-previous-char-in-set"
   "string-hash" "string-hash-mod" "string-head" "string-length"
   "string-lower-case?"  "string-match-backward"
   "string-match-backward-ci" "string-match-forward"
   "string-match-forward-ci" "string-maximum-length" "string-null?"
   "string-pad-left" "string-pad-right" "string-prefix-ci?"
   "string-prefix?"  "string-ref" "string-replace" "string-replace!"
   "string-search-all" "string-search-backward"
   "string-search-forward" "string-set!"  "string-suffix-ci?"
   "string-suffix?"  "string-tail" "string-trim" "string-trim-left"
   "string-trim-right" "string-upcase" "string-upcase!"
   "string-upper-case?"  "string-wt-type" "string<=?"  "string<?"
   "string=?"  "string>=?"  "string>?"  "string?"
   "strong-hash-table/constructor" "sublist" "substring"
   "substring->list" "substring->parser-buffer"
   "substring-capitalize!"  "substring-capitalized?"  "substring-ci<?"
   "substring-ci=?"  "substring-downcase!"  "substring-fill!"
   "substring-find-next-char" "substring-find-next-char-ci"
   "substring-find-next-char-in-set" "substring-find-previous-char"
   "substring-find-previous-char-ci"
   "substring-find-previous-char-in-set" "substring-lower-case?"
   "substring-match-backward" "substring-match-backward-ci"
   "substring-match-forward" "substring-match-forward-ci"
   "substring-move-left!"  "substring-move-right!"
   "substring-prefix-ci?"  "substring-prefix?"  "substring-replace"
   "substring-replace!"  "substring-search-all"
   "substring-search-backward" "substring-search-forward"
   "substring-suffix-ci?"  "substring-suffix?"  "substring-upcase!"
   "substring-upper-case?"  "substring<?"  "substring=?"  "substring?"
   "subvector" "subvector->list" "subvector-fill!"
   "subvector-move-left!"  "subvector-move-right!"  "symbol->string"
   "symbol-append" "symbol-hash" "symbol-hash-mod" "symbol<?"
   "symbol?"  "syntax-rules" "system-clock"
   "system-global-environment" "system-library-directory-pathname"
   "system-library-pathname" "t" "tan" "tcp-server-connection-accept"
   "TEMPLATE" "temporary-directory-pathname" "temporary-file-pathname"
   "tenth" "the-environment" "there-exists?"  "third"
   "time-zone->string" "time-zone?"  "top-level-environment?"
   "trace-output-port" "transform" "tree-copy" "true" "truncate"
   "truncate->exact" "type" "type-descriptor" "uint" "ulong"
   "unbind-variable" "unchecked" "unhash" "unicode-code-point?"
   "universal-time->file-time" "universal-time->global-decoded-time"
   "universal-time->global-time-string"
   "universal-time->local-decoded-time"
   "universal-time->local-time-string"
   "unparser/set-tagged-pair-method!"
   "unparser/set-tagged-vector-method!"  "unquote" "unquote-splicing"
   "unsigned-integer->bit-string" "use-pty?"  "use-value"
   "user-homedir-pathname" "user-initial-environment" "user32.dll"
   "ushort" "utf16-be-string->wide-string" "utf16-be-string-length"
   "utf16-le-string->wide-string" "utf16-le-string-length"
   "utf16-string->wide-string" "utf16-string-length"
   "utf32-be-string->wide-string" "utf32-be-string-length"
   "utf32-le-string->wide-string" "utf32-le-string-length"
   "utf32-string->wide-string" "utf32-string-length"
   "utf8-string->wide-string" "utf8-string-length"
   "valid-hash-number?"  "values" "vector" "vector-8b-fill!"
   "vector-8b-find-next-char" "vector-8b-find-next-char-ci"
   "vector-8b-find-previous-char" "vector-8b-find-previous-char-ci"
   "vector-8b-ref" "vector-8b-set!"  "vector->list"
   "vector-binary-search" "vector-copy" "vector-eighth" "vector-fifth"
   "vector-fill!"  "vector-first" "vector-fourth" "vector-grow"
   "vector-head" "vector-length" "vector-map" "vector-ref"
   "vector-second" "vector-set!"  "vector-seventh" "vector-sixth"
   "vector-tail" "vector-third" "vector?"  "warn" "weak-car"
   "weak-cdr" "weak-cons" "weak-hash-table/constructor"
   "weak-pair/car?"  "weak-pair?"  "weak-set-car!"  "weak-set-cdr!"
   "well-formed-code-points-list?"  "where" "wide-char?"
   "wide-string" "wide-string->string" "wide-string->utf16-be-string"
   "wide-string->utf16-le-string" "wide-string->utf16-string"
   "wide-string->utf32-be-string" "wide-string->utf32-le-string"
   "wide-string->utf32-string" "wide-string->utf8-string"
   "wide-string-length" "wide-string-ref" "wide-string-set!"
   "wide-string?"  "window-frame-size on os2-graphics-device"
   "window-position on os2-graphics-device" "window-size on
   os2-graphics-device" "windows-procedure"
   "with-current-parser-macros" "with-current-unparser-state"
   "with-input-from-binary-file" "with-input-from-file"
   "with-input-from-port" "with-input-from-string"
   "with-interaction-i/o-port" "with-notification-output-port"
   "with-output-to-binary-file" "with-output-to-file"
   "with-output-to-port" "with-output-to-string"
   "with-output-to-truncated-string" "with-pointer" "with-restart"
   "with-simple-restart" "with-timings" "with-trace-output-port"
   "with-working-directory-pathname" "withdraw-window on
   x-graphics-device" "within-continuation" "word" "working-directory"
   "working-directory-pathname" "write" "write-char" "write-char on
   output port" "write-condition-report" "write-dib" "write-line"
   "write-restart-report" "write-string" "write-substring"
   "write-substring on output port" "write-to-string"
   "write-utf16-be-char" "write-utf16-char" "write-utf16-le-char"
   "write-utf32-be-char" "write-utf32-char" "write-utf32-le-char"
   "write-utf8-char" "write-xml" "wt-tree/add" "wt-tree/add!"
   "wt-tree/delete" "wt-tree/delete!"  "wt-tree/delete-min"
   "wt-tree/delete-min!"  "wt-tree/difference" "wt-tree/empty?"
   "wt-tree/fold" "wt-tree/for-each" "wt-tree/index"
   "wt-tree/index-datum" "wt-tree/index-pair" "wt-tree/intersection"
   "wt-tree/lookup" "wt-tree/member?"  "wt-tree/min"
   "wt-tree/min-datum" "wt-tree/min-pair" "wt-tree/rank"
   "wt-tree/set-equal?"  "wt-tree/size" "wt-tree/split<"
   "wt-tree/split>" "wt-tree/subset?"  "wt-tree/union"
   "wt-tree/union-merge" "wt-tree?"  "x-character-bounds/ascent"
   "x-character-bounds/descent" "x-character-bounds/lbearing"
   "x-character-bounds/rbearing" "x-character-bounds/width"
   "x-close-all-displays" "x-font-structure/all-chars-exist"
   "x-font-structure/character-bounds" "x-font-structure/default-char"
   "x-font-structure/direction" "x-font-structure/max-ascent"
   "x-font-structure/max-bounds" "x-font-structure/max-descent"
   "x-font-structure/min-bounds" "x-font-structure/name"
   "x-font-structure/start-index" "x-geometry-string"
   "x-graphics/close-display" "x-graphics/open-display"
   "x-open-display" "x-size on output port" "xml-!attlist"
   "xml-!attlist-definitions" "xml-!attlist-name" "xml-!attlist?"
   "xml-!element" "xml-!element-content-type" "xml-!element-name"
   "xml-!element?"  "xml-!entity" "xml-!entity-name"
   "xml-!entity-value" "xml-!entity?"  "xml-!notation"
   "xml-!notation-id" "xml-!notation-name" "xml-!notation?"
   "xml-declaration" "xml-declaration-encoding"
   "xml-declaration-standalone" "xml-declaration-version"
   "xml-declaration?"  "xml-document" "xml-document-declaration"
   "xml-document-dtd" "xml-document-misc-1" "xml-document-misc-2"
   "xml-document-misc-3" "xml-document-root" "xml-document?"
   "xml-dtd" "xml-dtd-external" "xml-dtd-internal" "xml-dtd-root"
   "xml-dtd?"  "xml-element" "xml-element-attributes"
   "xml-element-contents" "xml-element-name" "xml-element?"
   "xml-external-id" "xml-external-id-id" "xml-external-id-uri"
   "xml-external-id?"  "xml-intern" "xml-parameter-!entity"
   "xml-parameter-!entity-name" "xml-parameter-!entity-value"
   "xml-parameter-!entity?"  "xml-processing-instructions"
   "xml-processing-instructions-name"
   "xml-processing-instructions-text" "xml-processing-instructions?"
   "xml-uninterpreted" "xml-uninterpreted-text" "xml-uninterpreted?"
   "xml-unparsed-!entity" "xml-unparsed-!entity-id"
   "xml-unparsed-!entity-name" "xml-unparsed-!entity-notation"
   "xml-unparsed-!entity?"  "y-size" "y-size on output port" "zero?"))

(provide 'scheme-lookup-mit-scheme-ref)
