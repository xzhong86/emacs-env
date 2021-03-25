
;; ============================================================
;; setup for external packages
;; ============================================================


;;(when (fboundp 'which-key-mode) (which-key-mode t))
(when (package-installed-p 'which-key) (which-key-mode t))

;; setup for ccls
(let ((ccls-path "/home/z00249865/opt/ccls/bin/ccls"))
  (when (and (package-installed-p 'ccls) (file-exists-p ccls-path))
    (require 'ccls)
    (setq ccls-executable ccls-path)
    (setq bruce-ccls-enabled t)))


;;(when (and bruce-ccls-enabled (package-installed-p 'lsp-mode))
;;  (add-hook 'c-mode-hook '(lsp))
;;  (add-hook 'c++-mode-hook '(lsp)))

