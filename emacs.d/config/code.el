;;; Modes for different programming languages

;;; First deal with basic formatting. Tabs are stupid
(setq-default indent-tabs-mode nil)


;;; In buffer auto completion
(use-package company
  :init
  (setq company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-tooltip-align-annotations t)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  :diminish company-mode
  :ensure t)


;;; Sometimes I need to force 2 spaces... like in vue files which uses mmm-temp-buffers
(defun typescript-tab-setup ()
  (when (string= "typescript-mode" major-mode)
    (setq typescript-indent-level
          (if (string= "mmm-temp-buffer" (buffer-name)) 2 4))))

;;; Programming modes
(use-package typescript-mode
  :init (add-hook 'typescript-mode-hook #'lsp)
  :ensure t)
(use-package js2-mode
  :init (add-hook 'js2-mode-hook #'lsp)
  :ensure t)
(use-package less-css-mode
    :init (add-hook 'less-css-mode-hook #'lsp)
    :ensure t)
(use-package web-mode
  :init (add-hook 'web-mode-hook #'lsp)
  :config
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
  :ensure t) ;; good for html / ejs
(use-package vue-mode
  :init
  (add-hook 'vue-mode-hook #'lsp)
  (add-hook 'after-change-major-mode-hook 'typescript-tab-setup)
  :config
  (setq mmm-submode-decoration-level 0)
  (add-to-list 'vue-modes '(:type template :name nil :mode web-mode))
  (add-to-list 'vue-modes '(:type template :name html :mode web-mode))
  :ensure t)

;;; Prettier to help format things quickly
(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'vue-mode-hook 'prettier-js-mode)
  :ensure t)

