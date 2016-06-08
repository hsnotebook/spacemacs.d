;; defaults
(setq-default
 tab-width 4
 indent-tabs-mode t)

(defun my-web-mode-hook ()
  (setq tab-width 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(defun my-nxml-mode-hook ()
  (setq tab-width 2))
(add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

(add-to-list 'auto-mode-alist '(".xml" . emmet-mode))

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
	  (expand-file-name "snippet" dotspacemacs-directory))
