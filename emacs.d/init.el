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

(load-file (expand-file-name "lib/font-lock+.el" user-emacs-directory))

(load-file (expand-file-name "config/backup.el" user-emacs-directory))
(load-file (expand-file-name "config/bling.el" user-emacs-directory))
(load-file (expand-file-name "config/navigation.el" user-emacs-directory))
(load-file (expand-file-name "config/magit.el" user-emacs-directory))
(load-file (expand-file-name "config/project.el" user-emacs-directory))
(load-file (expand-file-name "config/code.el" user-emacs-directory))
(load-file (expand-file-name "config/lsp-mode.el" user-emacs-directory))
(load-file (expand-file-name "config/peg-mode.el" user-emacs-directory))

;;; end init.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(base16-theme writeroom-mode company-box flx counsel-projectile rg molokai-theme kooten-theme noctilux-theme boron-theme apropospriate-theme abyss-theme nyx-theme cyberpunk-theme cyberpunk-2019-theme dockerfile-mode php-mode projectile markup-faces adoc-mode peg yaml-mode groovy-mode browse-at-remote magit ag multiple-cursors find-file-in-repository counsel powerline dracula-theme use-package-ensure-system-package diminish)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic)))))
