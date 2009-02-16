;;;;;; Scheme-lookup: lookup documentation for Scheme symbols
;;;;;; Version $Version$

;;; This code is written by Trent W. Buck <trentbuck@gmail.com>
;;; (except where explicitly noted) and placed in the Public Domain.
;;; All warranties are disclaimed.

(require 'scheme-lookup)

; scheme-lookup-slib : string -> dontcare
(defun scheme-lookup-slib (symbol-name)
  (info "slib")
  (Info-index symbol-name))

(put 'scheme-lookup-slib
     'scheme-lookup-pretty-name
     "SLIB Manual")

(mapc
 (lambda (x) (scheme-lookup-add-reference (list 'scheme-lookup-slib x)))
 '("-" "-1+" "/" "1+" "<=?" "<?" "=" "=?" ">=?" ">?" "a:bool" "a:fixn16b"
   "a:fixn32b" "a:fixn64b" "a:fixn8b" "a:fixz16b" "a:fixz32b" "a:fixz64b"
   "a:fixz8b" "a:floc128b" "a:floc16b" "a:floc32b" "a:floc64b" "a:flor128b"
   "a:flor16b" "a:flor32b" "a:flor64b" "abort" "absolute-path?" "absolute-uri?"
   "add-command-tables" "add-domain" "add-domain" "on" "relational-database"
   "add-macro-support" "add-process!" "add-setter" "adjoin"
   "adjoin-parameters!"  "alist->wt-tree" "alist-associator" "alist-cons"
   "alist-copy" "alist-delete" "alist-delete!" "alist-for-each"
   "alist-inquirer" "alist-map" "alist-remover" "alist-table" "and-let*" "and?"
   "any" "any-bits-set?" "any?" "append!" "append-reverse" "append-reverse!"
   "apply" "arithmetic-shift" "array->list" "array->vector" "array-dimensions"
   "array-for-each" "array-in-bounds?"  "array-index-map!" "array-indexes"
   "array-map" "array-map!"  "array-rank" "array-ref" "array-set!" "array-trim"
   "array:copy!"  "array?" "asctime" "ash" "assoc" "atom?"
   "batch:call-with-output-script" "batch:command" "batch:comment"
   "batch:delete-file" "batch:initialize!" "batch:lines->file"
   "batch:rename-file" "batch:run-script" "batch:try-chopped-command"
   "batch:try-command" "bit-count" "bit-field" "bit-set?" "bitwise-and"
   "bitwise-if" "bitwise-ior" "bitwise-merge" "bitwise-not" "bitwise-xor"
   "blackbody-spectrum" "booleans->integer" "break" "<1>" "break" "break!"
   "break-all" "breakf" "breakpoint" "browse" "browse-url" "butlast"
   "butnthcdr" "byte-ref" "byte-set!" "bytes" "bytes->ieee-double"
   "bytes->ieee-float" "bytes->integer" "bytes->list" "bytes-copy"
   "bytes-length" "bytes-reverse" "bytes-reverse!" "call-with-dynamic-binding"
   "call-with-input-string" "call-with-open-ports" "call-with-output-string"
   "call-with-tmpnam" "call-with-values" "capture-syntactic-environment"
   "car+cdr" "cart-prod-tables" "on" "relational-database" "catalog->html"
   "catalog-id" "on" "base-table" "catalog:read" "cdna:base-count"
   "cdna:report-base-count" "cgi:serve-query" "chap:next-string"
   "chap:string<=?" "chap:string<?" "chap:string>=?" "chap:string>?"
   "check-parameters" "chromaticity->CIEXYZ" "chromaticity->whitepoint"
   "CIE:DE*" "CIE:DE*94" "ciexyz->color" "CIEXYZ->e-sRGB" "CIEXYZ->L*a*b*"
   "CIEXYZ->L*u*v*" "CIEXYZ->RGB709" "CIEXYZ->sRGB" "CIEXYZ->xRGB"
   "circular-list" "circular-list?" "cksum" "clear-sky-color-xyy"
   "clip-to-rect" "close-base" "on" "base-table" "close-database"
   "close-database" "on" "relational-database" "close-port" "close-table" "on"
   "relational-table" "CMC-DE" "CMC:DE*" "codons<-cdna" "coerce" "collection?"
   "color->ciexyz" "color->e-srgb" "color->l*a*b*" "color->l*c*h"
   "color->l*u*v*" "color->rgb709" "color->srgb" "color->string" "color->xrgb"
   "color-dictionaries->lookup" "color-dictionary" "color-name->color"
   "color-name:canonicalize" "color-precision" "color-space"
   "color-white-point" "color:ciexyz" "color:e-srgb" "color:l*a*b*"
   "color:l*c*h" "color:l*u*v*" "color:linear-transform" "color:rgb709"
   "color:srgb" "color?" "column-domains" "on" "relational-table"
   "column-foreigns" "on" "relational-table" "column-names" "on"
   "relational-table" "column-range" "column-types" "on" "relational-table"
   "combine-ranges" "combined-rulesets" "command->p-specs"
   "command:make-editable-table" "command:modify-table" "concatenate"
   "concatenate!" "cond" "cond-expand" "cons*" "continue" "convert-color"
   "copy-bit" "copy-bit-field" "copy-list" "copy-random-state" "copy-tree"
   "count" "count-newlines" "crc16" "crc5" "crc:make-table" "create-array"
   "create-database" "create-database" "on" "relational-system"
   "create-postscript-graph" "create-table" "on" "relational-database"
   "create-view" "on" "relational-database" "cring:define-rule" "ctime"
   "current-directory" "current-error-port" "current-input-port" "<1>"
   "current-input-port" "current-output-port" "current-time" "cvs-directories"
   "cvs-files" "cvs-repository" "cvs-root" "cvs-set-root!" "cvs-set-roots!"
   "cvs-vet" "db->html-directory" "db->html-files" "db->netscape"
   "decode-universal-time" "define-*commands*" "define-access-operation"
   "define-command" "define-domains" "define-macro" "define-operation"
   "define-predicate" "define-record-type" "define-structure" "define-syntax"
   "define-table" "define-tables" "defmacro" "defmacro:eval" "defmacro:expand*"
   "defmacro:load" "defmacro?" "delaminate-list" "delay" "delete" "delete" "on"
   "base-table" "delete*" "on" "base-table" "delete-domain" "on"
   "relational-database" "delete-duplicates" "delete-duplicates!"
   "delete-file" "delete-if" "delete-if-not" "delete-table" "on"
   "relational-database" "dequeue!" "dequeue-all!" "determinant"
   "diff:edit-length" "diff:edits" "diff:longest-common-subsequence" "difftime"
   "directory-for-each" "do-elts" "do-keys" "domain-checker" "on"
   "relational-database" "dotted-list?" "drop" "drop-right" "drop-right!"
   "dynamic-ref" "dynamic-set!" "dynamic-wind" "dynamic?"  "e-sRGB->CIEXYZ"
   "e-srgb->color" "e-sRGB->e-sRGB" "e-sRGB->sRGB" "eighth" "emacs:backup-name"
   "empty?" "encode-universal-time" "enqueue!" "equal?" "<1>" "equal?" "eval"
   "every" "every?"  "exports<-info-index" "expt" "extended-euclid" "factor"
   "feature->export-alist" "feature->exports" "feature->requires"
   "feature->requires*" "feature-eval" "fft" "fft-1" "fifth"
   "file->color-dictionary" "file->definitions" "file->exports" "file->loads"
   "file->requires" "file->requires*" "file-exists?"  "file-lock!"
   "file-lock-owner" "file-unlock!" "filename:match-ci??"  "filename:match??"
   "filename:substitute-ci??"  "filename:substitute??" "fill-empty-parameters"
   "fill-rect" "filter" "filter!" "find" "find-if" "find-ratio"
   "find-ratio-between" "find-string-from-port?" "find-tail" "first"
   "first-set-bit" "fluid-let" "fold" "fold-right" "for-each-elt"
   "for-each-key" "for-each-key" "on" "base-table" "for-each-row" "on"
   "relational-table" "for-each-row-in-order" "on" "relational-table" "force"
   "force-output" "form:delimited" "form:element" "form:image" "form:reset"
   "form:submit" "format" "fourth" "fprintf" "fscanf" "gen-elts" "gen-keys"
   "generic-write" "gentemp" "get" "on" "relational-table" "get*" "on"
   "relational-table" "get-decoded-time" "get-foreign-choices" "get-method"
   "get-universal-time" "getenv" "getopt" "getopt--" "getopt->arglist"
   "getopt->parameter-list" "glob-pattern?" "gmktime" "gmtime"
   "golden-section-search" "gray-code->integer" "gray-code<=?" "gray-code<?"
   "gray-code>=?"  "gray-code>?" "grey" "grid-horizontals" "grid-verticals"
   "gtime" "has-duplicates?" "hash" "hash-associator" "hash-for-each"
   "hash-inquirer" "hash-map" "hash-rehasher" "hash-remover" "hashq" "hashv"
   "heap-extract-max!" "heap-insert!" "heap-length"
   "hilbert-coordinates->integer" "histograph" "home-vicinity" "htm-fields"
   "html-for-each" "html:anchor" "html:atval" "html:base" "html:body"
   "html:buttons" "html:caption" "html:checkbox" "html:comment"
   "html:delimited-list" "html:editable-row-converter" "html:form" "html:head"
   "html:heading" "html:hidden" "html:href-heading" "html:http-equiv"
   "html:isindex" "html:link" "html:linked-row-converter" "html:meta"
   "html:meta-refresh" "html:plain" "html:pre" "html:read-title" "html:select"
   "html:table" "html:text" "html:text-area" "http:content" "http:error-page"
   "http:forwarding-page" "http:header" "http:serve-query" "identifier=?"
   "identifier?" "identity" "ieee-byte-collate" "ieee-byte-collate!"
   "ieee-byte-decollate" "ieee-byte-decollate!" "ieee-double->bytes"
   "ieee-float->bytes" "illuminant-map" "illuminant-map->XYZ"
   "implementation-vicinity" "in-graphic-context" "in-vicinity" "init-debug"
   "integer->bytes" "integer->gray-code" "integer->hilbert-coordinates"
   "integer->list" "integer->peano-coordinates" "integer-byte-collate"
   "integer-byte-collate!" "integer-length" "integer-sqrt"
   "interaction-environment" "interpolate-array-ref" "interpolate-from-table"
   "intersection" "iota" "isam-next" "on" "relational-table" "isam-prev" "on"
   "relational-table" "jacobi-symbol" "kill-process!" "kill-table" "on"
   "base-table" "L*a*b*->CIEXYZ" "l*a*b*->color" "L*a*b*->L*C*h" "L*a*b*:DE*"
   "l*c*h->color" "L*C*h->L*a*b*" "L*C*h:DE*94" "L*u*v*->CIEXYZ"
   "l*u*v*->color" "laguerre:find-polynomial-root" "laguerre:find-root" "last"
   "<1>" "last" "last-pair" "length+" "library-vicinity" "light:ambient"
   "light:beam" "light:directional" "light:point" "light:spot" "limit" "list*"
   "list->array" "list->bytes" "list->integer" "list-copy" "list-index"
   "list-of??" "list-table-definition" "list-tabulate" "list-tail" "list="
   "load->path" "load-ciexyz" "load-color-dictionary" "localtime"
   "log2-binary-factors" "logand" "logbit?" "logcount" "logior" "lognot"
   "logtest" "logxor" "lset-adjoin" "lset-diff+intersection"
   "lset-diff+intersection!" "lset-difference" "lset-difference!"
   "lset-intersection" "lset-intersection!"  "lset-union" "lset-union!"
   "lset-xor" "lset-xor!" "lset<=" "lset=" "macro:eval" "<1>" "macro:eval"
   "<2>" "macro:eval" "<3>" "macro:eval" "macro:expand" "<1>" "macro:expand"
   "<2>" "macro:expand" "<3>" "macro:expand" "macro:load" "<1>" "macro:load"
   "<2>" "macro:load" "<3>" "macro:load" "macroexpand" "macroexpand-1"
   "macwork:eval" "macwork:expand" "macwork:load" "make-array" "make-base" "on"
   "base-table" "make-bytes" "make-color" "make-command-server"
   "make-directory" "make-dynamic" "make-exchanger" "make-generic-method"
   "make-generic-predicate" "make-getter" "on" "base-table" "make-getter-1"
   "on" "base-table" "make-hash-table" "make-heap" "make-key->list" "on"
   "base-table" "make-key-extractor" "on" "base-table" "make-keyifier-1" "on"
   "base-table" "make-list" "make-list-keyifier" "on" "base-table"
   "make-method!" "make-nexter" "on" "base-table" "make-object"
   "make-parameter-list" "make-predicate!" "make-prever" "on" "base-table"
   "make-promise" "make-putter" "on" "base-table"
   "make-query-alist-command-server" "make-queue" "make-random-state"
   "make-record-type" "make-relational-system" "make-ruleset"
   "make-shared-array" "make-sierpinski-indexer" "make-slib-color-name-db"
   "make-syntactic-closure" "make-table" "on" "base-table" "make-uri"
   "make-vicinity" "make-wt-tree" "make-wt-tree-type" "map!" "map-elts"
   "map-key" "on" "base-table" "map-keys" "matfile:load" "matfile:read"
   "matrix->array" "matrix->lists" "matrix:inverse" "matrix:product"
   "mdbm:report" "member" "member-if" "merge" "merge!" "mktime" "mod"
   "modular:*" "modular:+" "modular:-" "modular:expt" "modular:invert"
   "modular:invertable?" "modular:negate" "modular:normalize"
   "modulus->integer" "mrna<-cdna" "must-be-first" "must-be-last"
   "natural->peano-coordinates" "ncbi:read-dna-sequence" "ncbi:read-file"
   "nconc" "newton:find-integer-root" "newton:find-root" "ninth" "not-pair?"
   "notany" "notevery" "nreverse" "nthcdr" "null-directory?"
   "null-environment" "null-list?" "object" "object->limited-string"
   "object->string" "object-with-ancestors" "object?" "offset-time" "open-base"
   "on" "base-table" "open-command-database" "open-command-database!"
   "open-database" "open-database" "on" "relational-system" "open-database!"
   "open-file" "<1>" "open-file" "open-table" "open-table" "on" "base-table"
   "open-table" "on" "relational-database" "open-table!" "operate-as" "or?"
   "ordered-for-each-key" "on" "base-table" "os->batch-dialect" "outline-rect"
   "output-port-height" "output-port-width" "overcast-sky-color-xyy" "p<-cdna"
   "pad-range" "pair-fold" "pair-fold-right" "pair-for-each"
   "parameter-list->arglist" "parameter-list-expand" "parameter-list-ref"
   "parse-ftp-address" "partition" "partition!" "partition-page" "path->uri"
   "pathname->vicinity" "peano-coordinates->integer"
   "peano-coordinates->natural" "plot" "<1>" "plot" "plot-column"
   "pnm:array-write" "pnm:image-file->array" "pnm:type-dimensions" "port?"
   "position" "pprint-file" "pprint-filter-file" "prec:commentfix"
   "prec:define-grammar" "prec:delim" "prec:infix" "prec:inmatchfix"
   "prec:make-led" "prec:make-nud" "prec:matchfix" "prec:nary" "prec:nofix"
   "prec:parse" "prec:postfix" "prec:prefix" "prec:prestfix" "predicate->asso"
   "predicate->hash" "predicate->hash-asso" "present?" "on" "base-table"
   "pretty-print" "pretty-print->string" "primary-limit" "on"
   "relational-table" "prime?" "primes<" "primes>" "print" "print-call-stack"
   "printf" "process:schedule!" "program-vicinity" "project-table" "on"
   "relational-database" "proper-list?" "protein<-cdna" "provide" "provided?"
   "qp" "qpn" "qpr" "queue-empty?" "queue-front" "queue-pop!" "queue-push!"
   "queue-rear" "queue?" "random" "random:exp" "random:hollow-sphere!"
   "random:normal" "random:normal-vector!" "random:solid-sphere!"
   "random:uniform" "rationalize" "read-byte" "read-bytes"
   "read-cie-illuminant" "read-command" "read-line" "read-line!"
   "read-normalized-illuminant" "read-options-file" "receive" "record-accessor"
   "record-constructor" "record-modifier" "record-predicate" "reduce" "<1>"
   "reduce" "<2>" "reduce" "reduce-init" "reduce-right" "rem" "remove" "<1>"
   "remove" "remove!" "remove-duplicates" "remove-if" "remove-if-not"
   "remove-parameter" "remove-setter-for" "repl:quit" "repl:top-level"
   "replace-suffix" "require" "<1>" "require" "require-if" "resample-array!"
   "resene" "restrict-table" "on" "relational-database" "reverse!"
   "reverse-bit-field" "RGB709->CIEXYZ" "rgb709->color" "rotate-bit-field"
   "row:delete" "on" "relational-table" "row:delete*" "on" "relational-table"
   "row:insert" "on" "relational-table" "row:insert*" "on" "relational-table"
   "row:remove" "on" "relational-table" "row:remove*" "on" "relational-table"
   "row:retrieve" "on" "relational-table" "row:retrieve*" "on"
   "relational-table" "row:update" "on" "relational-table" "row:update*" "on"
   "relational-table" "rule-horizontal" "rule-vertical" "saturate" "scanf"
   "scanf-read-list" "scene:overcast" "scene:panorama" "scene:sky-and-dirt"
   "scene:sky-and-grass" "scene:sphere" "scene:sun" "scene:viewpoint"
   "scene:viewpoints" "scheme-report-environment" "schmooz"
   "secant:find-bracketed-root" "secant:find-root" "second"
   "seed->random-state" "set" "set-color" "set-difference" "set-font"
   "set-glyphsize" "set-linedash" "set-linewidth" "set-margin-templates"
   "Setter" "setter" "setup-plot" "seventh" "si:conversion-factor"
   "singleton-wt-tree" "sixth" "size" "<1>" "size" "sky-color-xyy" "slib:error"
   "slib:eval" "slib:eval-load" "slib:exit" "slib:in-catalog?" "slib:load"
   "slib:load-compiled" "slib:load-source" "slib:report" "slib:report-version"
   "slib:warn" "snap-range" "software-type" "solar-declination" "solar-hour"
   "solar-polar" "solid:arrow" "solid:basrelief" "solid:box"
   "solid:center-array-of" "solid:center-pile-of" "solid:center-row-of"
   "solid:color" "solid:cone" "solid:cylinder" "solid:disk" "solid:ellipsoid"
   "solid:font" "solid:polyline" "solid:pyramid" "solid:rotation" "solid:scale"
   "solid:sphere" "solid:text" "solid:texture" "solid:translation"
   "solidify-database" "solidify-database" "on" "relational-database" "some"
   "sort" "sort!"  "sorted?" "soundex" "span" "span!" "spectrum->chromaticity"
   "spectrum->XYZ" "split-at" "split-at!" "sprintf" "sRGB->CIEXYZ"
   "srgb->color" "sRGB->e-sRGB" "sRGB->xRGB" "sscanf" "stack" "stack-all"
   "stackf" "string->color" "string-capitalize" "string-capitalize!"
   "string-ci->symbol" "string-copy" "string-downcase" "string-downcase!"
   "string-fill!" "string-index" "string-index-ci" "string-join" "string-null?"
   "string-reverse-index" "string-reverse-index-ci" "string-subst"
   "string-upcase" "string-upcase!" "StudlyCapsExpand" "sub-vicinity"
   "subarray" "subset?" "subst" "substq" "substring-ci?"  "substring-fill!"
   "substring-move-left!" "substring-move-right!"  "substring-read!"
   "substring-write" "substring?" "substv" "sunlight-chromaticity"
   "sunlight-spectrum" "supported-key-type?"  "on" "base-table"
   "supported-type?" "on" "base-table" "symbol-append" "symmetric:modulus"
   "sync-base" "on" "base-table" "sync-database" "sync-database" "on"
   "relational-database" "syncase:eval" "syncase:expand" "syncase:load"
   "syncase:sanity-check" "synclo:eval" "synclo:expand" "synclo:load"
   "syntax-rules" "system" "system->line" "table->linked-html"
   "table->linked-page" "table-exists?" "on" "relational-database"
   "table-name->filename" "take" "take!"  "take-right"
   "temperature->chromaticity" "temperature->XYZ" "tenth" "third" "time-zone"
   "time:gmtime" "time:invert" "time:split" "title-bottom" "title-top" "tmpnam"
   "tok:bump-column" "tok:char-group" "top-refs" "top-refs<-file"
   "topological-sort" "trace" "trace-all" "tracef" "track" "track-all" "trackf"
   "transact-file-replacement" "transcript-off" "transcript-on" "transformer"
   "transpose" "truncate-up-to" "tsort" "type-of" "tz:params" "tz:std-offset"
   "tzfile:read" "tzset" "unbreak" "unbreakf" "union" "unmake-method!"
   "unstack" "untrace" "untracef" "untrack" "unzip1" "unzip2" "unzip3" "unzip4"
   "unzip5" "uri->tree" "uri:decode-query" "uri:make-path" "uri:path->keys"
   "uri:split-fields" "uric:decode" "uric:encode" "url->color-dictionary"
   "user-email-address" "user-vicinity" "values" "vector->array" "vector-fill!"
   "vet-slib" "vicinity:suffix?" "vrml" "vrml-append" "vrml-to-file"
   "wavelength->chromaticity" "wavelength->XYZ" "whole-page" "<1>" "whole-page"
   "with-input-from-file" "with-load-pathname" "with-output-to-file"
   "within-database" "world:info" "wrap-command-interface" "write-base" "on"
   "base-table" "write-byte" "write-bytes" "write-database" "write-database"
   "on" "relational-database" "write-line" "wt-tree/add" "wt-tree/add!"
   "wt-tree/delete" "wt-tree/delete!"  "wt-tree/delete-min"
   "wt-tree/delete-min!" "wt-tree/difference" "wt-tree/empty?" "wt-tree/fold"
   "wt-tree/for-each" "wt-tree/index" "wt-tree/index-datum"
   "wt-tree/index-pair" "wt-tree/intersection" "wt-tree/lookup"
   "wt-tree/member?" "wt-tree/min" "wt-tree/min-datum" "wt-tree/min-pair"
   "wt-tree/rank" "wt-tree/set-equal?" "wt-tree/size" "wt-tree/split<"
   "wt-tree/split>" "wt-tree/subset?" "wt-tree/union" "x-axis" "xcons"
   "xRGB->CIEXYZ" "xrgb->color" "xRGB->sRGB" "xyY->XYZ" "xyY:normalize-colors"
   "XYZ->chromaticity" "XYZ->xyY" "y-axis" "zenith-xyy" "zip" "*argv*"
   "*base-table-implementations*" "*catalog*" "*http:byline*"
   "*operating-system*" "*optarg*" "*optind*" "*qp-width*" "*random-state*"
   "*ruleset*" "*syn-defs*" "*syn-ignore-whitespace*" "*timezone*"
   "atm-hec-polynomial" "bottomedge" "char-code-limit" "charplot:dimensions"
   "CIEXYZ:A" "CIEXYZ:B" "CIEXYZ:C" "CIEXYZ:D50" "CIEXYZ:D65" "CIEXYZ:E"
   "crc-08-polynomial" "crc-10-polynomial" "crc-12-polynomial"
   "crc-16-polynomial" "crc-32-polynomial" "crc-ccitt-polynomial" "D50" "D65"
   "daylight?" "debug:max-count" "distribute*" "distribute/"
   "dowcrc-polynomial" "graph:dimensions" "graphrect" "leftedge"
   "most-positive-fixnum" "nil" "number-wt-type" "plotrect" "prime:prngs"
   "prime:trials" "rightedge" "slib:form-feed" "slib:tab" "stderr" "stdin"
   "stdout" "string-wt-type" "subarray0" "t" "tok:decimal-digits"
   "tok:lower-case" "tok:upper-case" "tok:whitespaces" "topedge" "tzname"
   "usb-token-polynomial"))

(provide 'scheme-lookup-slib)
