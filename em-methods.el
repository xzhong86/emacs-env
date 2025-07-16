
;; =================================================================
;; User defined methods
;; =================================================================

;; bind to key
(defun query-replace-reg-t (to-string)
  (interactive (let (to)
		 (setq to (read-from-minibuffer
			   (format "Query-replace \"%s\" with: "
				   (get-register t))
			   nil nil nil
			   query-replace-to-history-variable nil t))
		 (list to)))
  (perform-replace (get-register t) to-string t nil nil))

;; bind to key
(defun replace-string-reg-t (to-string)
  (interactive (let (to)
		 (setq to (read-from-minibuffer
			   (format "Replace \"%s\" with: "
				   (get-register t))
			   nil nil nil
			   query-replace-to-history-variable nil t))
		 (list to)))
  (perform-replace (get-register t) to-string nil nil nil))


;; copy from cua package
(defalias 'copy-rectangle-text 'cua-copy-rectangle-as-text-spc)
(defun cua-copy-rectangle-as-text-spc (&optional arg delete)
  "Copy rectangle, but store as normal text."
  (interactive "P")
  (if cua--global-mark-active
      (if delete
          (cua--cut-rectangle-to-global-mark t)
        (cua--copy-rectangle-to-global-mark t))
    (let* ((rect (cua--extract-rectangle))
           (text (mapconcat
                  (function (lambda (row) (concat row " ")))
                  rect "")))
      (setq arg (cua--prefix-arg arg))
      (if cua--register
          (set-register cua--register text)
        (kill-new text)))
    (if delete
        (cua--delete-rectangle))
    (cua--deactivate)))


(defun goto-percent (percent)
  "Goto PERCENT of buffer."
  (interactive "nGoto percent:")
  (goto-char (/ (* percent (point-max)) 100)))


;; bind to key
(defun jump-to-file-and-line ()
  "Reads a line in the form FILENAME:LINE and, assuming a
relative path, opens that file in another window and jumps to the
line."
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (string-match "\\(.*\\):\\([0-9]+\\)" line)
    (let ((file (match-string 1 line))
          (lnum (match-string 2 line)))
      (when (and file (file-exists-p (concat default-directory file)))
        (find-file-other-window (concat default-directory file))
        (and lnum (goto-line (string-to-number lnum)))))))


(defun untabify-whole-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))
