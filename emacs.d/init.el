(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(if (fboundp 'fringe-mode) (fringe-mode 0))

(add-to-list 'load-path "~/.emacs.d/contrib/smex")
(add-to-list 'load-path "~/.emacs.d/contrib/expand-region.el")

(defalias 'yes-or-no-p 'y-or-n-p)

(setq confirm-nonexistent-file-or-buffer nil)
(setq require-final-newline nil)
(setq mouse-yank-at-point t)

(delete-selection-mode t)
(global-hl-line-mode 1)
(auto-compression-mode t)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)
(setq ido-ignore-extensions t)
(ido-everywhere t)
(ido-mode 1)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "places" user-emacs-directory))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'paren)
(set-face-background 'show-paren-match-face "#333333")
(set-face-foreground 'show-paren-mismatch-face "red")
(set-face-attribute 'show-paren-match-face nil :weight 'normal)
(set-face-attribute 'show-paren-mismatch-face nil :weight 'normal)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
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
