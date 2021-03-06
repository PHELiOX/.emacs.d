;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(defvar *spell-check-support-enabled*)
(defvar *macbook-pro-support-enabled*)
(defvar *is-a-mac*)
(defvar *is-carbon-emacs*)
(defvar *is-cocoa-emacs*)

(defvar *win32*)
(defvar *cygwin*)

(defvar *linux*)
(defvar *unix*)
(defvar *linux-x*)

(setq *spell-check-support-enabled* t)
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )

(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )

;;(setq *xemacs* (featurep 'xemacs) )

;;(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
;;(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )


;;set linux var by default
(defvar home-path nil)
;;(setq home-path nil)
(defvar emacs-configuration-dir)
(setq emacs-configuration-dir ".emacs.d/")
(if (not (string< home-path nil))
  (setq home-path "~/"))
;;Default settings dir
(defvar current-emacs-path nil)
(setq current-emacs-path (concat home-path emacs-configuration-dir))
(add-to-list 'load-path current-emacs-path)
;;(add-to-list 'load-path "~/.emacs.d")


;;configuration file list

;;Load Windows Path Settings
(if *win32*
    (progn
      (print "Windows detected")
      (require 'pheliox-settings-windows)))

(require 'pheliox-load-plugins)
(require 'pheliox-settings)
(require 'pheliox-key-bindings)
(require 'pheliox-functions)
(require 'pheliox-eshell)
(require 'pheliox-appearance)

;; autopair 	
;; color-theme 	
;; css-mode 	
;; header2 	
;; highlight-parentheses 	
;; htmlize 	
;; key-chord 	
;; multiple-cursors 	
;; paredit 	
;; slime 	
;; tabbar 	
;; zencoding-mode
;; browse-kill-ring		    
;; color-theme-almost-monokai   
;; expand-region		    
;; helm			    
;; highlight-symbol		    
;; js2-mode			    
;; markdown-mode		    
;; package			    
;; pymacs			    
;; smex			    
;; yasnippet                    


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auto-async-byte-compile-display-function (quote display-buffer))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(curchg-change-cursor-on-overwrite/read-only-flag t)
 '(curchg-default-cursor-type (quote box))
 '(curchg-overwrite/read-only-cursor-type (quote hollow))
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(size-indication-mode t)
 '(tabbar-background-color "gray20")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-mwheel-mode t nil (tabbar))
 '(tabbar-separator (quote (" " (:type pbm :data ("20 20 20") :ascent center :mask (heuristic) :margin 1))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:foreground "violet" :background "gray10"))))
 '(tabbar-button ((t (:background "gray25" :foreground "gray80"))))
 '(tabbar-button-highlight ((t (:box nil :overline "cornflower blue"))))
 '(tabbar-default ((t (:background "gray25" :foreground "gray80" :box (:line-width 5 :color "gray25") :height 1.0))))
 '(tabbar-highlight ((t (:foreground "light blue" :box (:line-width 1 :color "grey10") :overline "cornflower blue" :height 0.7))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "gray10" :foreground "skyblue1" :box (:line-width 4 :color "gray10") :weight bold :height 0.9))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "gray8" :box (:line-width 1 :color "grey9") :height 0.3))))
 '(tabbar-unselected ((t (:inherit tabbar-default :background "gray25" :foreground "gray60" :box (:line-width 2 :color "gray20") :overline "gray10" :height 0.9)))))
