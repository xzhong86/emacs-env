
;; ============================================================
;;   Appearence and Color
;; ============================================================

;; windows view

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)


;; mode line

(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time) ;; display time, load level, and mail flag in mode lines

(column-number-mode t)


;; colors

(global-font-lock-mode t)

(set-foreground-color "white")
(set-background-color "Gray22")

(set-mouse-color "yellow")
(set-cursor-color "red")

(set-face-foreground 'font-lock-comment-face "OrangeRed")

