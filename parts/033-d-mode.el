(add-to-list 'load-path (in-modes-d "d-mode"))
;(add-to-list 'load-path (in-modes-d "dcd-mode"))

(require 'd-mode)
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;(add-to-list 'load-path "path_to_ac-dcd.el")
(require 'ac-dcd)
(require 'flycheck)
(add-to-list 'ac-modes 'd-mode)

; add this back when dcd can read our code
;; (add-hook 'd-mode-hook
;;               '(lambda () "set up ac-dcd"
;;                  (auto-complete-mode t)
;;                  (yas-minor-mode-on)
;;                  (ac-dcd-maybe-start-server)
;;                  (add-to-list 'ac-sources 'ac-source-dcd)))


(add-hook 'd-mode-hook
          '(lambda () "chagne d style"
             (setq c-default-style "linux"
                   c-basic-offset 4)
             (setq-default c-basic-offset 4
                           tab-width 4
                           indent-tabs-mode nil)  ))

;; (define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
;; (define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
;; (define-key d-mode-map (kbd "C-c /") 'ac-dcd-goto-def-pop-marker)

;; (when (featurep 'popwin)
;;   (add-to-list 'popwin:special-display-config
;;                `(,ac-dcd-error-buffer-name :noselect t))
;;   (add-to-list 'popwin:special-display-config
;;                `(,ac-dcd-document-buffer-name :position right :width 80)))


(define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
(define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
(define-key d-mode-map (kbd "C-c /") 'ac-dcd-goto-def-pop-marker)
(define-key d-mode-map (kbd "C-c s") 'ac-dcd-search-symbol)

(when (featurep 'popwin)
  (add-to-list 'popwin:special-display-config
               `(,ac-dcd-error-buffer-name :noselect t))
  (add-to-list 'popwin:special-display-config
               `(,ac-dcd-document-buffer-name :position right :width 80))
  (add-to-list 'popwin:special-display-config
               `(,ac-dcd-search-symbol-buffer-name :position bottom :width 5))) 


(add-hook 'd-mode-hook
      (lambda ()
          (auto-complete-mode t)
          (when (featurep 'yasnippet) (yas-minor-mode-on))
          (ac-dcd-maybe-start-server)
          (ac-dcd-add-imports)
          (add-to-list 'ac-sources 'ac-source-dcd)
          (define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
          (define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
          (define-key d-mode-map (kbd "C-c /") 'ac-dcd-goto-def-pop-marker)
          (define-key d-mode-map (kbd "C-c s") 'ac-dcd-search-symbol)

          (when (featurep 'popwin)
            (add-to-list 'popwin:special-display-config
                         `(,ac-dcd-error-buffer-name :noselect t))
            (add-to-list 'popwin:special-display-config
                         `(,ac-dcd-document-buffer-name :position right :width 80))
            (add-to-list 'popwin:special-display-config
                         `(,ac-dcd-search-symbol-buffer-name :position bottom :width 5)))))

;; (add-hook 'd-mode-hook
;;           '(lambda () "set up ac-dcd"
;;                  (flycheck-mode)
;;                  (auto-complete-mode t)
;;                  (yas-minor-mode-on)
;;                  (ac-dcd-maybe-start-server)
;;                  (add-to-list 'ac-sources 'ac-source-dcd))
;;                  (define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
;;                  (define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
;;                  (define-key d-mode-map (kbd "C-c /") 'ac-dcd-goto-def-pop-marker)

;;                  (when (featurep 'popwin)
;;                     (add-to-list 'popwin:special-display-config
;;                                   `(,ac-dcd-error-buffer-name :noselect t))
;;                      (add-to-list 'popwin:special-display-config
;;                      `(,ac-dcd-document-buffer-name :position right :width 80))))


;; (add-hook 'd-mode-hook
;; 		  '(lambda () "set up ac-dcd"
;;                      (flycheck-mode)
;;                      (ac-dcd-maybe-start-server)
;;                      (add-to-list 'ac-sources 'ac-source-dcd)))

;; (define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
;; (define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
;; (define-key d-mode-map (kbd "C-c /") 'ac-dcd-goto-def-pop-marker)

;; (define-key d-mode-map (kbd "C-c 1") 'flycheck-next-error)

;; (when (featurep 'popwin)
;;   (add-to-list 'popwin:special-display-config
;; 			   `(,ac-dcd-error-buffer-name :noselect t))
;;   (add-to-list 'popwin:special-display-config
;; 				 `(,ac-dcd-document-buffer-name :position right :width 80)))

(setq ac-dcd-executable "/Users/liranz/git/DCD/bin/dcd-client")
(setq ac-dcd-flags '("-I/Users/liranz/git/wekapp" "-I/usr/share/dmd/src/phobos"))
;(setq ac-dcd-server-executable "/Users/liranz/git/DCD/bin/dcd-server")
;(setq flycheck-dmd-include-path (list "/Users/liranz/git/wekapp"))
(setq flycheck-d-dmd-executable "/Users/liranz/dmd-flycheck")
