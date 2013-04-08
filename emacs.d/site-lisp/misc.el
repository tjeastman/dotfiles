(defvar known-mysql-database-alist
  '((test :host "localhost" :user "username" :password "password" :port 3306))
  "A list of known MySQL databases and their corresponding connection parameters.")

(defun connect-to-known-mysql-db ()
  "Connect to a known MySQL database."
  (interactive)
  (let* ((product 'mysql)
         (database-program "mysql")
         ; make a list of known database names from which to select
         (database-names (mapcar (lambda (x) (symbol-name (car x))) known-mysql-database-alist))
         (database-name (ido-completing-read "database? " database-names))
         (database-symbol (intern database-name))
         (param-plist (cdr (assoc database-symbol known-mysql-database-alist)))
         (params (list
                  (concat "--host=" (plist-get param-plist :host))
                  (concat "--user=" (plist-get param-plist :user))
                  (concat "--password=" (plist-get param-plist :password))
                  (concat "--port=" (number-to-string (plist-get param-plist :port)))
                  database-name)))
    ; create and switch to a new buffer for the SQL connection
    (switch-to-buffer (apply 'make-comint
                             (concat "db:" database-name) database-program nil params))
    ; set up SQL mode for the new buffer
    (setq sql-interactive-product product)
    (setq sql-buffer (current-buffer))
    (sql-interactive-mode)))

(defun start-new-shell-always ()
  "Start up a new shell buffer regardless of how many shells are already running."
  (interactive)
  (let ((shell-buffer-index 0)
        (shell-buffer-name-format "*shell-%d*")
        (shell-buffer-name))
    (while ; loop until an unused shell buffer name is found
        (progn
          (incf shell-buffer-index)
          (setq shell-buffer-name (format shell-buffer-name-format shell-buffer-index))
          (get-buffer shell-buffer-name)))
    (shell shell-buffer-name)))

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                         'fullboth)))

(defun ido-find-recent-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Find recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
