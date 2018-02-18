;;; init-misc.el -- misc
;;; Code:
;; Requires:
;; 共用剪切板
(setq x-select-enable-clipboard t)

;;;; 显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;;;; 关闭启动画面
(setq inhibit-startup-message t)

;;;;设置大的kill ring
(setq kill-ring-max 150)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 没有任中任何区域时，注释、反注释作用于当前行，否则作用于
;; 选中区域
(defadvice comment-or-uncomment-region (before slickcomment activate compile)
  "When called interactively with no active region, toggle comment on current line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "M-;") 'comment-dwim-line)

;;删除行的定义
(defadvice kill-ring-save (before slickcopy activate compile)
					;When called interactively with no active region, copy a single line instead.”
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
					;When called interactively with no active region, kill a single line instead.”
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; 设置寄存点
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

;; change focused frame via shift + arrow
(windmove-default-keybindings)
(setq windmove-wrap-around t)

(global-set-key (kbd "C-c d") 'ydcv-dict)
(defun ydcv-dict ()
  (interactive)
  (message "searching for %s ..." (word-at-point))
  (tooltip-show
   (shell-command-to-string
    (concat "ydcv " (word-at-point))))
)

;; avoid-beep-in-emacs
(setq beep nil)
(setq ring-bell-function 'ignore)

;; ignore case as much as I can
(setq read-file-name-completion-ignore-case t)
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; get-output
(defun get-output (shell-comm)
  (interactive "sCommand: ")
  (insert (format "$: %s  ==>  %s" shell-comm (shell-command-to-string shell-comm))))

(provide 'init-misc)
;;; init-misc.el ends here
