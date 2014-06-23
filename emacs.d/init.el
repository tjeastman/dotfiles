(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'global-font-lock-mode) (global-font-lock-mode t))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(if (fboundp 'fringe-mode) (fringe-mode 0))

; emacs feature state files
(setq user-emacs-state-directory
      (expand-file-name "state" user-emacs-directory))
; emacs contrib packages
(setq user-emacs-contrib-directory
      (expand-file-name "contrib" user-emacs-directory))

; load prelude...
(load (expand-file-name "prelude/init.el" user-emacs-contrib-directory))

(prelude-require-packages
 '(yaml-mode
   markdown-mode
   smex
   ido-ubiquitous
   websocket
   request
   ein
   ace-jump-mode
   expand-region
   git-commit-mode
   git-rebase-mode
   jinja2-mode
   web-mode
   yasnippet
   clojure-mode))

;;; Uncomment the modules you'd like to use and restart Prelude afterwards

(require 'prelude-programming)
(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
;; (require 'prelude-helm) ;; Interface for narrowing and search

;; (require 'prelude-c)
;; (require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
;; (require 'prelude-css)
;; (require 'prelude-emacs-lisp)
;; (require 'prelude-erc) ;; Emacs IRC client
;; (require 'prelude-erlang)
;; (require 'prelude-haskell)
;; (require 'prelude-js)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations
;; (require 'prelude-latex)
;; (require 'prelude-lisp)
;; (require 'prelude-mediawiki)
;; (require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
;; (require 'prelude-perl)
;; (require 'prelude-python)
;; (require 'prelude-ruby)
;; (require 'prelude-scala)
;; (require 'prelude-scheme)
;; (require 'prelude-scss)
;; (require 'prelude-web) ;; Emacs mode for web templates
;; (require 'prelude-xml)

(setq prelude-guru nil)

;; (add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
;; (load "misc")

;; (setq confirm-nonexistent-file-or-buffer nil)
;; (setq require-final-newline nil)
;; (setq mouse-yank-at-point t)
;; (setq vc-follow-symlinks t)

;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

;; (delete-selection-mode t)
;; (global-hl-line-mode 1)
;; (auto-compression-mode t)

;; (require 'request)
;; (setq request-storage-directory
;;       (expand-file-name "request" user-emacs-state-directory))

;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)

;; ;; (require 'paren)
;; ;; (when (display-graphic-p)
;; ;;   (set-face-background 'show-paren-match-face "#333333")
;; ;;   (set-face-foreground 'show-paren-mismatch-face "red"))
;; ;; (set-face-attribute 'show-paren-match-face nil :weight 'normal)
;; ;; (set-face-attribute 'show-paren-mismatch-face nil :weight 'normal)
;; ;; (show-paren-mode t)
;; ;; (setq show-paren-delay 0)
;; ;; (setq show-paren-style 'expression)

;; ;; (setq skeleton-pair t)
;; ;; (global-set-key "(" 'skeleton-pair-insert-maybe)
;; ;; (global-set-key "[" 'skeleton-pair-insert-maybe)
;; ;; (global-set-key "{" 'skeleton-pair-insert-maybe)
;; ;; (global-set-key "\"" 'skeleton-pair-insert-maybe)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode +1)

(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; ; use regex searches by default
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-;") 'backward-kill-word)

;; (global-set-key (kbd "C-c i") 'imenu)
;; (set-default 'imenu-auto-rescan t)

;; (require 'key-chord)
;; (key-chord-mode 1)
;; (key-chord-define-global ";b" 'ido-switch-buffer)
;; (key-chord-define-global ";f" 'ido-find-file)
;; (key-chord-define-global ";r" 'ido-find-recent-file)
;; (key-chord-define-global ";g" 'magit-status)
;; (key-chord-define-global ";j" 'ace-jump-mode)
;; (key-chord-define-global ";s" 'start-new-shell-always)

;; (setq comint-process-echoes t
;;       comint-prompt-read-only t)

;; ; allow for additional prompt characters in the shell
;; (setq shell-prompt-pattern "^[^#$%>⇒»\n]*[#$%>⇒»] *")

;; ; eliminate bold text
;; (mapc (lambda (face)
;; 	(set-face-attribute face nil :weight 'normal))
;;       (face-list))

;; (require 'yasnippet)
;; (yas/global-mode 1)

;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-guess-project t)
;; (setq ropemacs-enable-autoimport t)
;; (setq ropemacs-autoimport-modules '("os" "sys"))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-emacs-directory))
;; (ac-config-default)
;; (ac-flyspell-workaround)

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-ropemacs)
;;             ;fix:yasnippet completion source is broken
;;             ;(add-to-list 'ac-sources 'ac-source-yasnippet)
;;             (define-key py-mode-map "'" 'skeleton-pair-insert-maybe)
;;             (flymake-mode)
;; ))

;; (setq pycodechecker "~/local/bin/pycheck.sh")
;; (when (load "flymake" t)
;;   (defun flymake-pycodecheck-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list pycodechecker (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pycodecheck-init)))

;; ; clean up the mode line
;; (require 'diminish)
;; (eval-after-load 'yasnippet '(diminish 'yas-minor-mode " Y"))
;; (eval-after-load 'abbrev '(diminish 'abbrev-mode "Ab"))
;; (eval-after-load 'flyspell '(diminish 'flyspell-mode "FSp"))
;; (eval-after-load 'ropemacs '(diminish 'ropemacs-mode "Rp"))

;; ; diminish flymake mode line without losing the number of errors and warnings
;; (defun flymake-report-short-status (e-w &optional status)
;;   "Show shortened status in mode line."
;;   (when e-w
;;     (setq flymake-mode-line-e-w e-w))
;;   (when status
;;     (setq flymake-mode-line-status status))
;;   (let* ((mode-line " FMk"))
;;     (when (> (length flymake-mode-line-e-w) 0)
;;       (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
;;     (setq mode-line (concat mode-line flymake-mode-line-status))
;;     (setq flymake-mode-line mode-line)
;;     (force-mode-line-update)))
;; (defalias 'flymake-report-status 'flymake-report-short-status)

;; (add-hook 'emacs-lisp-mode-hook
;;           (lambda () (setq mode-name "ELisp")))
;; (add-hook 'python-mode-hook
;;           (lambda () (setq mode-name "Py")))
;; (add-hook 'text-mode-hook
;;           (lambda () (setq mode-name "Txt")))
;; (add-hook 'shell-mode-hook
;;           (lambda () (setq mode-name "Sh")))

;; (require 'magit)

;; (require 'flymake-cursor)

;; (global-set-key (kbd "C-c n") 'flymake-goto-next-error)
;; (global-set-key (kbd "C-c p") 'flymake-goto-prev-error)
;; (setq flymake-no-changes-timeout 3)
;; (setq flymake-start-syntax-check-on-newline nil)

;; ; get some commands to work through the terminal
;; (define-key key-translation-map (kbd "S-<f9>") (kbd "C-;"))
;; (define-key key-translation-map (kbd "S-<f8>") (kbd "C-="))
;; (define-key key-translation-map (kbd "S-<f7>") (kbd "C-,"))

;; ; open zsh script files in sh-mode
;; (add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))
;; (add-to-list 'auto-mode-alist '("\\.zsh-theme$" . sh-mode))
;; (add-to-list 'auto-mode-alist '("zshrc$" . sh-mode))
;; (add-to-list 'auto-mode-alist '("bashrc$" . sh-mode))
;; (add-to-list 'auto-mode-alist '("bash_profile$" . sh-mode))
;; (add-to-list 'auto-mode-alist '("bash_logout$" . sh-mode))
;; ; open octave source files in octave-mode
;; (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
;; ; open README files in text mode
;; (add-to-list 'auto-mode-alist '("README$" . text-mode))

;; ; set up abbreviations
;; (setq-default abbrev-mode t)
;; (setq abbrev-file-name (expand-file-name "abbreviations" user-emacs-directory))
;; (quietly-read-abbrev-file abbrev-file-name)
;; (setq save-abbrevs 'silently)

(setq ispell-personal-dictionary "~/.aspell.en.pws")

;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'python-mode-hook 'flyspell-prog-mode)
;; (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
;; (add-hook 'c-mode-hook 'flyspell-prog-mode)
;; (add-hook 'c++-mode-hook 'flyspell-prog-mode)

;; (setq-default truncate-lines t)

;; ; enable some commands
;; (put 'downcase-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)

;; (require 'personal nil t)
