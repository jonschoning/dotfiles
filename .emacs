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
(global-set-key (kbd "C-x C-e") 'eval-region)
; (setq debug-on-error t)
(setq ensime-startup-snapshot-notification nil) 
(server-start)

(electric-indent-mode +1)
(setq js-indent-level 2)

(global-linum-mode t)

;(require 'ensime)
;(define-key ensime-mode-map (kbd "M-.") 'ensime-inspect-type-at-point)
;(add-hook 'prog-mode-hook (lambda () (subword-mode 0)))
;(add-hook 'haskell-mode-hook (lambda () (subword-mode 1)))

;(require 'rg)

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

;(load-theme 'leuven t)
(load-theme 'doom-tomorrow-night t)
;(load-theme 'doom-one-light t)
;(load-theme 'doom-peacock t)
;(load-theme 'badwolf t)
;(load-theme 'eink t)

; (load-theme 'ir-black t)
; (load-theme 'eink t)
; (load-theme 'seoul256 t)

(defun new-buffer ()
  (interactive)
  (switch-to-buffer (make-temp-name "buffer")))

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
    ("4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "2c88b703cbe7ce802bf6f0bffe3edbb8d9ec68fc7557089d4eaa1e29f7529fe1" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "b4c13d25b1f9f66eb769e05889ee000f89d64b089f96851b6da643cee4fdab08" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "891debfe489c769383717cc7d0020244a8d62ce6f076b2c42dd1465b7c94204d" "d1aec5dbeb0267f20d73d4e670e94d007dba09d2193ee39df2023fe61b4fe765" "4e21fb654406f11ab2a628c47c1cbe53bab645d32f2c807ee2295436f09103c6" "0598de4cc260b7201120b02d580b8e03bd46e5d5350ed4523b297596a25f7403" "013c62a1fcee7c8988c831027b1c38ae215f99722911b69e570f21fc19cb662e" "242ed4611e9e78142f160e9a54d7e108750e973064cee4505bfcfc22cc7c61b1" "1e469285a9eee5bb7099711440ab27b571d02aa860c009086ef2d341b4c5d535" "bbea3143fe920d2738e73a042d1edcc0e0c1e9726a757dc0b51ca8d5ee825255" "5715d3b4b071d33af95e9ded99a450aad674e308abb06442a094652a33507cd2" "bd23e5e571f9b951eb79941ba3927fb493c26463654add2a53f4fb0de72ef08b" "c5d320f0b5b354b2be511882fc90def1d32ac5d38cccc8c68eab60a62d1621f2" "b550fc3d6f0407185ace746913449f6ed5ddc4a9f0cf3be218af4fb3127c7877" "2a1b4531f353ec68f2afd51b396375ac2547c078d035f51242ba907ad8ca19da" "7666b079fc1493b74c1f0c5e6857f3cf0389696f2d9b8791c892c696ab4a9b64" "53d1bb57dadafbdebb5fbd1a57c2d53d2b4db617f3e0e05849e78a4f78df3a1b" "2af26301bded15f5f9111d3a161b6bfb3f4b93ec34ffa95e42815396da9cb560" "a142def5bab9c1d1964eb2bf7506e790fa09df44aa9f3e41abd198f00cd6577e" "b5ecb5523d1a1e119dfed036e7921b4ba00ef95ac408b51d0cd1ca74870aeb14" "a866134130e4393c0cad0b4f1a5b0dd580584d9cf921617eee3fd54b6f09ac37" "77c3f5f5acaa5a276ca709ff82cce9b303f49d383415f740ba8bcc76570718b9" "2e1d19424153d41462ad31144549efa41f55dacda9b76571f73904612b15fd0a" "0fd8c1b09c6c9e7116054f3fe5929775d9e9d5e49b9d1bf62dfdd5283416168e" "d69687a9877c252d9ffcc782d2e8c4dcb0f25146b2e445a4f240364b02478eda" "4d78e7a72470d6449c8a2a182291cecdf4c25d9fae7ec2a0f58110eeb8843683" "b75efc241b1403ced915204d4c719a3ed1fd378b7b3474804b1732225cc58f5c" "6ab09722e4b3d3b89e2371de0f9e99a4fca6029ac0509f60bfe3365cbffa2af1" "92ca1b3391ef563397582f88f3716bafe31d70a41f7a640eb66c605d7261d23a" "c899003423a6afbd53d30ca6054e9bc42f46e577298783232c6bed78d7c3d6d4" "7c508c2a6d6e1ff2101d5169efa84be5f891b0f385809fc5f0b5a7bd41310c52" "69fa97c316db8e8ac7360043f7deee10f597bcc1aa7ff95266d9454b15c8e7da" "58951e5509952e973cf8df32d1a076c22f286fb5f26ca547b3394b9b40353dce" "033616c0ffe70de88f4435464693e874ca0d6a742fe09ad75873f77a31c71c81" "acf1148622c01619ee8e57b70105c2420b90acecafc0e61bf02674800ce75886" "69a3632b1ca1eca6ce0fca92c02f4b3bbb9568915537eb524bf73974c2a4a224" "a9bdec8c3d52b81cb8d4bec436edd0e08859ceecae5ac2c3b0733931fdf55953" "3f9b6fcf8305290613c116e23d89007abdc8081f8677b5c53164ce54745e3ff3" "67a11bdd00035792c172aac88bffb4cd4c34cc796d01e60116ee0adad72f02eb" "cdff6242d45398379bf13d96e6b718e4c904ee06b0bc2b4eb8f83d598e34069a" "4a7abcca7cfa2ccdf4d7804f1162dd0353ce766b1277e8ee2ac7ee27bfbb408f" "ea95e5a0f64d562021bbde3f842ee7a4f397c2df46e77196b1d9cbe4a862eb10" "35a780415de03420cf8efe6afac9e9b276230a4299edac121d63c8a8ecd75041" "62f4e35def28071b729614e089a0310a80671f3413da26873f0e04d1904c58dd" "95ebf5a8991b5edba715193bda8af65d6503e5628d5d8621c0c2cdcecdcb6af4" "ef335dbcfd579d72ce9bf8a1c8e24771735968c782ffc0a9e3e939dde97ad628" "9db3bfc6fb456ea9a940c7462bab8dc0f1deea4bb2ab1ea848ed320900153fe0" "d4d0f3ee4a65a29a1090fe9af3cbbf8441efab3c3108d50c8ee93e5c981b41a5" "4c1d8746a992ce9a41579b8174c2c004ec757b34a68ad58b1e2b40b6f5299208" "b00618cf6d43d963a093e4cff9133274d0a0778b04f7e3f6ffb8c3fc60de9098" "fd5c8d7f3932af3460fba411cd48ab3cebfbeeb2b2dcb81ddffe6ae31f8bbd76" "bcab096c14baa42dd4753cc3a804e93630e057fc07e8dacbfd25f5888dd60fd6" "549fdc2ac43aec1715e9beb14f35ec3b18de110a083fc8fe7041e55de064b28d" "c06f299f5edfa80bb1873ef295ca861a042c7969ce259c0cefd8c56d256afdc7" "2ac583b4c3755f78e8ccaa7cdac0230e10238d8270d55a2cd9bc54d59a91ef89" "4f56746c3787612df970455d2beeef001c10124982f2fafe197dcaf6866c08f1" "60668f4b17b8b8780d50976c0788abed190353d21d3371b8f244dd44c103b0ea" "d2c61aa11872e2977a07969f92630a49e30975220a079cd39bec361b773b4eb3" "31e64af34ba56d5a3e85e4bebefe2fb8d9d431d4244c6e6d95369a643786a40e" "4b207752aa69c0b182c6c3b8e810bbf3afa429ff06f274c8ca52f8df7623eb60" "759416a7a5f5cb6b8cb26e6db2cf70026aa2324083a888015ee2cad0320f7f19" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "31992d4488dba5b28ddb0c16914bf5726dc41588c2b1c1a2fd16516ea92c1d8e" "323f4767d2b73d6806adfb7ef47e0566e3d1c33b40a70bf53f592d0c5b906102" "5900bec889f57284356b8216a68580bfa6ece73a6767dfd60196e56d050619bc" "2e973a84accb627f603f309fc13938daa227055d2a6528c80a9b7a9e2dd8da6b" "4182c491b5cc235ba5f27d3c1804fc9f11f51bf56fb6d961f94788be034179ad" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "77ab33a45a8d39566f24cd6a9b28c78eec89882004ed194587e210399813d009" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "b378249b7f647796b186c70f61eaaee7aa1bd123681d5ca8c44d3ca8875e1b70" "2f0a552a9d14fe8ddaaacdb7b82a0eee1ea1f7f5d0850789915e5b04a1b9669f" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "dacce23bc9bace2248ebbd89756fd74f213c754b7b022fa3f090e220faf1a813" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "c9321e2db48a21fc656a907e97ee85d8cd86967855bf0bed3998bcf9195c758b" "07365f2fe1687187a1c0a8f0298fb2b1792573c3fb8dda51a0c46912975d194a" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "63dd8ce36f352b92dbf4f80e912ac68216c1d7cf6ae98195e287fd7c7f7cb189" "23ccf46b0d05ae80ee0661b91a083427a6c61e7a260227d37e36833d862ccffc" "9346200d23f505b244336e46b4aa3352d00f9bb065b87550e752f04ba14c7c92" "32ffeb13f3c152300d14757b431967e63da005f54712dad6a2f8b8b33fb94bac" "5fbd4efeb58d6a446e3e370226b37dad5c9645bbe5ea11cc83ea2e22e073bf1c" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "6254372d3ffe543979f21c4a4179cd819b808e5dd0f1787e2a2a647f5759c1d1" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "0eea76fe89061a7f6da195f4a976c0b91150de987b942fac2dd10992aea33833" "4486ade2acbf630e78658cd6235a5c6801090c2694469a2a2b4b0e12227a64b9" "7dbb593ad0fb90230b196ffbd6a503c3e9086925cc68f212e625a017b8c824a7" "9492d427a99f6e99c66d31a804e38a6ff995dec7c5940e5dd37f242d39fd41f0" "12ea40aa3720b54d31fd32b9406fb92dad6a5306f8310071b63b01217fb2cafc" "7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "ff52e9e329c5a66eae3570e3f17288d0a9f96403ce1ac7cbca5a193ebc500936" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "ce9e8c85e61d04230761cc2b6e359ded9371fc421ee9cecaf44c79288729b326" "470321d339d4c9c52ce4c57c10291025c53b759cb877f20409ae6d08b6fd269b" default)))
 '(fci-rule-color "#5c5e5e")
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-show-debug-tips nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(line-number-mode nil)
 '(midnight-mode t)
 '(package-selected-packages
   (quote
    (rg inkpot-theme js-format nodejs-repl typescript-mode gotham-theme rust-mode dante kaolin-theme afternoon-theme flatui-dark-theme flatui-theme material-theme doom-themes mustache-mode mustache lsp-rust lsp-mode ox-gfm racket-mode flycheck-haskell zenburn-theme zeal-at-point yaml-mode w3m use-package tuareg tle tao-theme strace-mode smex scala-mode2 rustfmt rjsx-mode rinari restart-emacs react-snippets rainbow-delimiters psci psc-ide powershell persp-mode-projectile-bridge pdf-tools oceanic-theme multi-term mu4e-maildirs-extension mu4e-alert markdown-mode key-chord jsx-mode jist iy-go-to-char ir-black-theme intero idris-mode ido-vertical-mode ido-ubiquitous ido-grid-mode hydra hindent haskell-emacs go-mode go gh fstar-mode fsharp-mode format-sql flymd flymake-rust flycheck-stack flycheck-rust flycheck-purescript flycheck-ocaml flycheck-elm evil-surround evil-paredit evil-org evil-matchit evil-magit evil-leader evil-commentary ess-view ess-R-object-popup ess-R-data-view ensime elm-mode elixir-mode eink-theme ein ediprolog docker discover-my-major dired+ deferred darktooth-theme company-ghci company-ghc circe cargo blackboard-theme badwolf-theme atom-one-dark-theme aria2 anzu ahk-mode ack-menu ack ac-emmet ac-cider)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)
     (intero-targets "grotesque:lib")
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b5bd68")
    (cons 40 "#c8c06c")
    (cons 60 "#dcc370")
    (cons 80 "#f0c674")
    (cons 100 "#eab56d")
    (cons 120 "#e3a366")
    (cons 140 "#de935f")
    (cons 160 "#d79e84")
    (cons 180 "#d0a9a9")
    (cons 200 "#c9b4cf")
    (cons 220 "#ca9aac")
    (cons 240 "#cb8089")
    (cons 260 "#cc6666")
    (cons 280 "#af6363")
    (cons 300 "#936060")
    (cons 320 "#765d5d")
    (cons 340 "#5c5e5e")
    (cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :slant normal :weight normal :height 100 :width normal))))
 '(cursor ((t (:background "#ff0099")))))

;; (custom-set-faces '(default ((t (:family "Iosevka" :height 110)))))
;; (custom-set-faces '(default ((t (:family "Monoid" :height 110)))))

;; '(default ((t (:family "Bitstream Vera Sans Mono" :slant normal :weight normal :height 100 :width normal))))

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

(electric-pair-mode)

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

(define-key evil-normal-state-map (kbd "M-.") nil)

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

(setq auto-mode-alist (cons '("\.xaml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.hamlet$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.julius$" . javascript-mode) auto-mode-alist))

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
(require 'f)
(require 'haskell-session)
(require 'haskell-mode)
(setq haskell-interactive-prompt ">>> ")
; (add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "<f12>") 'intero-goto-definition)
     (define-key haskell-mode-map (kbd "C-c C-g") 'intero-goto-definition)
     (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
     ))
(defun hackage-doc (&optional pkg)
  "Open browser pointing to stackage for the given pkg. Precede with C-u to open in hackage."
  (interactive (list
                (read-string (format "Package (%s): " (thing-at-point 'word))
                             nil nil (thing-at-point 'word))))
  (let ((url (if current-prefix-arg
                 "http://hackage.haskell.org/package/"
                 "https://www.stackage.org/lts/package/")))
       (browse-url (concat url pkg))))
(defun browse-local-hackage-doc (pkg)
  "Find the given package name in your local cabal sandbox"
  (browse-url (f-join (sandbox-doc-root) pkg "html" "index.html")))
(defun sandbox-doc-root ()
  "Find the docs directory for the current sandbox"
  (let*
      ((session       (haskell-session))
       (cabal-dir     (haskell-session-cabal-dir session))
       (doc-root      (f-join cabal-dir ".cabal-sandbox" "share" "doc"))
       (arch-name     (car (f-directories doc-root))))
    (f-join doc-root arch-name)))
(defun list-sandbox-docs ()
  "List package docs for the current sandbox for auto completion"
  (mapcar 'f-filename (f-directories (sandbox-doc-root))))
(defun local-hackage-doc (&optional pkg)
  "Open browser pointing to hackage for the given local pkg from the sandbox."
  (interactive "P")
  (browse-local-hackage-doc
   (funcall 'ido-completing-read "Package name: "
            (list-sandbox-docs))))
(defun intero-targets-quiet (targets)
  "intero-targets that never saves a dir-local of your decision"
  (interactive (list (intero-read-targets)))
  (intero-targets targets nil))
(defalias 'hd 'hackage-doc)
(defalias 'hpr 'haskell-process-restart)
(defalias 'itq 'intero-targets-quiet)
(defalias 'lhd 'local-hackage-doc)

; (with-eval-after-load 'intero
;   (setf (flycheck-checker-get 'intero 'next-checkers) '((warning . haskell-hlint))))

(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

(setq psc-ide-source-globs '(
  "src/**/*.purs"
  "test/**/*.purs"
  ".psc-package/*/*/*/src/**/*.purs"
  "bower_components/purescript-*/src/**/*.purs"))

(setq psc-ide-use-npm-bin t)

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

(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun my-correct-symbol-bounds (pretty-alist)
  "Prepend a TAB character to each symbol in this alist,
this way compose-region called by prettify-symbols-mode
will use the correct width of the symbols
instead of the width measured by char-width."
  (mapcar (lambda (el)
            (setcdr el (string ?\t (cdr el)))
            el)
          pretty-alist))

(defun my-ligature-list (ligatures codepoint-start)
  "Create an alist of strings to replace with
codepoints starting from codepoint-start."
  (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
    (-zip-pair ligatures codepoints)))

                                        ; list can be found at https://github.com/i-tu/Hasklig/blob/master/GlyphOrderAndAliasDB#L1588
(setq my-hasklig-ligatures
      (let* ((ligs '("&&" "***" "*>" "\\\\" "||" "|>" "::"
                     "==" "===" "==>" "=>" "=<<" "!!" ">>"
                     ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
                     "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
                     "<<" "<<<" "<+>" ".." "..." "++" "+++"
                     "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->")))
        (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

;; nice glyphs for haskell with hasklig
(defun my-set-hasklig-ligatures ()
  (interactive)
  "Add hasklig ligatures for use with prettify-symbols-mode."
  (setq prettify-symbols-alist
        (append my-hasklig-ligatures prettify-symbols-alist))
  (prettify-symbols-mode))
