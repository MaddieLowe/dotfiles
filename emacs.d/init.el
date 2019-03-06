;;; init.el --- Basic init file to setup repositorys and install use-package if needed
;;; Commentary:
; The remaining configuration is done in settings.org

;;; Code:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(use-package use-package-ensure-system-package :ensure t)
(use-package diminish :ensure t)

;;; Use my shell path for $PATH. This fixes many issues with binaries installed with nodenv and npm
(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
     :config
     (exec-path-from-shell-initialize)
     :ensure t))


(load-file (expand-file-name "config/bling.el" user-emacs-directory))
(load-file (expand-file-name "config/navigation.el" user-emacs-directory))
(load-file (expand-file-name "config/magit.el" user-emacs-directory))
(load-file (expand-file-name "config/code.el" user-emacs-directory))
(load-file (expand-file-name "config/lsp-mode.el" user-emacs-directory))

;;; end init.el

