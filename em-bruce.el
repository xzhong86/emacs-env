
;; ============================================================
;; User packages and ELPA packages
;; ============================================================

(defun user-find-file (file)
  (let* ((edir user-emacs-directory)
	 (path1 (expand-file-name file edir))
	 (path2 (expand-file-name (concat "mypkgs/" file) edir)))
    (cond
     ((file-exists-p file)  file)
     ((file-exists-p path1) path1)
     ((file-exists-p path2) path2)
     (t nil))))

(defun user-try-load (file)
  "try load file if it exists or exists in mypkgs"
  (let ((fpath (user-find-file file)))
    (if fpath (load fpath))))

(defun user-auto-load (func file doc)
  "do autoload if it exists or exists in mypkgs"
  (let ((fpath (user-find-file file)))
    (if fpath (autoload func fpath doc t))))


(user-try-load "em-packages.el")
(user-try-load "em-appearence.el")
(user-try-load "em-methods.el")
(user-try-load "em-keybind.el")
(user-try-load "em-alias.el")
(user-try-load "em-cygwin.el")
;;(user-auto-load 'yaml-mode     "yaml-mode.el"     "YAML Mode")
;;(user-auto-load 'cmake-mode    "cmake-mode.el"    "CMake Mode")
;;(user-auto-load 'markdown-mode "markdown-mode.el" "Markdown Mode")


;; ============================================================
;; User defined
;; ============================================================

(cua-mode t)
(ido-mode t)


;; No too many #*, *~ files
(setq make-backup-files nil)


(add-to-list 'auto-mode-alist
             '("Makefile\\..*" . makefile-gmake-mode))

;;(add-hook 'c-mode-hook '(lambda() (c-set-style "k&r")))
(add-hook 'c-mode-hook '(lambda() (c-set-style "stroustrup")
                          (setq show-trailing-whitespace t)))
(add-hook 'c++-mode-hook '(lambda() (c-set-style "cc-mode")
                            (c-set-offset 'innamespace 0)
                            (setq show-trailing-whitespace t)))

;; show paren {} [] ()
(show-paren-mode 0)
;; auto insert pair mode
(electric-pair-mode t)

;;(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;(setq show-trailing-whitespace t)  ; display tailing space

;; automatically add newline at end of file when save
(setq require-final-newline t)
(setq mode-require-final-newline t)


;; ============================================================
;; Shell
;; ============================================================

(eshell)
(rename-buffer "esh-main")
(switch-to-buffer "esh-main")
(delete-other-windows)

