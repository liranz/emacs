; Display settings
(setq inhibit-splash-screen t)
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(display-time) ; useful for full-screen terminals

(set-face-attribute 'default nil :height 160)

; Good for the Dell at home:
;(set-face-attribute 'default nil :height 130)

; Try to display battery info (only if applicable)
(condition-case ex
    (display-battery-mode t)
  ('error (message "Cannot display battery"))
  )

(menu-bar-mode -1) ; get rid of the annoying menubars/toolbars etc.
(if (boundp 'tool-bar-mode)
    (tool-bar-mode 0))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode 0))
(setq ring-bell-function 'ignore)

; show-paren
(setq show-paren-delay 0)
(show-paren-mode)

; winner mode
(winner-mode 1)

; guid-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "%" "*" "C-c p"))
(guide-key-mode 1)

; diff-hl for highlighting differences in fringe
(add-hook 'prog-mode-hook '(lambda () (diff-hl-mode)))

(defun presentation-mode ()
  (interactive)
  (load-theme 'whiteboard t)
  (set-face-attribute 'default nil :height 140))

(add-to-list 'custom-theme-load-path (in-emacs-d "themes"))

(setq-default cursor-type 'box)

(require 'sublimity-scroll)
(sublimity-mode 1)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)

(require 'popwin)
(popwin-mode 1)

(defun dell-framesize ()
  "Change the framesize to fit our full Dell U2713HM screen"
  (interactive)
  (progn
    (ns-toggle-toolbar)
    (ns-toggle-toolbar)
    (set-frame-size (selected-frame) 317 84) ) )

(defun mbp-display ()
  " Change the font size to fit the Dell screen at home"
  (interactive)
  (set-face-attribute 'default nil :height 100) )



(defun home-dell ()
  " Change the font size to fit the Dell screen at home"
  (interactive)
  (set-face-attribute 'default nil :height 130) )

(defun office-dell ()
  " Change the font size to fit the Dell screen at home"
  (interactive)
  (set-face-attribute 'default nil :height 160) )

(defun office-projector ()
  " Change the font size to fit the Dell screen at home"
  (interactive)
  (set-face-attribute 'default nil :height 180) )


(defun office-projector-bigger ()
  " Change the font size to fit the Dell screen at home"
  (interactive)
  (set-face-attribute 'default nil :height 220) )

(defun office-projector-direct ()
  " Change the font size to fit the Dell screen at home"
  (interactive)
  (set-face-attribute 'default nil :height 180) )
