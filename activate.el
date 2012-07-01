;; activate packages
(require 'smart-tab)
(global-smart-tab-mode 1)      

;; Puppet mode
(autoload 'puppet-mode "puppet-mode" "Puppet Mode." t)
(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))
(add-to-list 'interpreter-mode-alist '("puppet" . puppet-mode))
(setq puppet-indent-level 4)
(setq puppet-include-indent 4)

;; ruby indent
(setq ruby-indent-level 4)

(provide 'activate)
