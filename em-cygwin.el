
(when (user-try-load "fakecygpty.el")
  (fakecygpty-activate))

(defun add-cygssh-to-tramp-methods ()
  (add-to-list 'tramp-methods
	       (mapcar
		(lambda (x)
		  (cond
		   ((equal x "sshx") "cygssh")
		   ((eq (car x) 'tramp-login-program) (list 'tramp-login-program "fakecygpty ssh"))
		   (t x)))
		(assoc "sshx" tramp-methods))))

;; refer to https://stackoverflow.com/questions/1095172/emacs-tramp-plink
;;(setq env-for-tramp-login-args
;;      (format "env 'TERM=%s' 'PROMPT_COMMAND=' 'PS1=%s'"
;; 	      tramp-terminal-type "$"))
(defun env-for-tramp-login-args() "env 'TERM=dumb' 'PROMPT_COMMAND=' 'PS1=$'")
(defun add-sshw-to-tramp-methods ()
  (add-to-list 'tramp-methods
	       '("sshw"
		 (tramp-login-program     "fakecygpty ssh")
		 ;; ("%h") must be single element, see 'tramp-compute-multi-hops'
		 (tramp-login-args (("-l" "%u" "-o \"StrictHostKeyChecking=no\"")
				    ("-P" "%p") ("-t") ("%h") ("\"")
				    ;;(,(format "env 'TERM=%s'" tramp-terminal-type))
				    ("env 'TERM=dumb' 'PROMPT_COMMAND=' 'PS1=$'")
				    ("/bin/sh") ("\"")))
		 (tramp-remote-shell "/bin/sh")
		 (tramp-remote-shell-login "-l")
		 (tramp-remote-shell-args  "-c")
		 (tramp-default-port 22))
	       ))

(defun add-plinkw-to-tramp-methods ()
  (add-to-list 'tramp-methods
	       '("plinkw"
		 (tramp-login-program     "plink")
		 ;; ("%h") must be single element, see 'tramp-compute-multi-hops'
		 (tramp-login-args (("-l" "%u")
				    ("-P" "%p") ("-t") ("%h") ("\"")
				    ;;(,(format "env 'TERM=%s'" tramp-terminal-type))
				    ("env 'TERM=dumb' 'PROMPT_COMMAND=' 'PS1=$'")
				    ("/bin/sh") ("\"")))
		 (tramp-remote-shell "/bin/sh")
		 (tramp-remote-shell-login "-l")
		 (tramp-remote-shell-args  "-c")
		 (tramp-default-port 22))
	       ))


(when fakecygpty--activated
  (eval-after-load "tramp"
    '(progn
       (add-sshw-to-tramp-methods)
       (add-plinkw-to-tramp-methods)
       (setq tramp-default-method "sshw"))))
