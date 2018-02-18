;;; package --- Summary
;;; Commentary:
;;key bindings
;;; helm

(require 'helm-config)
;;; Code:
(global-set-key (kbd "C-c e") 'helm-fasd)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-<f12>") 'helm-ls-git-ls)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Set key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-]") 'helm-gtags-dwim)
     (define-key helm-gtags-mode-map (kbd "M-\\") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c t") 'helm-gtags-show-stack)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

;; (add-hook 'helm-gtags-mode-hook
;;           '(lambda ()
;;              (local-set-key (kbd "M-g") 'helm-gtags-dwim)
;;              (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
;;              (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
;;              (local-set-key (kbd "M-n") 'helm-gtags-next-history)
;;              (local-set-key (kbd "M-]") 'helm-gtags-find-tag)
;;              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
;;              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
;;              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
;;             ))

;; helm search
(global-set-key (kbd "C-s") 'helm-swoop)

;;; Buffer
;; Switch buffer
(global-set-key (kbd "M-s M-s") 'mode-line-other-buffer)
(global-set-key (kbd "<M-left>") 'previous-buffer)
(global-set-key (kbd "<M-right>") 'next-buffer)

;; git
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)

(provide 'init-keybind)
;;; keybind.el ends here
