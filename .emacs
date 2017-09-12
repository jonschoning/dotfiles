(setq inhibit-startup-message t
  inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")
 (put 'downcase-region 'disabled nil)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(set-cursor-color "#0a9dff")
(setq default-directory "~/")
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)
(global-set-key "\M- " 'hippie-expand)
(global-set-key "\C-cd" 'zeal-at-point)
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)
; (setq debug-on-error t)
(setq ensime-startup-snapshot-notification nil) 
(server-start)

;(require 'ensime)
;(define-key ensime-mode-map (kbd "M-.") 'ensime-inspect-type-at-point)
;(add-hook 'prog-mode-hook (lambda () (subword-mode 0)))
;(add-hook 'haskell-mode-hook (lambda () (subword-mode 1)))

;; Always ALWAYS use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

(setq abbrev-mode t)

;; Automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq browse-url-browser-function 'browse-url-generic
    browse-url-generic-program "google-chrome")

(defun font-size (n)
   "Prompt the user for font-size n, and apply to set-face-attribute :height"
  (interactive "nfont-size: ")
  (set-face-attribute 'default nil :height (* 10 n)))

(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default nil :height (+ 10 (face-attribute 'default :height))))
(define-key global-map [?\C-x ?\C-=] 'increase-font-size)

(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default nil :height (+ (- 10) (face-attribute 'default :height))))
(define-key global-map [?\C-x ?\C--] 'decrease-font-size)

; packages begin /********************************************************************************/ 
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir ".emacs.d/init"))

;; Add every subdirectory of ~/.emacs.d/vendor to the load path
(dolist
    (project (directory-files (concat dotfiles-dir ".emacs.d/vendor") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
(require 'elm-mode)
(require 'rust-mode)

(setq js-pkg-full
    '(js-terminal
      js-dired
      js-nav
      js-ido
      js-git
      js-org
      ;;js-mail
       ))

;; Now load other things
(dolist (file js-pkg-full)
  (require file))

;; Macro for X specific code
(defmacro Xlaunch (&rest x)
  (list 'if (eq window-system 'x) (cons 'progn x)))
(Xlaunch (require 'js-x11))


;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(provide 'init-themes)

(load-theme 'doom-tomorrow-night t)
;(load-theme 'doom-one-light t)
;(load-theme 'badwolf t)
;(load-theme 'leuven t)
;(load-theme 'eink t)

; (load-theme 'ir-black t)
; (load-theme 'eink t)
; (load-theme 'seoul256 t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("2e973a84accb627f603f309fc13938daa227055d2a6528c80a9b7a9e2dd8da6b" "4182c491b5cc235ba5f27d3c1804fc9f11f51bf56fb6d961f94788be034179ad" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "77ab33a45a8d39566f24cd6a9b28c78eec89882004ed194587e210399813d009" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "b378249b7f647796b186c70f61eaaee7aa1bd123681d5ca8c44d3ca8875e1b70" "2f0a552a9d14fe8ddaaacdb7b82a0eee1ea1f7f5d0850789915e5b04a1b9669f" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "dacce23bc9bace2248ebbd89756fd74f213c754b7b022fa3f090e220faf1a813" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "c9321e2db48a21fc656a907e97ee85d8cd86967855bf0bed3998bcf9195c758b" "07365f2fe1687187a1c0a8f0298fb2b1792573c3fb8dda51a0c46912975d194a" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "63dd8ce36f352b92dbf4f80e912ac68216c1d7cf6ae98195e287fd7c7f7cb189" "23ccf46b0d05ae80ee0661b91a083427a6c61e7a260227d37e36833d862ccffc" "9346200d23f505b244336e46b4aa3352d00f9bb065b87550e752f04ba14c7c92" "32ffeb13f3c152300d14757b431967e63da005f54712dad6a2f8b8b33fb94bac" "5fbd4efeb58d6a446e3e370226b37dad5c9645bbe5ea11cc83ea2e22e073bf1c" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "6254372d3ffe543979f21c4a4179cd819b808e5dd0f1787e2a2a647f5759c1d1" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "0eea76fe89061a7f6da195f4a976c0b91150de987b942fac2dd10992aea33833" "4486ade2acbf630e78658cd6235a5c6801090c2694469a2a2b4b0e12227a64b9" "7dbb593ad0fb90230b196ffbd6a503c3e9086925cc68f212e625a017b8c824a7" "9492d427a99f6e99c66d31a804e38a6ff995dec7c5940e5dd37f242d39fd41f0" "12ea40aa3720b54d31fd32b9406fb92dad6a5306f8310071b63b01217fb2cafc" "7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "ff52e9e329c5a66eae3570e3f17288d0a9f96403ce1ac7cbca5a193ebc500936" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "ce9e8c85e61d04230761cc2b6e359ded9371fc421ee9cecaf44c79288729b326" "470321d339d4c9c52ce4c57c10291025c53b759cb877f20409ae6d08b6fd269b" default)))
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-show-debug-tips nil)
 '(package-selected-packages
   (quote
    (doom-themes mustache-mode mustache lsp-rust lsp-mode ox-gfm racket-mode flycheck-haskell zenburn-theme zeal-at-point yaml-mode w3m use-package tuareg tle tao-theme strace-mode smex scala-mode2 rustfmt rjsx-mode rinari restart-emacs react-snippets rainbow-delimiters psci psc-ide powershell persp-mode-projectile-bridge pdf-tools oceanic-theme multi-term mu4e-maildirs-extension mu4e-alert markdown-mode key-chord jsx-mode jist iy-go-to-char ir-black-theme intero idris-mode ido-vertical-mode ido-ubiquitous ido-grid-mode hydra hindent haskell-emacs go-mode go gh fstar-mode fsharp-mode format-sql flymd flymake-rust flycheck-stack flycheck-rust flycheck-purescript flycheck-ocaml flycheck-elm evil-surround evil-paredit evil-org evil-matchit evil-magit evil-leader evil-commentary ess-view ess-R-object-popup ess-R-data-view ensime elm-mode elixir-mode eink-theme ein ediprolog docker discover-my-major dired+ deferred darktooth-theme company-ghci company-ghc circe cargo blackboard-theme badwolf-theme atom-one-dark-theme aria2 anzu ahk-mode ack-menu ack ac-emmet ac-cider)))
 '(safe-local-variable-values
   (quote
    ((intero-targets "grotesque:lib")
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :slant normal :weight normal :height 101 :width normal))))
 '(cursor ((t (:background "#ff0099")))))

(require 'evil)    
(evil-mode 1)  
(require 'undo-tree)
(require 'evil-matchit)
(global-evil-matchit-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evil-commentary-mode)
(require 'magit)
(require 'evil-magit)
; (load "ess-site")
; (require 'ess-view)
; (ess-toggle-underscore nil)
;(pdf-tools-install)
; (define-key evil-normal-state-map (kbd "C-]") (kbd "\\ M-.")

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'auto-complete-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'auto-complete-mode)
(add-hook 'html-mode-hook 'linum-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'css-mode-hook  'auto-complete-mode)
(add-hook 'css-mode-hook  'ac-emmet-css-setup)
(add-hook 'css-mode-hook  'linum-mode)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))
(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
(define-key evil-insert-state-map (kbd "C-@") 'company-complete)

(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

;; modes to map to different default states
(dolist (mode-map '((ag-mode . emacs)
                    (cider-repl-mode . emacs)
                    (comint-mode . emacs)
                    (gnus-tree-mode . emacs)
                    (haskell-interactive-mode . emacs)
                    (intero-repl-mode . emacs)
                    (idris-repl-mode . emacs)
                    (idris-info-mode . emacs)
                    (idris-hole-list-mode . emacs)
                    (idris-prover-script-mode . emacs)
                    (idris-tree-info-mode . emacs)
                    (eshell-mode . emacs)
                    (fundamental-mode . emacs)
                    (error-mode . emacs)
                    (git-commit-mode . insert)
                    (git-rebase-mode . emacs)
                    (circe-server-mode . emacs)
                    (circe-channel-mode . emacs)
                    (help-mode . emacs)
                    (pdf-view-mode . emacs)
                    (term-mode . emacs)))
  (evil-set-initial-state `,(car mode-map) `,(cdr mode-map)))
(global-set-key (kbd "C-z") 'evil-mode)

(setq haskell-interactive-prompt ">>> ")
; (company-quickhelp-mode 1) 
;(add-to-list 'company-backends 'company-ghc)

; ibuffer
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

;gnus
(setq gnus-select-method '(nntp "news.gmane.org")
      ;gnus-use-trees 't
      )


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

; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
; (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
; (setq haskell-process-show-debug-tips nil)

; (autoload 'ghc-init "ghc" nil t)
; (autoload 'ghc-debug "ghc" nil t)
; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
; (add-hook 'haskell-mode-hook (lambda () 
;  (local-set-key (kbd "<f12>") 'ghc-show-type)
;  (local-set-key (kbd "<S-f12>") 'ghc-show-info)
;  (local-set-key (kbd "<tab>") 'ghc-complete)
;  (setq zeal-at-point-docset "haskell")
;  ))

;; circe
(setq circe-reduce-lurker-spam t)
(setq circe-network-options
      `(("Freenode"
         :nick "_platz"
         :host "irc.freenode.net"
         :port (6667 . 6697))))

; ; haskell
; (add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "<f12>") 'intero-goto-definition)
     (define-key haskell-mode-map (kbd "C-c C-g") 'intero-goto-definition)
     ))

; (with-eval-after-load 'intero
;   (setf (flycheck-checker-get 'intero 'next-checkers) '((warning . haskell-hlint))))

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

;; specify the path to the plugin directory
; (add-to-list 'load-path "~/.emacs.d/lisp/psc-ide-emacs/")
;; specify path to the 'psc-ide' executable
; (customize-set-variable 'psc-ide-executable "/home/jon/.local/bin/psc-ide")
; (require 'psc-ide)
; (add-hook 'purescript-mode-hook
;  (lambda ()
;    (psc-ide-mode)
;    (company-mode)))



; ; (require 'yasnippet)
; ; (yas-global-mode 1)

; (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

; (projectile-global-mode)

; ; arduino
; (add-to-list 'load-path "~/.emacs.d/vendor/arduino-mode")
; (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
; (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)


;; (require 'json)
;; (require 'cl-lib)
;; (require 'files)
;; (require 'ido)
;; (require 'thingatpt)
;; (require 'dash)
;; (require 'compile)
;; (require 'dired)
;; (require 'popup)
;; (require 'etags)
;; (require 'flycheck)
;; (require 's)

;; (add-to-list 'load-path (expand-file-name (concat (file-name-directory (or load-file-name buffer-file-name)) "/src/")))
;; (add-to-list 'load-path (expand-file-name (concat (file-name-directory (or load-file-name buffer-file-name)) "/src/actions")))


(defun shell-command-on-region-replace (start end command)
  "Run shell-command-on-region interactivly replacing the region in place"
  (interactive (let (string) 
         (unless (mark)
           (error "The mark is not set now, so there is no region"))
         (setq string (read-from-minibuffer "Shell command on region: "
                            nil nil nil
                            'shell-command-history))
         (list (region-beginning) (region-end)
               string)))
  (shell-command-on-region start end command t t)
  )
