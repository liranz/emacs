(add-to-list 'load-path (in-modes-d "d-mode"))
(add-to-list 'load-path (in-modes-d "dcd-mode"))

(require 'd-mode)
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;(add-to-list 'load-path "path_to_ac-dcd.el")
(require 'ac-dcd)
(require 'flycheck)
(add-to-list 'ac-modes 'd-mode)

(add-hook 'd-mode-hook
		  '(lambda () "set up ac-dcd"
                     (flycheck-mode)
                     (ac-dcd-maybe-start-server)
                     (add-to-list 'ac-sources 'ac-source-dcd)))

(define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
(define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
(define-key d-mode-map (kbd "C-c /") 'ac-dcd-goto-def-pop-marker)

(when (featurep 'popwin)
  (add-to-list 'popwin:special-display-config
			   `(,ac-dcd-error-buffer-name :noselect t))
  (add-to-list 'popwin:special-display-config
				 `(,ac-dcd-document-buffer-name :position right :width 80)))

(setq ac-dcd-executable "/Users/liranz/git/DCD/dcd-client")
(setq ac-dcd-flags '("-I/Users/liranz/git/wekapp" "-I/usr/share/dmd/src/phobos"))
(setq ac-dcd-server-executable "/Users/liranz/git/DCD/dcd-server")
(setq flycheck-dmd-include-path (list "/Users/liranz/git/wekapp"))
(setq flycheck-d-dmd-executable "/Users/liranz/dmd-flycheck")
