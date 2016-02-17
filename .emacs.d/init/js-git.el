(package-require 'magit)
(package-require 'magit-popup)
(package-require 'evil-magit)

(global-set-key (kbd "C-x g") 'magit-status)

;; Github integration
(package-require 'jist)
(setq jist-enable-default-authorized 't)

(provide 'js-git)
