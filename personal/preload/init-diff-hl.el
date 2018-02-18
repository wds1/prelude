;;;Based on diff-hl, track changes.

(add-hook 'after-init-hook 'diff-hl-mode t)
(global-diff-hl-mode 't)
(diff-hl-margin-mode 't)
(diff-hl-flydiff-mode 't)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(provide 'init-diff-hl)
;;; init-diff-hl.el ends here
