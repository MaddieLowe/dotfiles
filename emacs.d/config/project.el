(use-package projectile
  :init
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :ensure t)

(use-package counsel-projectile
  :init
  (counsel-projectile-mode +1)
  :ensure t)
