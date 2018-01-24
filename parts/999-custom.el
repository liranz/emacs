(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(cua-rectangle-mark-key (kbd "C-x <C-return>"))
 '(flycheck-dmd-include-path (quote ("/Users/liranz/git/wekapp")))
 '(helm-ff-transformer-show-only-basename nil)
 '(iflipb-ignore-buffers nil)
 '(indent-tabs-mode t)
 '(ispell-program-name "/usr/local/bin/ispell")
 '(minimap-window-location (quote right))
 '(ns-pop-up-frames nil)
 '(projectile-ack-function (quote ag))
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" "venv" "build" ".env")))
 '(set-mark-command-repeat-pop t)
 '(tab-width 4 nil nil "This iis what I need in my files"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-jump-face-foreground ((t (:background "black" :foreground "yellow" :weight bold))))
 '(flycheck-error-face ((t (:background "dark red"))) t)
 '(flycheck-warning-face ((t (:background "RoyalBlue4"))) t)
 '(helm-ff-directory ((t (:foreground "yellow"))))
 '(helm-selection ((t (:background "dark red" :underline t))))
 '(highlight ((t (:background "Yellow" :foreground "black"))))
 '(hl-line ((t (:background "#333"))) t)
 '(linum ((t (:inherit (shadow default) :background "#000" :foreground "#444"))))
 '(magit-diff-add ((t (:inherit diff-added :foreground "chartreuse"))))
 '(magit-diff-del ((t (:inherit diff-removed :foreground "orange red"))))
 '(magit-item-highlight ((t (:background "RoyalBlue4"))))
 '(mc/cursor-face ((t (:background "deep sky blue" :foreground "black"))))
 '(minimap-active-region-background ((t (:background "#333"))))
 '(mode-line ((t (:background "#ccccff" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(region ((t (:background "White" :foreground "black"))))
 '(rst-level-1-face ((t (:background "grey85" :foreground "black"))) t)
 '(rst-level-2-face ((t (:background "grey78" :foreground "black"))) t)
 '(rst-level-3-face ((t (:background "grey71" :foreground "black"))) t)
 '(rst-level-4-face ((t (:background "grey64" :foreground "black"))) t)
 '(rst-level-5-face ((t (:background "grey57" :foreground "black"))) t)
 '(rst-level-6-face ((t (:background "#ddf" :foreground "black"))) t)
 '(wg-mode-line-face ((t (:foreground "Orange"))) t))
