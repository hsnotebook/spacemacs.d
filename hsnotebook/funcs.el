(defun hs/define-key (keymap &rest bindinds)
  (declare (indent 1))
  (while bindinds
  (define-key keymap (pop bindinds) (pop bindinds))))

(defun helm-buffer-switch-to-right-new-window (_candidate)
  "Display buffers in new windows."
  ;; Select the bottom right window
  (require 'winner)
  (select-window (car (last (winner-sorted-window-list))))
  ;; Display buffers in new windows
  (dolist (buf (helm-marked-candidates))
	(select-window (split-window-right))
	(switch-to-buffer buf)
	(find-file buf))
  ;; Adjust size of windows
  (balance-windows))

(defun helm-buffer-switch-right-window ()
  (interactive)
  (with-helm-alive-p
	(helm-quit-and-execute-action 'helm-buffer-switch-to-right-new-window)))

(defun helm-buffer-switch-to-down-new-window (_candidate)
  "Display buffers in new windows."
  ;; Select the bottom right window
  (require 'winner)
  (select-window (car (last (winner-sorted-window-list))))
  ;; Display buffers in new windows
  (dolist (buf (helm-marked-candidates))
	(select-window (split-window-below))
	(switch-to-buffer buf)
	(find-file buf))
  ;; Adjust size of windows
  (balance-windows))

(defun helm-buffer-switch-down-window ()
  (interactive)
  (with-helm-alive-p
	(helm-quit-and-execute-action 'helm-buffer-switch-to-down-new-window)))
