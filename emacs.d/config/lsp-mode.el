;;; lsp-mode for all my editing needs. Just add language servers
(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-enable-indentation t)
  :ensure t)

(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t)
(use-package company-lsp
  :commands company-lsp
  :ensure t)
