(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'global-font-lock-mode) (global-font-lock-mode t))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(if (fboundp 'fringe-mode) (fringe-mode 0))

; handle older versions of emacs
(unless (boundp 'user-emacs-directory)
  (setq user-emacs-directory "~/.emacs.d/"))

; organize emacs feature state files
(setq user-emacs-state-directory (expand-file-name "state" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(load "misc")

(defun add-top-level-subdirectories-to-load-path (&rest top-level-dirs)
  "Augment load-path with the top-level subdirectories of a list of directories."
  (dolist (top-level-dir top-level-dirs)
    (dolist (top-level-subdir (directory-files top-level-dir t "\\w+"))
      (add-to-list 'load-path top-level-subdir))))

(add-top-level-subdirectories-to-load-path
 (expand-file-name "contrib" user-emacs-directory)
 (expand-file-name "themes" user-emacs-directory))

(require 'color-theme-zenburn)
(color-theme-zenburn)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq confirm-nonexistent-file-or-buffer nil)
(setq require-final-newline nil)
(setq mouse-yank-at-point t)
(setq vc-follow-symlinks t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(delete-selection-mode t)
(global-hl-line-mode 1)
(auto-compression-mode t)

; nicer scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position t)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)
(setq ido-ignore-extensions t)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-save-directory-list-file (expand-file-name "ido.last" user-emacs-state-directory))
(ido-everywhere t)
(ido-mode 1)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'smex)
(setq smex-save-file (expand-file-name "smex-items" user-emacs-state-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" user-emacs-state-directory))

(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" user-emacs-state-directory)
      recentf-max-saved-items 1000
      recentf-max-menu-items 25)
(recentf-mode +1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'paren)
(when (display-graphic-p)
  (set-face-background 'show-paren-match-face "#333333")
  (set-face-foreground 'show-paren-mismatch-face "red"))
(set-face-attribute 'show-paren-match-face nil :weight 'normal)
(set-face-attribute 'show-paren-mismatch-face nil :weight 'normal)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)

(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

; use regex searches by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-;") 'backward-kill-word)

(global-set-key (kbd "C-c i") 'imenu)
(set-default 'imenu-auto-rescan t)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global ";b" 'ido-switch-buffer)
(key-chord-define-global ";f" 'ido-find-file)
(key-chord-define-global ";r" 'ido-find-recent-file)
(key-chord-define-global ";g" 'magit-status)
(key-chord-define-global ";j" 'ace-jump-mode)
(key-chord-define-global ";s" 'start-new-shell-always)

(setq comint-process-echoes t
      comint-prompt-read-only t)

(setq ansi-color-names-vector
      ["#3F3F3F" "#CC9393" "#7F9F7F" "#E3CEAB"
       "#DFAF8F" "#CC9393" "#8CD0D3" "#DCDCCC"])

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; allow for additional prompt characters in the shell
(setq shell-prompt-pattern "^[^#$%>⇒»\n]*[#$%>⇒»] *")

; eliminate bold text
(mapc (lambda (face)
	(set-face-attribute face nil :weight 'normal))
      (face-list))

(require 'yasnippet)
(yas/global-mode 1)

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
(setq ropemacs-autoimport-modules '("os" "sys"))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-emacs-directory))
(ac-config-default)
(ac-flyspell-workaround)

(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-ropemacs)
            ;fix:yasnippet completion source is broken
            ;(add-to-list 'ac-sources 'ac-source-yasnippet)
            (define-key py-mode-map "'" 'skeleton-pair-insert-maybe)
            (flymake-mode)
))

(setq pycodechecker "~/local/bin/pycheck.sh")
(when (load "flymake" t)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))

; clean up the mode line
(require 'diminish)
(eval-after-load 'yasnippet '(diminish 'yas-minor-mode " Y"))
(eval-after-load 'abbrev '(diminish 'abbrev-mode "Ab"))
(eval-after-load 'flyspell '(diminish 'flyspell-mode "FSp"))
(eval-after-load 'ropemacs '(diminish 'ropemacs-mode "Rp"))

; diminish flymake mode line without losing the number of errors and warnings
(defun flymake-report-short-status (e-w &optional status)
  "Show shortened status in mode line."
  (when e-w
    (setq flymake-mode-line-e-w e-w))
  (when status
    (setq flymake-mode-line-status status))
  (let* ((mode-line " FMk"))
    (when (> (length flymake-mode-line-e-w) 0)
      (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
    (setq mode-line (concat mode-line flymake-mode-line-status))
    (setq flymake-mode-line mode-line)
    (force-mode-line-update)))
(defalias 'flymake-report-status 'flymake-report-short-status)

(add-hook 'emacs-lisp-mode-hook
          (lambda () (setq mode-name "ELisp")))
(add-hook 'python-mode-hook
          (lambda () (setq mode-name "Py")))
(add-hook 'text-mode-hook
          (lambda () (setq mode-name "Txt")))
(add-hook 'shell-mode-hook
          (lambda () (setq mode-name "Sh")))

(setq ipython-command "/usr/bin/ipython")
(require 'ipython nil t)

(require 'magit)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c j") 'ace-jump-mode)

(require 'flymake-cursor)

(global-set-key (kbd "C-c n") 'flymake-goto-next-error)
(global-set-key (kbd "C-c p") 'flymake-goto-prev-error)
(setq flymake-no-changes-timeout 3)
(setq flymake-start-syntax-check-on-newline nil)

; get some commands to work through the terminal
(define-key key-translation-map (kbd "S-<f9>") (kbd "C-;"))
(define-key key-translation-map (kbd "S-<f8>") (kbd "C-="))
(define-key key-translation-map (kbd "S-<f7>") (kbd "C-,"))

; open zsh script files in sh-mode
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme$" . sh-mode))
(add-to-list 'auto-mode-alist '("zshrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("bashrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("bash_profile$" . sh-mode))
(add-to-list 'auto-mode-alist '("bash_logout$" . sh-mode))
; open octave source files in octave-mode
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
; open README files in text mode
(add-to-list 'auto-mode-alist '("README$" . text-mode))

; set up abbreviations
(setq-default abbrev-mode t)
(setq abbrev-file-name (expand-file-name "abbreviations" user-emacs-directory))
(quietly-read-abbrev-file abbrev-file-name)
(setq save-abbrevs 'silently)

(setq ispell-personal-dictionary "~/.aspell.en.pws")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)

(setq-default truncate-lines t)

; enable some commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(require 'personal nil t)
