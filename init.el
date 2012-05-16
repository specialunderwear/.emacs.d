;; set up load path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq custom-file (concat dotfiles-dir "custom.el"))
(add-to-list 'load-path dotfiles-dir)

(setq mac-command-key-is-meta nil)

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


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; load file that activates all packages
(require 'activate)

(provide 'init)
