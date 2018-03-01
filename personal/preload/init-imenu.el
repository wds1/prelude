;; Imenu-list
(global-set-key (kbd "C-S-t") 'imenu-list-smart-toggle)
(global-set-key (kbd "C-t") 'helm-imenu-anywhere)

;;popup-imenu
(setq popup-imenu-position 'point)
(setq popup-imenu-style 'indent)
(global-set-key (kbd "C-t") 'popup-imenu)
(provide 'init-imenu)
