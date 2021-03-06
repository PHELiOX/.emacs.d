;; basic settings

;; user settings
(setq user-full-name "PHELiOX")
(setq user-mail-address "pheliox@live.com")

;;Screen Settings
;; (setq truncate-lines t)
;; (scroll-lock-mode t)
(setq redisplay-dont-pause t
      scroll-margin 0
      scroll-step 1
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse t) ;; scroll window under mouse
(setq auto-window-vscroll nil)

;; modern page up/down
(global-set-key [next]
                (lambda () (interactive)
                  (condition-case nil (scroll-up)
                    (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
                (lambda () (interactive)
                  (condition-case nil (scroll-down)
                    (beginning-of-buffer (goto-char (point-min))))))

;;follow mode to sync between windows
(follow-mode t)
;;cursor color
(set-cursor-color "dodger blue")

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode t)
(set-face-background 'hl-line "#333234")
(set-face-background 'region "royalblue")
(global-linum-mode t)

(transient-mark-mode t)
;; (global-visual-line-mode t)
;;
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.
;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
;;
(setq-default indent-tabs-mode nil) 

;;smart spell correction
(setq-default ispell-program-name "hunspell")
;; (setq text-mode-hook '(lambda()  
;;                         (flyspell-mode t) 
;;                         )) 
(setq ispell-list-command "--list")
(setq flyspell-issue-message-flag nil)
;; (setq flyspell-mode)
(add-hook 'text-mode-hook '(lambda() (flyspell-mode t)))
(add-hook 'prog-mode-hook '(lambda() (flyspell-prog-mode)))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;;保存会话
(require 'desktop)
(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.db"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
;; Automatically save and restore sessions
(setq desktop-dirname             (concat current-emacs-path ".desktop-save/")
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
(desktop-save-mode 1)
;; (setq desktop-path (concat current-emacs-path ".desktop-save/"))
(setq history-length 250)
(desktop-save-mode t)



;;auto-save
(auto-save-mode 1)

(setq auto-save-interval 25)
(setq auto-save-timeout 1)
;; backup policies
(setq make-backup-files t)
(setq backup-by-copying t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

(defvar pheliox-backup-path)
(setq pheliox-backup-path  (concat current-emacs-path ".backup/"))
(setq backup-directory-alist
      `(("." . ,pheliox-backup-path)
        (,tramp-file-name-regexp t)))
(setq auto-save-list-file-prefix
      (concat pheliox-backup-path ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,pheliox-backup-path t)
        (,tramp-file-name-regexp t)))


;; (setq default-frame-alist  '((height . 100) (width . 180) )) 
;;(setq default-frame-alist  nil) 
(if window-system
    (set-frame-size (selected-frame) 280 100))
(split-window-right)

;;auto rename buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;ibuffer replace normal buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;autofill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;paren-mode
(require 'paren)
(set-face-background 'show-paren-match-face "gray30")
(set-face-foreground 'show-paren-match-face "green yellow")
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

;;set tab width
(setq tab-width 4) ; or any other preferred value





;;Messages log
(setq message-log-max t)

;;delete selection mode
(delete-selection-mode 1)

;;auto save when killing buffer

;;set undo settings
(setq undo-limit 15000)
;;set kill ring
(setq kill-ring-max 200)
(requ)
(setq default-major-mode 'text-mode)

;;Custom Font Lock
(global-font-lock-mode t)
(setq font-lock-verbose t)
;;Programming Mode
(defun add-font-lock-keywords-digits-ops ()
  "Add digits and null as constants and operators as keywords in font lock."
                                        ;
  (font-lock-add-keywords nil
                          '(
                            ("[0-9.]+|nil|null|[tf]|true|false" . 'font-lock-constant-face)
                            ("setq|[+-*/<>&~!=|\\|\\||&&]" . 'font-lock-keyword-face)
                            ("\\<sizeof[[:space:]]*(\\([[:alnum:][:space:]*]+\\))" . 'font-lock-type-face)
                            ("\\<[[:alnum:]]+_cast[[:space:]]*<\\([[:alnum:][:space:]*]+\\)>[[:space:]]*(\\([[:alnum:][:space:]*]+\\))" . 'font-lock-type-face)
                            ))
  )

(add-hook 'elisp-mode-hook 'add-font-lock-keywords-digits-ops)
(add-hook 'c++-mode-hook 'add-font-lock-keywords-digits-ops)
(add-hook 'c-mode-hook 'add-font-lock-keywords-digits-ops)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)



;;hippie-expand
;; (global-set-key (kbd "M-/") 'hippie-expand)




(provide 'pheliox-settings)
