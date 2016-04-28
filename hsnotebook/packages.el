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
	emacs-eclim))

(defun hsnotebook/post-init-org ()
  (with-eval-after-load 'org
	(progn
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
	  )))

(defun hsnotebook/post-init-emacs-eclim ()
  (with-eval-after-load 'eclim
	(progn
	  (if (eq system-type 'windows-nt)
		  (setq eclim-eclipse-dirs "d:/program/eclipse"
				eclim-executable "d:/program/eclipse/eclim")))))

;;; packages.el ends here