;;; Modes for different programming languages

;;; Deal with basic formatting. No tabs.
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

;;; Programming modes
(use-package typescript :init (add-hook 'typescript-mode-hook #'lsp) :ensure t)
(use-package js2-mode :init (add-hook 'js2-mode-hook #'lsp) :ensure t)
(use-package less-css-mode :init (add-hook 'less-css-mode-hook #'lsp) :ensure t)
(use-package web-mode :init (add-hook 'web-mode-hook #'lsp)
  :config
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
  :ensure t) ;; good for html / ejs
(use-package vue-mode
  :init
  (add-hook 'vue-mode-hook #'lsp)
  :config
  (setq mmm-submode-decoration-level 0)
  (setq mmm-js-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
  (setq mmm-typescript-mode-enter-hook (lambda ()
                                         (setq syntax-ppss-table nil)
                                         (make-local-variable 'typescript-indent-level)
                                         (setq typescript-indent-level 2)))

  (add-to-list 'vue-modes '(:type template :name nil :mode web-mode))
  (add-to-list 'vue-modes '(:type template :name html :mode web-mode))
  :ensure t)

;;; Prettier to help format things quickly
(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'vue-mode-hook 'prettier-js-mode)
  :ensure t)


(use-package company-box
  :hook (company-mode . company-box-mode)
  :diminish company-box-mode
  :ensure t)

(add-to-list 'load-path "~/.local/share/icons-in-terminal/")
(setq company-box-icons-unknown 'fa_question_circle)

(setq company-box-icons-elisp
   '((fa_tag :face font-lock-function-name-face) ;; Function
     (fa_cog :face font-lock-variable-name-face) ;; Variable
     (fa_cube :face font-lock-constant-face) ;; Feature
     (md_color_lens :face font-lock-doc-face))) ;; Face

(setq company-box-icons-yasnippet 'fa_bookmark)

(setq company-box-icons-lsp
      '((1 . fa_text_height) ;; Text
        (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
        (3 . (fa_tag :face font-lock-function-name-face)) ;; Function
        (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
        (5 . (fa_cog :foreground "#FF9800")) ;; Field
        (6 . (fa_cog :foreground "#FF9800")) ;; Variable
        (7 . (fa_cube :foreground "#7C4DFF")) ;; Class
        (8 . (fa_cube :foreground "#7C4DFF")) ;; Interface
        (9 . (fa_cube :foreground "#7C4DFF")) ;; Module
        (10 . (fa_cog :foreground "#FF9800")) ;; Property
        (11 . md_settings_system_daydream) ;; Unit
        (12 . (fa_cog :foreground "#FF9800")) ;; Value
        (13 . (md_storage :face font-lock-type-face)) ;; Enum
        (14 . (md_closed_caption :foreground "#009688")) ;; Keyword
        (15 . md_closed_caption) ;; Snippet
        (16 . (md_color_lens :face font-lock-doc-face)) ;; Color
        (17 . fa_file_text_o) ;; File
        (18 . md_refresh) ;; Reference
        (19 . fa_folder_open) ;; Folder
        (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
        (21 . (fa_square :face font-lock-constant-face)) ;; Constant
        (22 . (fa_cube :face font-lock-type-face)) ;; Struct
        (23 . fa_calendar) ;; Event
        (24 . fa_square_o) ;; Operator
        (25 . fa_arrows)) ;; TypeParameter
      )
