;;; Counsel and ivy for completions
(use-package counsel
  :diminish ivy-mode
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c k" . counsel-ag))
  :config
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    (setq ivy-wrap t)
    (ivy-mode 1))
  :ensure t)


;;; Fast way to find files in a git repository
(use-package find-file-in-repository
  :bind ("C-x f" . find-file-in-repository)
  :ensure t)


;;; More cursors the better. Sometimes you need lots
(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click))
  :ensure t)


;; Window navigation when C-o is just not efficient enough
(global-set-key [C-left] 'windmove-left)          ; move to left window
(global-set-key [C-right] 'windmove-right)        ; move to right window
(global-set-key [C-up] 'windmove-up)              ; move to upper window
(global-set-key [C-down] 'windmove-down)          ; move to downer window


;; Some useful default key-bindings
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-;") 'find-file-at-point)


;; Silver searcher with rgrep as backup
(use-package ag
  :init (setq ag-reuse-buffers 't)
  :bind (("C-." . ag-project-regexp)
         ("C-:" . rgrep))
  :ensure t)
