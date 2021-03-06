;;if you want to get size of all marked files you an simple call an external process of du:

 (defun dired-get-size ()
  (interactive)
  (let ((files (dired-get-marked-files)))
    (with-temp-buffer
      (apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
      (message "Size of all marked files: %s"
               (progn 
                 (re-search-backward "\\(^[0-9.]+[A-Za-z]+\\).*total$")
                  (match-string 1))))))
 
 (define-key dired-mode-map (kbd "?") 'dired-get-size)

;; That was the easy way � more fun would it be if you can get the file size just using elisp. I haven�t found a real convincing way to do that, but that piece of code works:

 (defun cdrw-get-size ()
  (interactive)
  (let ((sum 0)
        (files (dired-get-marked-files)))
   (dolist (file files (format "%.1fM" sum))
    (incf sum (/ (nth 8 (car 
      (directory-files-and-attributes (file-name-directory file) nil 
        (regexp-quote (file-name-nondirectory file))))) 1048576.0)))))

;; But as you can see, it only display MB and that even not accurate, but if i just sum up the bytes, emacs return false numbers after 130MB because it can�t work with such big numbers. If you want other formats look at ls-lisp-human-size in ls-lisp.el.

;; The code is ugly and depressing slow, i would be happy if someone find a better solution