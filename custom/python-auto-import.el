
(defun python-auto-import (only-first-component)
  "automatically import the required symbol under the cursor. With prefix argument, only takes first module path component (so 'os.path.exists' will cause importing of 'os' alone)"
  (interactive "P")
  (let ((temp-point (point))
        (prev-size (buffer-size)))
    (python-insert-import-line-at-beginning-of-buffer (--deduce-needed-import-string only-first-component))
    (goto-char (+ temp-point (- (buffer-size) prev-size)))))

(defun --deduce-needed-import-string (only-first-component)
  (let ((symbol (--python-info-current-symbol)))
    (let ((cached-result (gethash symbol --symbol-cache)))
      (let ((result (if cached-result
                        cached-result
                      (--save-result symbol (--parse-import-string-from-symbol symbol)))))))))


(defun --save-result (symbol result)
  (if (not (s-starts-with? "from ." result))
      (progn
        (puthash symbol result --symbol-cache)
        (--dump-symbol-cache)))
  result)

(defvar python-auto-import-cache-filename "~/.emacs.d/.python-auto-import-cache")

(defun --dump-symbol-cache ()
  (with-temp-file python-auto-import-cache-filename
    (emacs-lisp-mode)
    (insert ";; this file was automatically generated by python-auto-import.el")
    (newline)
    (insert "(setq --symbol-cache (make-hash-table :test 'equal))")
    (newline)
    (maphash (lambda (key value)
               (insert (format "(puthash \"%s\" \"%s\" --symbol-cache)" key value))
               (newline))
             --symbol-cache)
     --symbol-cache))

(defun --load-symbol-cache ()
  (load python-auto-import-cache-filename t)
  (if (not (boundp '--symbol-cache))
      (setq --symbol-cache (make-hash-table :test 'equal))))

(--load-symbol-cache)

(defun --parse-import-string-from-symbol (symbol)
  (let ((parts (split-string symbol "\\.")))
      (if (<= (list-length parts) 1)
          (format "from %s import %s" (read-string (format "import %s from? " symbol)) symbol)
          (format "import %s" (if (or
                                   only-first-component
                                   (python-autoimport--is-first-component-enough symbol))
                                  (car parts)
                                (mapconcat 'identity (nbutlast parts 1) "."))))))

(defun --python-info-current-symbol ()
  (if (< emacs-major-version 24)
      (with-syntax-table python-dotty-syntax-table
        (current-word))
    (python-info-current-symbol)))

(defun python-autoimport--is-first-component-enough (symbol)
  (or
   (s-starts-with? "os.path." symbol)
   ))

(defun python-insert-import-line-at-beginning-of-buffer (import-string)
  (save-excursion
    (beginning-of-buffer)
    (--skip-comments-and-strings)
    (--ensure-import-block)
    (newline)
    (forward-line -1)
    (insert-string import-string)
    (forward-paragraph)
    (python-isort-buffer)
    ))

(defun --ensure-import-block ()
  (if (not (or (looking-at "import ") (looking-at "from ")))
      (progn
        (newline-and-indent)
        (previous-line))))

(defun --skip-comments-and-strings ()
  (while (--looking-at-comment-or-string)
    (forward-line)))
(defun --looking-at-comment-or-string ()
  (let ((face (get-text-property (point) 'face)))
    (or (eq face 'font-lock-comment-face)
        (eq face 'font-lock-comment-delimiter-face)
        (eq face 'font-lock-string-face))))

(defun uniquify-all-lines-region (start end)
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun --end-of-chunk ()
  (goto-char (point-at-eol))
  (let ((limit (point-at-bol))
        temp
        expr-beg)
    (while (and (setq temp (nth 1 (syntax-ppss)))
                (<= limit temp))
      (goto-char temp)
      (setq expr-beg (point)))
    (when expr-beg
        (goto-char expr-beg)
      (forward-sexp))))

(defun my/sort-lines-as-exprs (reverse beg end) ; credit goes to http://bit.ly/VbW9AJ
  "sort lines, or whole expression if line ends mid-expression."
  (interactive "P\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (sort-subr reverse
                 'forward-line
                 '--end-of-chunk))))

(defun python-isort-buffer ()
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (push-mark)
    (end-of-buffer)
    (shell-command-on-region (point) (mark) "isort -" nil t)
    (pop-mark)
    ))

(provide 'python-auto-import)
