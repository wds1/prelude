;;; .emacs -- init
;;; Commentary:
;;; Code:
;(add-to-list 'load-path "~/.emacs.d/coding/")

; list the packages you want
(setq package-list '(
		     ;;theme
		     solarized-theme
		     zenburn-theme
		     ;;version control
		     git
		     magit
		     git-timemachine
		     ;;coding
		     imenu-list
		     ;;helm
		     helm
		     helm-git
		     helm-ls-git
		     helm-swoop
		     helm-gtags
		     ;;edit
		     unfill
		     expand-region
		     dynamic-spaces
		     undo-tree
		     mode-line-bell
		     multiple-cursors
		     vlf
		     company
		     diff-hl
		     paxedit
		     ))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;;General usr config
;;;Init usr config
(add-hook 'after-init-hook 'server-start)
(setq server-raise-frame t)

(if window-system
  (add-hook 'server-done-hook
	    (lambda () (shell-command "stumpish 'eval (stumpwm::return-es-called-win stumpwm::*es-win*)'"))))
;; (add-hook 'after-init-hook (lambda() (unless (server-running-p) (server-start))))
;; (require 'server)
;; (unless (server-running-p)
;; (server-start))

;; Debug setup
(setq debug-on-error nil)			;we must debug it when errors happen

;; Move window
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
;;; init.el ends here
