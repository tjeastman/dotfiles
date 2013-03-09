(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(if (fboundp 'fringe-mode) (fringe-mode 0))

(let ((default-directory "~/.emacs.d/contrib/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/themes/zenburn-emacs")

(require 'color-theme-zenburn)
(when (display-graphic-p)
  (color-theme-zenburn))

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
(setq ido-auto-merge-work-directories-length -1)
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

(global-set-key (kbd "C-c i") 'imenu)
(set-default 'imenu-auto-rescan t)

(setq org-directory "~/Documents/org/")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Documents/org/mobile.org")
(setq org-agenda-files '("~/Documents/org/agenda/"))

; eliminate bold text
(mapc (lambda (face)
	(set-face-attribute face nil :weight 'normal))
      (face-list))

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                         'fullboth)))
