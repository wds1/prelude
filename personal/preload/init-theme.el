(toggle-frame-fullscreen)
;;(load-theme 'zenburn)
(disable-theme 'zenburn)
(prelude-require-package 'color-theme-solarized)
(setq prelude-theme 'solarized-light)
;;(load-theme 'color-theme-solarized)
;;Mouse control
(set-default 'cursor-type 'box)
;;(set-cursor-color "#ffff00")
;;Font set
(set-face-attribute 'default nil :font "Hermit" :height 200)
(set-frame-font "Hermit" nil t)

(provide 'init-theme)
;;; init-theme.el ends here
