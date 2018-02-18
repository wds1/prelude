;;;Helm usr config
(require 'helm)
(helm-mode 't)
(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
;      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      )

;; Helm split window config
(setq
 helm-always-two-windows 'nil
 helm-split-window-default-side 'right)

;; Helm swoop config
(add-hook 'after-init-hook (lambda ()
			     (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)))

(setq helm-swoop-split-direction 'split-window-horizontally)


;;(load "~/.emacs.d/usr/func/helm-fasd.el")
(require 'init-helm-fasd)

;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(provide 'init-helm)
;;; init-helm.el ends here
