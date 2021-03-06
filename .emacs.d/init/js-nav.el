;;; js-nav.el -- Navigation things.

(package-require 'dash)
(require 'dash)

;; Make PgUp/Dn move the point.
(setq scroll-error-top-bottom t)

;; Smart home key
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key (kbd "<home>") 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; Subword mode (consider CamelCase chunks as words)
(global-subword-mode 0)

;; anzu: display incremental search stats in modeline
(package-require 'anzu)
(global-anzu-mode 1)

;;; Project Explorer

;; Transpose (rotate if multiple) windows
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(global-set-key (kbd "C-x C-o") 'rotate-windows)

;; Help for major modes
(package-require 'discover-my-major)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(defun open-dotemacs-file ()
  "Rotate your windows"
  (interactive)
  (find-file (concat dotfiles-dir ".emacs"))
  )

;; (global-set-key (kbd "C-x C-e") 'open-dotemacs-file)

;; Kill buffer in other window
(global-set-key (kbd "C-x p")
                (lambda () (interactive)
                  (save-excursion
                    (other-window 1)
                    (quit-window))))

(provide 'js-nav)
