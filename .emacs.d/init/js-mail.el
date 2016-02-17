
(add-to-list 'load-path "/usr/share/emacs24/site-lisp/mu4e/")
(require 'mu4e)
(setq mail-user-agent 'mu4e-user-agent)
(global-set-key (kbd "<f10>") 'mu4e)
(global-set-key (kbd "C-x C-u") 'mu4e-update-mail-and-index)

;; Maildir setup
(setq
 mu4e-maildir "~/.mail"
 mu4e-refile-folder "/g/[Gmail].All Mail"
 mu4e-drafts-folder "/g/[Gmail].Drafts"
 mu4e-sent-folder "/g/[Gmail].Sent Mail"
 mu4e-trash-folder "/g/[Gmail].Trash"
 mu4e-get-mail-command "offlineimap"
 mu4e-update-interval 300
 mu4e-sent-messages-behavior 'delete
 mu4e-headers-include-related t
 mu4e-headers-skip-duplicates t
 mu4e-confirm-quit nil
 mu4e-compose-signature-auto-include nil
 mu4e-maildir-shortcuts
    '( ("/g/INBOX"               . ?i)
       ("/g/[Gmail].Sent Mail"   . ?s)
       ("/g/[Gmail].Trash"       . ?t)
       ("/g/[Gmail].All Mail"    . ?a)))

(package-require 'mu4e-alert)
(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)

;; User info
(setq
 user-mail-address "jonschoning@gmail.com"
 user-full-name "Jon Schoning"
 mu4e-compose-signature "Jon Schoning <jonschoning@gmail.com>\n"
 mu4e-user-mail-address-list
 '(
   "jon.schoning@gmail.com")
 mu4e-attachment-dir "~/Downloads")

(package-require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
   smtpmail-auth-credentials
     '(("smtp.gmail.com" 587 "jonschoning@gmail.com" nil))
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587)

;; Maildirs extension
(package-require 'mu4e-maildirs-extension)
(require 'mu4e-maildirs-extension)
(mu4e-maildirs-extension)
(setq mu4e-maildirs-extension-insert-before-str "\n  Basics")

;; Headers view
(setq
 mu4e-headers-fields
 '((:human-date . 10)
   (:flags . 5)
   ;; (:signature . 6)
   ;; (:mailing-list . 15)
   (:from-or-to . 22)
   (:subject))
 mu4e-headers-time-format "Tdy %H:%M"
 mu4e-headers-date-format "%e %b %y"
 mu4e-use-fancy-chars nil)

;; Message view
(defun mu4e-shr2text ()
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))
(defun oni:shr-colorize-remove-last-arg (args)
  "If ARGS has more than 3 items, remove the last one."
  (if (> (length args) 3)
      (butlast args)
    args))
(with-eval-after-load 'shr
  (advice-add #'shr-colorize-region :filter-args
              #'oni:shr-colorize-remove-last-arg))
(setq
 ;; mu4e-html2text-command "w3m -dump -T text/html -cols 65536"
 mu4e-html2text-command 'mu4e-shr2text
 mu4e-view-prefer-html 'f
 mu4e-view-show-images t)

(add-hook 'mu4e-view-mode-hook (lambda () (visual-line-mode)))
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(add-to-list
 'mu4e-view-actions
 '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; Compose view
(define-key mu4e-compose-mode-map (kbd "C-c s") 'mml-secure-message-sign-pgpmime)
(define-key mu4e-compose-mode-map (kbd "C-c e") 'mml-secure-message-encrypt-pgpmime)

(add-hook
 'mu4e-compose-pre-hook
 (lambda ()
   "Set the From address based on the To address of the original."
   (let ((msg mu4e-compose-parent-message))
     (when msg
       (setq user-mail-address
             (cond
              (t "jonschoning@gmail.com"))
             mu4e-compose-signature (concat "Jon Schoning <" user-mail-address ">\n"))))))


(add-hook
 'mu4e-compose-mode-hook
 (lambda ()
   (visual-line-mode)
   (auto-fill-mode 0)
   (flyspell-mode)))




(provide 'js-mail)
