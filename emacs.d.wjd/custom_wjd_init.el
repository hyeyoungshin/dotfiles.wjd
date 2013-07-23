; custom.el
;
; Emacs customization file
; modified [2013.07.23] by <williamdemeo@gmail.com>
; modified [2011.01.01] by <williamdemeo@gmail.com>

(message "* --[ custom.el: begin loading... ]--")

(setq load-path (cons "~/.elisp" load-path))
(scroll-bar-mode -1)

;;;; ----uncomment this section to use emacs for gmail----
;; (setq starttls-use-gnutls t)
;; (setq send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials
;;       '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials
;;       (expand-file-name "~/.authinfo")
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-debug-info t)
;; (require 'smtpmail)
;;;; ----end gmail section

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)


;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; The rest was mainly taken from my old init.el file
;; For other features left out of this version, see
;; the file old_custom_init.el


;for auctex
;(require 'tex-site)

;;
;; Global key bindings
;;
(define-key global-map "\C-cc" 'compile)
(define-key global-map "\C-cs" 'shell)
(define-key global-map "\C-cg" 'gdb)

;; 
;;  Matlab/Octave Mode
;;
 (autoload 'matlab-mode "matlab" "matlab mode." t)
 ;(autoload 'octave-mode "octave-mod" nil t)
 (setq auto-mode-alist
       (cons '("\\.m$" . matlab-mode) auto-mode-alist))
 ;      (cons '("\\.m$" . octave-mode) auto-mode-alist))
 ;(add-hook 'octave-mode-hook
 (add-hook 'matlab-mode-hook
 	  (lambda () 
 ;	    (abbrev-mode 1)
 	    (auto-fill-mode 1)
 	    (font-lock-mode 1)))
 ;; see: file:///usr/share/doc/octave2.1-htmldoc/octave_39.html#SEC230

(autoload 'noweb-mode "noweb-mode" "noweb mode." t)
(setq auto-mode-alist
      (cons '("\\.nw$" . noweb-mode) auto-mode-alist))

(add-hook 'noweb-mode-hook
	  '(lambda ()
	     (setq-default noweb-set-code-mode "matlab-mode")
	     (setq-default noweb-set-doc-mode "LaTeX-mode")))

;; 
;;  LaTeX Mode
;;
(setq auto-mode-alist
      (cons '("\\.tex$" . LaTeX-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.def$" . LaTeX-mode) auto-mode-alist))
(add-hook 'LaTeX-mode-hook 
          (lambda () 
	    (auto-fill-mode 1)
;	    (abbrev-mode 1)
	    (font-lock-mode 1)))
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;(setq reftex-external-file-finders
;       '(("tex" . "kpsewhich -format=.tex %f")
;        ("bib" . "kpsewhich -format=.bib %f")))

(setq reftex-default-bibliography '("~/texmf/bibtex/bib/wjd.bib"))

;;
;;  BibTex Mode
;;
(setq auto-mode-alist
      (cons '("\\.bib$" . bibtex-mode) auto-mode-alist))
(add-hook 'bibtex-mode-hook 'turn-on-font-lock)

;;
;; NOTES
;;
;[Changing colours]
;  First, find the font name to change using the command:
;    M-x list-text-properties-at
;  Then, suppose you got `font-latex-math-face', edit ~/.Xdefaults and add:
;    Emacs.font-latex-math-face.attributeForeground: blue
;

;;
;; C/C++ Modes
;;
; reference: Learning Emacs, p.327
;(add-hook 'c++-mode-hook
;	  '(lambda ()
;	     (c-set-style "stroustrup")))


;;
;; From file:///usr/share/doc/xemacs21/README.Debian
;;

;make all fonts available from Options->Fonts menu
(setq-default font-menu-ignore-scaled-fonts nil)

; Word abbreviation mode (see LGE p. 74)
;	(setq-default abbrev-mode t)
;	(read-abbrev-file "~/.abbrev_defs")
;	(setq save-abbrevs t)

;; ; template for new matlab files
;; (add-hook 'find-file-hooks 'auto-insert)
;; (load-library "autoinsert")
;; (setq auto-insert-directory "~/.xemacs/")
;; (setq auto-insert-alist
;;       (append '((matlab-mode .  "header.m"))
;; 	      auto-insert-alist))


;; gap mode
;(autoload 'gap-mode "gap-mode" "Gap editing mode" t)
;(setq auto-mode-alist (append (list '("\\.g$" . gap-mode)
;                                    '("\\.gap$" . gap-mode))
;                              auto-mode-alist))
;;(autoload 'gap "gap-process" "Run GAP in emacs buffer" t)
;(add-hook 'gap-mode-hook 'turn-on-font-lock)

;;(setq gap-executable "/usr/algebra/bin/gap")
;;(setq gap-start-options (list "-l" "/usr/algebra/gap3.1/lib" "-m" "2m"))

;(add-to-list 'load-path "~/pub/share/wiki")
;(add-to-list 'load-path "~/pub/share/planner")
;(require 'planner)
;(plan)

;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:size "14pt" :family "Andale Mono"))))
;; '(show-paren-match ((((class color) (background light)) (:background "lightgrey")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(auto-fill-mode t)
 '(case-replace nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(fill-column 80)
 '(font-lock-maximum-decoration t)
 '(gutter-buffers-tab-visible-p nil)
 '(paren-mode (quote paren) nil (paren))
 '(reftex-bibpath-environment-variables (quote ("BIBINPUTS=~/texmf/bibtex/bib/" "TEXBIB=~/texmf/bibtex/bib/")))
 '(safe-local-variable-values (quote ((TeX-master . "dissertation-wjd.tex"))))
 '(scrollbars-visible-p nil)
 '(tool-bar-mode nil)
 '(toolbar-visible-p nil)
 '(unshifted-motion-keys-deselect-region nil))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


; Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'monokai t)

; Set font
;(set-default-font "Inconsolata-12")

; Hide toolbar and scrollbar
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(message "* --[ custom.el: ...loading finished ]--")