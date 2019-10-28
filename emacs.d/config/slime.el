;; Enable slime development

(use-package slime
  :init
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  :config
  (slime-setup '(slime-fancy slime-quicklisp slime-asdf))
  (setq inferior-lisp-program "/usr/bin/sbcl")
  :ensure t)

