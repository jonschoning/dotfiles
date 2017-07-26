(setq org-export-with-planning t
      )

(setq org-html-validation-link nil
      org-export-with-author nil
      org-export-with-toc nil
      org-export-time-stamp-file nil)

; Add a time stamp to the task when completed
(setq org-log-done 'time)

(eval-after-load "org"
  '(progn
     (require 'ox-md nil t)
     ;(package-require 'ox-gfm)
     ;(require 'ox-gfm nil t)
     )
  )

(provide 'js-org)
