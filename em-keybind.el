
;; =================================================================
;; Key Binding
;; =================================================================

;; unset up/down/right/left
(global-unset-key "\C-p") ;; up
(global-unset-key "\C-n") ;; down
(global-unset-key "\C-f") ;; right
(global-unset-key "\C-b") ;; left

;; Set the word search keys
(global-set-key "\C-f" 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key global-map [f3] 'isearch-forward)
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key global-map [C-f3] 'isearch-forward-regexp)
(define-key global-map [S-f3] 'isearch-backward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)
(define-key global-map [C-S-f3] 'isearch-backward-regexp)

;; Kill buffer/emacs
;(global-set-key [C-f4] 'kill-this-buffer)

;; Go to line
(global-set-key [f5] 'goto-line)

;; Switch windows/buffers
(global-set-key [f6] 'other-window)
(global-set-key [S-f6] 'buffer-menu)

;; for HideShow Mode
(global-set-key [f7] 'hs-toggle-hiding)
(global-set-key [S-f7] 'hs-show-all)
(global-set-key [C-f7] 'hs-hide-all)
(global-set-key [C-S-f7] 'hs-minor-mode)

;; compile, modufy bug
(global-set-key [f8] 'next-error)
(global-set-key [S-f8] 'previous-error)
(global-set-key [C-f8] 'first-error)
(global-set-key [C-S-f8] 'compile)

;; Replace
(global-set-key [f9] 'query-replace)
(global-set-key [C-f9] 'query-replace-regexp)
(global-set-key [S-f9] 'query-replace-reg-t)

(global-set-key [f10] 'replace-string)
(global-set-key [C-f10] 'replace-regexp)
(global-set-key [S-f10] 'replace-string-reg-t)

(global-unset-key [C-prior]) ;; unmap Ctrl + PageUp
(global-unset-key [C-next])  ;; unmap Ctrl + PageDown

(global-set-key [home] 'move-beginning-of-line)  ;; for MacOS or Emcas 27.1
(global-set-key [end] 'move-end-of-line)         ;; for MaxOS or Emacs 27.1

;; Key others
;; Mouse operation
(global-set-key [mouse-3] 'mouse-buffer-menu)

;; Common MSWIN like keys
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-buffer)

;; Make the C-% key jump to the matching {}[]() if on another, like VI
(global-set-key [?\C-%] 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


;; Key in special mode
;; Search previour/next issued commend (in shell mode)
(add-hook 'shell-mode-hook
	  '(lambda ()
	     (define-key shell-mode-map [C-tab]
	       'comint-previous-matching-input-from-input)
	     (define-key shell-mode-map [C-S-kp-tab]
	       'comint-next-matching-input-from-input)))

;; Define/remap key in eshell mode
(add-hook 'eshell-mode-hook
	  '(lambda ()
	     (define-key eshell-mode-map [C-tab]
	       'eshell-previous-matching-input-from-input)
	     (define-key eshell-mode-map [C-S-kp-tab]
	       'eshell-next-matching-input-from-input)
	     (define-key eshell-mode-map [up] 'previous-line)
	     (define-key eshell-mode-map [down] 'next-line)
	     ))

(global-set-key [M-up]  'previous-buffer) 
(global-set-key [M-down] 'next-buffer) 

(global-set-key (kbd "M-g j") 'jump-to-file-and-line)

(if (user-try-load "goto-last-change.el")
    (global-set-key "\C-b" 'goto-last-change))


