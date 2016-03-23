(defun my/c-mode-new-block (prefix) (interactive "P")
  "Opens a new C-style (curly-brace) block after the current line.
With prefix arg, forces opening brace to be in a new line"
  (beginning-of-line)
  (back-to-indentation)
  (let ((current-statement (current-word)))
    (end-of-line)
    (if (and (not prefix) (-contains? '("class" "do" "else" "for" "if" "struct" "switch" "while") current-statement))
        (insert " {")
      (newline)
      (insert "{")
      (c-indent-line-or-region))
    (newline)
    (insert "}")
    (if (-contains? '("class" "struct") current-statement)
        (insert ";"))
    (c-indent-line-or-region)
    (previous-line)
    (end-of-line)
    (newline-and-indent)))

(setq gdb-show-main t)
(add-hook 'c-mode-common-hook '(lambda ()
                                (define-key c-mode-base-map [(meta return)] 'my/c-mode-new-block)
				(local-set-key (kbd "C-c g") 'gdb-many-windows)))

(setq c-default-style "linux"
      c-basic-offset 8)

(add-hook 'prog-mode-hook '(lambda ()
                             (unless (derived-mode-p 'makefile-mode) (setq indent-tabs-mode nil))))

 (setq-default c-basic-offset 8
                  tab-width 8
                  indent-tabs-mode t)
;; (defun c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;; 	 (column (c-langelem-2nd-pos c-syntactic-element))
;; 	 (offset (- (1+ column) anchor))
;; 	 (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             ;; Add kernel style
;;             (c-add-style
;;              "linux-tabs-only"
;;              '("linux" (c-offsets-alist
;;                         (arglist-cont-nonempty
;;                          c-lineup-gcc-asm-reg
;;                          c-lineup-arglist-tabs-only))))))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (let ((filename (buffer-file-name)))
;;               ;; Enable kernel mode for the appropriate files
;;               ;; (when (and filename
;;               ;;            (string-match (expand-file-name "~/git/wekapp/weka/external/dpdk")
;;               ;;                          filename))
;;               (setq indent-tabs-mode t)
;;               (c-set-style "linux-tabs-only"))))
;)
