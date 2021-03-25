
;; ============================================================
;; setup for external packages
;; ============================================================


(when (package-installed-p 'which-key) (which-key-mode t))
(when (package-installed-p 'projectile) (projectile-mode t))


;; setup for ccls
(let ((ccls-path "/home/z00249865/opt/ccls/bin/ccls"))
  (when (and (package-installed-p 'ccls) (file-exists-p ccls-path))
    (require 'ccls)
    (setq ccls-executable ccls-path)
    (setq bruce-ccls-enabled t)))

;; setup for lsp
(defun check-enable-lsp ()
  (when (locate-dominating-file (buffer-file-name) ".ccls-cache")
    (lsp)))
(when (and bruce-ccls-enabled (package-installed-p 'lsp-mode))
  (add-hook 'c-mode-hook 'check-enable-lsp)
  (add-hook 'c++-mode-hook 'check-enable-lsp))

(when (package-installed-p 'lsp-mode)
  (setq lsp-enable-file-watchers nil))

;; set for lsp-ui
(when (package-installed-p 'lsp-ui)
  (setq lsp-ui-doc-enable nil))

