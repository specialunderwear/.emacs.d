(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t)
  '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

(setq mac-command-key-is-meta nil)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/nxml-mode-20041004")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ruby-mode")
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-rails")

;;use nxml-mode, not html crap mode
(defalias 'html-mode 'nxml-mode)
(defalias 'perl-mode 'cperl-mode)

;;use tabs for indentation, not spaces
(setq-default c-basic-offset 8)
;; hitting delete will delete the highlighted region
(pending-delete-mode 1)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
       ))

;; title bar shows name of current buffer ;;
(setq frame-title-format '("emacs: %*%+ %b"))

;; don't show the startup message every time, I know I'm using emacs
(setq inhibit-startup-message t)

;;;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some custom key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; M-g does goto-line ;;;;
(global-unset-key "\M-g")
(global-set-key "\M-g" 'goto-line)

;;;;;;;;;;;;;;; color settings ;;;;;;;;;;;;;;;;;;;;;;
(set-foreground-color "grey100" )
;;(set-background-color "#000044" )
(set-background-color "black")

(set-cursor-color "yellow")
(set-border-color "DarkSlateGray" )

(setq default-frame-alist
      (append default-frame-alist
                    '((foreground-color . "grey100")
                      (background-color . "black")
                      (cursor-color . "yellow")
                              ;(mouse-color . "DarkSlateGray")
                      )))
(set-face-foreground 'font-lock-comment-face       "SlateGrey");"OrangeRed");"gray")
(set-face-foreground 'font-lock-string-face        "OrangeRed")
;(set-face-foreground 'font-lock-doc-string-face    "gray")
(set-face-foreground 'font-lock-function-name-face "green")
(set-face-foreground 'font-lock-variable-name-face "cyan")
(set-face-foreground 'font-lock-type-face          "SandyBrown")
(set-face-foreground 'font-lock-keyword-face       "Wheat")
(set-face-foreground 'font-lock-builtin-face       "Wheat")
(set-face-foreground 'font-lock-constant-face      "yellow") ; "Wheat")

(set-face-foreground 'modeline "black")
(set-face-background 'modeline "grey100")
(set-face-background 'region "blue")
(set-face-foreground 'bold "red")
(set-face-foreground 'italic "yellow")
(set-face-background 'highlight "blue")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Code completion and prog mode settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;code completion for modes that implement c-indent-command
;;code completion
(defadvice c-indent-command
  (around php-indent-or-complete)
  "Changes \\[php-indent-command] to autocomplete when at end of a word."
  (if (looking-at "\\>")
      (dabbrev-expand nil)
    ad-do-it)
  )

;;mode specific settings
;;php-mode
;;(load-library "php-mode")
(autoload 'php-mode "php-mode"
     "Mode for editing php source files")
 (add-to-list 'interpreter-mode-alist '("php" . php-mode))

;;activate auto completion
(eval-after-load "php-mode"
  '(progn (require 'dabbrev) (ad-activate 'c-indent-command)))

;;indentation
(add-hook 'php-mode-hook
          (function (lambda ()
                      (setq c-basic-offset 8)
                      (c-set-offset 'defun-block-intro 8)
                      (c-set-offset 'topmost-intro-cont 0)
                      (c-set-offset 'topmost-intro 0)
                      )
                    )
          )

;;c-mode
;;activate auto completion
(eval-after-load "c-mode"
  '(progn (require 'dabbrev) (ad-activate 'c-indent-command)))

;;c++ mode
;;activate auto completion
(eval-after-load "c++-mode"
  '(progn (require 'dabbrev) (ad-activate 'c-indent-command)))

;;activate auto completion
(defadvice cperl-indent-command
  (around php-indent-or-complete)
  "Changes \\[nxml-indent-command] to autocomplete when at end of a word."
  (if (looking-at "\\>")
      (dabbrev-expand nil)
    ad-do-it)
  )

(eval-after-load "cperl-mode"
  '(progn (require 'dabbrev) (ad-activate 'cperl-indent-command)))

;;html mode
(load-library "nxml-mode")
(load "rng-auto.el")
(defadvice nxml-indent-command
  (around nxml-indent-or-complete)
  "Changes \\[nxml-indent-command] to autocomplete when at end of a word."
  (if (looking-at "\\>")
      (dabbrev-expand nil)
    ad-do-it)
  )

(eval-after-load "nxml-mode"
  '(progn (require 'dabbrev) (ad-activate 'nxml-indent-command)))

;;ruby mode
;;(load-library "ruby-mode")
(autoload 'ruby-mode "ruby-mode"
     "Mode for editing ruby source files")
 (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;;(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(require 'snippet)
(require 'find-recursive)
;;(require 'rails)

;;do php with php file ait?
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js$" . c-mode) auto-mode-alist))
;;add .html files to mode list
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.htm\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xhtm\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xhtml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . nxml-mode))
;;ruby
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
;;perl
(add-to-list 'auto-mode-alist '("\\.cgi\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pl\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm\\'" . cperl-mode))
