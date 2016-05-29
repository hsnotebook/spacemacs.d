;;; packages.el --- hsnotebook layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <hsnotebook>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `hsnotebook-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `hsnotebook/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `hsnotebook/pre-init-PACKAGE' and/or
;;   `hsnotebook/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst hsnotebook-packages
  '(
	org
	emacs-eclim
	youdao-dictionary
	company
	pangu-spacing))

(spacemacs/declare-prefix "o" "user-defined")

(defun hsnotebook/post-init-org ()
  ;; defin the refile targets
  (setq org-agenda-files (quote ("~/org-notes/")))
  (setq org-default-notes-file "~/org-notes/gtd.org")

  (setq org-capture-templates
		'(("l" "Life" entry (file+headline "~/org-notes/gtd.org" "Life")
		   "* TODO [#B] %?\n  %i\n"
		   :empty-lines 1)
		  ("w" "Work" entry (file+headline "~/org-notes/gtd.org" "Work")
		   "* TODO [#B] %?\n  %i\n"
		   :empty-lines 1)
		  ("n" "notes" entry (file+headline "~/org-notes/notes.org" "Quick notes")
		   "* TODO [#C] %?\n  %i\n %U"
		   :empty-lines 1)
		  ("j" "Journal Entry"
		   entry (file+datetree "~/org-notes/journal.org")
		   "* %?"
		   :empty-lines 1)))

  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  (if (eq system-type 'windows-nt)
	  (setq org-plantuml-jar-path "d:/program/plantuml/plantuml.jar")
	(setq org-plantuml-jar-path "/home/hs/bin/plantuml.jar")))

(defun hsnotebook/post-init-emacs-eclim ()
  (if (eq system-type 'windows-nt)
	  (setq eclim-eclipse-dirs "d:/program/eclipse"
			eclim-executable "d:/program/eclipse/eclim")
	(setq eclim-eclipse-dirs "/home/hs/bin/eclipse"
		  eclim-executable "/home/hs/bin/eclipse/eclim")))

(defun hsnotebook/post-init-company ()
  (add-hook 'java-mode-hook (lambda ()
							  (setq-local company-idle-delay 0.7))))

(defun hsnotebook/post-init-pangu-spacing ()
  (setq pangu-spacing-real-insert-separtor t))

(defun hsnotebook/post-init-youdao-dictionary ()
  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+))

;;; packages.el ends here
