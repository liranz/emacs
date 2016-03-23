(defmacro bypass-trash-in-function (fun)
  "Set FUN to always use normal deletion, and never trash.

Specifically, the value of `delete-by-moving-to-trash' will be
set to nil inside FUN, so any deletions that happen inside FUN or
any functions called by it will bypass the trash."
  `(defadvice ,fun (around no-trash activate)
     "Ignore `delete-by-moving-to-trash' inside this function.

See `bypass-trash-in-function' for more information."
     (let (delete-by-moving-to-trash)
       ad-do-it)))

;; Any server function that may delete the server file should never
;; move it to trash instead.
(mapc (lambda (fun) (eval `(bypass-trash-in-function ,fun)))
      '(server-start server-sentinel server-force-delete))

(if (not in-terminal)
    (server-force-delete) )

(if (not in-terminal)
    (server-start))
