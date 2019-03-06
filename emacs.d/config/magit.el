;;; Install and configure magit
;;; Requires navigation.el with ivy

(use-package magit
             :bind ("C-x g" . magit-status)
             :config (setq magit-completing-read-function 'ivy-completing-read)
             :ensure t)
(use-package browse-at-remote
             :bind ("C-c g g" . browse-at-remote)
             :ensure t)
