;; defaults
(setq-default
 tab-width 4
 indent-tabs-mode t)

;; search regex
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; evil key bindings
(hs/define-key evil-normal-state-map
  "\\" 'evil-repeat-find-char-reverse)

;; Don't highlight the current line
(spacemacs/toggle-highlight-current-line-globally-off)

;; Set default private snippets
(setq auto-completion-private-snippets-directory
	  (expand-file-name "snippets" dotspacemacs-directory))

(add-hook 'before-save-hook 'whitespace-cleanup)
