(require 'dash)
(require 's)

;; Make the super key work in Windows
(setq
 w32-pass-lwindow-to-system nil
 w32-pass-rwindow-to-system nil
 w32-pass-apps-to-system nil
 w32-lwindow-modifier 'super ; Left Windows key
 w32-rwindow-modifier 'super ; Right Windows key
 w32-apps-modifier 'hyper) ; Menu key


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
