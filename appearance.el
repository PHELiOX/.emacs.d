;;Escape-Meta-Alt-Control-Shift Configuration
;;外观设置   


;;去掉工具栏   
(setq tool-bar-mode nil)   
;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单   
(menu-bar-mode nil)   
;;在minibuffer上面可以显示列号   
(column-number-mode t)
;; Set theme
(load "~/.emacs.d/themes/color-theme-monokai/color-theme-monokai.el")
(load "~/.emacs.d/el-get/color-theme-zenburn/zenburn-theme.el")
(color-theme-molokai)
;;(color-theme-almost-monokai)


(provide 'appearance)