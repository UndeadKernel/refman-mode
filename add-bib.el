;;; add-bib.el--- Add a bibtex entry -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021
;;
;; Author:  <http://github/boy>
;; Maintainer:  <boy@SlimZombie>
;; Created: January 20, 2021
;; Modified: January 20, 2021
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/boy/add-bib
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(defvar refman--add-bib-buffer-name "*new bibs*")
(defvar refman--add-bib-buffer nil)

(defun refman/add-bib ()
  "TODO"
  (interactive)
  (select-window
   (display-buffer
    (if (buffer-live-p refman--add-bib-buffer)
        refman--add-bib-buffer
      (setq refman--add-bib-buffer
            (get-buffer-create refman--add-bib-buffer-name))
      (with-current-buffer refman--add-bib-buffer
        (refman--add-bib-minor-mode)
        (current-buffer))))))

(defvar refman--add-bib-minor-mode-map
  (let ((kmap (make-sparse-keymap)))
    (set-keymap-parent kmap text-mode-map)
    (define-key kmap (kbd "C-c C-c") #'refman--add-bib-commit)
    (define-key kmap (kbd "C-c C-q") #'refman--add-bib-abort)
    kmap))

(define-minor-mode refman--add-bib-minor-mode
  "Active when in a buffer where bib entries can be added."
  nil nil nil
  )

(defun refman--add-bib-commit ()
  (interactive)
  (message "commit"))

(defun refman--add-bib-abort ()
  (interactive)
  (kill-buffer-and-window))

(provide 'add-bib)
;;; add-bib.el ends here
