(setq inhibit-startup-message t
  inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")
 (put 'downcase-region 'disabled nil)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(set-cursor-color "#0a9dff")
(setq default-directory "~/")
(set-default 'truncate-lines t)
(global-set-key "\M- " 'hippie-expand)
; (setq debug-on-error t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(provide 'init-themes)
(load-theme 'badwolf t)

(defun font-size (n)
   "Prompt the user for font-size n, and apply to set-face-attribute :height"
  (interactive "nfont-size: ")
  (set-face-attribute 'default nil :height (* 10 n)))

;;; ido
(require 'ido)
(ido-mode t)

; custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(haskell-process-show-debug-tips nil)
 '(tool-bar-mode nil))


; custom fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "bitstream" :slant normal :weight normal :height 90 :width normal)))))

; packages begin /********************************************************************************/ 
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'evil)    
(evil-mode 1)  
(require 'undo-tree)
(require 'evil-matchit)
(global-evil-matchit-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evil-commentary-mode)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

;; modes to map to different default states
(dolist (mode-map '((ag-mode . emacs)
                    (cider-repl-mode . emacs)
                    (comint-mode . emacs)
                    (haskell-interactive-mode . emacs)
                    (eshell-mode . emacs)
                    (fundamental-mode . emacs)
                    (git-commit-mode . insert)
                    (git-rebase-mode . emacs)
                    (help-mode . emacs)
                    (term-mode . emacs)))
  (evil-set-initial-state `,(car mode-map) `,(cdr mode-map)))
(global-set-key (kbd "C-z") 'evil-mode)

; ibuffer
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

; paredit
(add-to-list 'load-path "~/.emacs.d/vendor/paredit")
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(eval-after-load 'paredit '(progn (define-key paredit-mode-map (kbd "M-r") 'move-to-window-line-top-bottom)
				  (define-key paredit-mode-map (kbd "M-R") 'paredit-raise-sexp)))

; markdown
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; rainbow
; (add-to-list 'load-path "~/.emacs.d/vendor/rainbow-delimiters")
(require 'rainbow-delimiters)
(rainbow-delimiters-mode)

(show-paren-mode 1)
(set-face-background 'show-paren-match "#444")

(require 'rinari)
(global-rinari-mode)

(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'rainbow-delimiters-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
; (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(setq haskell-process-show-debug-tips nil)

; ; (require 'yasnippet)
; ; (yas-global-mode 1)

; (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

; (projectile-global-mode)

; ; arduino
; (add-to-list 'load-path "~/.emacs.d/vendor/arduino-mode")
; (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
; (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

; ; haskell
; (autoload 'ghc-init "ghc" nil t)
; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
; (eval-after-load "haskell-mode"
;   '(progn
;      (define-key haskell-mode-map (kbd "C-x C-d") nil)
;      (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;      (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
;      (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
;      (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;      (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;      (define-key haskell-mode-map (kbd "C-c M-.") nil)
;      (define-key haskell-mode-map (kbd "C-c C-d") nil)))

; ; (add-hook 'haskell-mode-hook 'turn-on-haskell-font-lock)
; ; (let ((font "Hasklig"))
; ;   (set-default-font font nil t)
; ;   (set-fontset-font t '(8500 . 8800) font))
; ; (setq haskell-font-lock-symbols t)

;; (require 'iy-go-to-char)
;; (global-set-key (kbd "C-c f") 'iy-go-to-char)
;; (global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
;; (global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
;; (global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)
;; (global-set-key (kbd "C-c t") 'iy-go-up-to-char)
;; (global-set-key (kbd "C-c T") 'iy-go-up-to-char-backward)

