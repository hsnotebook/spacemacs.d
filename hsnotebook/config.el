;; defaults
(setq-default
 tab-width 4
 indent-tabs-mode t)
(add-hook 'html-mode-hook (lambda ()
							(setq tab-width 2)))

;; search regex
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; evil key bindings
(hs/define-key evil-normal-state-map
  "\\" 'evil-repeat-find-char-reverse)
