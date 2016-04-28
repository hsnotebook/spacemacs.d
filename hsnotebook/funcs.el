(defun hs/define-key (keymap &rest bindinds)
  (declare (indent 1))
  (while bindinds
  (define-key keymap (pop bindinds) (pop bindinds))))
