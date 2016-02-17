;; Enable
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

;; If thing-at-point looks like something openable, default to it
(setq ido-use-filename-at-point (quote guess))
(setq ido-use-url-at-point t)

;; Show previously opened buffers in ido-switch-buffer
(setq ido-use-virtual-buffers t)

;; Make sure ido is really everywhere
(package-require 'ido-ubiquitous)
(ido-ubiquitous-mode)

;; Use smex to provide ido-like interface for M-x
(package-require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Vertical ido
(package-require 'ido-grid-mode)
(ido-grid-mode)

(provide 'js-ido)
