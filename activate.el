;; activate packages
(require 'smart-tab)
(global-smart-tab-mode 1)      

;; Puppet mode
(add-to-list 'load-path (concat external-dir "puppet-mode/"))
(autoload 'puppet-mode "puppet-mode" "Puppet Mode." t)
(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))
(add-to-list 'interpreter-mode-alist '("puppet" . puppet-mode))
(setq puppet-indent-level 4)
(setq puppet-include-indent 4)

;; ruby indent
(setq ruby-indent-level 4)

;; autocomplete
(add-to-list 'load-path (concat external-dir "auto-complete/"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/external/ac-dict")
(ac-config-default)
;; autocomplete requires manual trigger of tab
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

(provide 'activate)
