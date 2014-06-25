; init.el 
;
; Emacs custom initializaiton file
; modified [2013.07.23] by <williamdemeo@gmail.com>
; modified [2011.11.29] by <williamdemeo@gmail.com>
; modified [2009.04.26] by <williamdemeo@gmail.com>
; modified [2004.01.09] by <williamdemeo@yahoo.com>

(message "Loading init.el")

(load "~/.emacs.d/custom_wjd_init.el")

(load "~/.emacs.d/Stanford_init.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("." "/home/williamdemeo/git/Agda/agda-prelude/src" "/usr/share/agda-stdlib")))
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(auto-fill-mode t)
 '(case-replace nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(fill-column 80)
 '(font-lock-maximum-decoration t)
 '(fringe-mode 1 nil (fringe))
 '(gutter-buffers-tab-visible-p nil)
 '(paren-mode (quote paren) nil (paren))
 '(scrollbars-visible-p nil)
 '(tool-bar-mode nil)
 '(toolbar-visible-p nil)
 '(unshifted-motion-keys-deselect-region nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
