(setq load-path (cons "." load-path))
(defun mew-compile () (mapcar (function (lambda (x) (byte-compile-file x))) (list 
"mew-addrbook.el" "mew-attach.el" "mew-auth.el" "mew-blvs.el" "mew-bq.el" "mew-cache.el" "mew-complete.el" "mew-config.el" "mew-const.el" "mew-decode.el" "mew-demo.el" "mew-draft.el" "mew-edit.el" "mew-encode.el" "mew-env.el" "mew-ext.el" "mew-fib.el" "mew-func.el" "mew-header.el" "mew-highlight.el" "mew-imap.el" "mew-imap2.el" "mew-key.el" "mew-local.el" "mew-mark.el" "mew-md5.el" "mew-message.el" "mew-mime.el" "mew-minibuf.el" "mew-net.el" "mew-nntp.el" "mew-nntp2.el" "mew-pgp.el" "mew-pick.el" "mew-pop.el" "mew-refile.el" "mew-scan.el" "mew-smime.el" "mew-smtp.el" "mew-sort.el" "mew-ssh.el" "mew-ssl.el" "mew-summary.el" "mew-summary2.el" "mew-summary3.el" "mew-summary4.el" "mew-syntax.el" "mew-theme.el" "mew-thread.el" "mew-vars.el" "mew-vars2.el" "mew-virtual.el" "mew-exec.el" "mew-nmz.el" "mew.el"
)))
