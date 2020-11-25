;;; refman-mode.el --- A Reference Manager for Emacs -*- lexical-binding: t; -*-
;;;
;; Copyright (C) 2020
;;
;; Author:  <http://github.com/UndeadKernel>
;; Maintainer:  Carlos G. C.
;; Created: October 28, 2020
;; Modified: October 28, 2020
;; Version: 0.0.1
;; Keywords: reference manager, bibliography, bibtex, doi
;; Homepage: https://github.com/UndeadKernel/refman-mode
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5") (org "9.4") (org-noter "1.4.1") (org-pdftools "1.0") (pdf-tools "0.8"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(require 'org)

(defvar refman-notes-file "bibliography.org"
  "File name of the main bibliography file.")

(defvar refman-notes-dir org-directory
  "Directory where `refman-notes-file' is located.")

(defvar refman--wconf nil
  "Hold the window configuration before `refman/init' is invoked
(when workspaces are not used).")

(defvar refman--buffer nil
  "The buffer where the bibliography is shown.")

(defun refman-mode ()
  "TODO: doc."
  (interactive)
  ;; window management
  (setq refman--wconf (current-window-configuration))
  (delete-other-windows)
  (refman/init))

(defun refman/init ()
  "TODO: doc."
  (interactive)
  (let* ((file-path (concat refman-notes-dir refman-notes-file))
         (file-exists (file-exists-p file-path)))
    (find-file file-path)
    (unless file-exists
      ;; set the title of the org buffer
      (insert "Bibliography\n")
      (insert "#+STARTUP: hideblocks overview\n\n")
      (save-buffer))
    (setq refman--buffer (current-buffer))))

(defun refman/quit ()
  "TODO: doc."
  (interactive)
  (set-window-configuration refman--wconf)
  (setq refman--buffer nil))

(provide 'refman-mode)
;;; refman-mode.el ends here
