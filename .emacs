; default
(setq inhibit-startup-message t
  inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")
(put 'downcase-region 'disabled nil)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(set-cursor-color "#0a9dff")
(setq default-directory "~/")
(set-default 'truncate-lines t)

; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(provide 'init-themes)
(load-theme 'badwolf t)

; custom vars
(custom-set-variables
 '(column-number-mode t)
 '(blink-cursor-mode)
 '(tool-bar-mode nil))

; custom fonts
(custom-set-faces
 '(flymake-errline ((((class color)) (:background "Gray30")))) '(flymake-warnline ((((class color)) (:background "Gray20"))))
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "bitstream" :slant normal :weight normal :height 90 :width normal)))))

; packages begin /********************************************************************************/ 
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; paredit
(add-to-list 'load-path "~/.emacs.d/vendor/paredit")
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

; rainbow
(add-to-list 'load-path "~/.emacs.d/vendor/rainbow-delimiters")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

; arduino
(add-to-list 'load-path "~/.emacs.d/vendor/arduino-mode")
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

; haskell
(autoload 'ghc-init "ghc" nil t)


; hooks
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

; packages end /********************************************************************************/ 
