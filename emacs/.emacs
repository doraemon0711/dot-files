;; Load emcs 24's package system. Add MELPA repository.
(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; ########## Install "Use-Package" to get more packages ##########

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

;; ########## Packages to install (using use-package) ##########
;; ######## evil - Basically Vim for emacs ########
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; ######## magit - Great git package for emacs ########
(use-package magit
  :ensure t)

(use-package evil-magit
  :after magit evil
  :ensure t)

;; ######## Treemacs - Better for file-explorer & extra plugins ########
(use-package treemacs
  :ensure t
  :config
    (provide 'init-treemacs))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)



;; Custom commands
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-k") 'move-line-up)
(global-set-key (kbd "M-j") 'move-line-down)

(custom-set-variables
 '(blink-cursor-mode nil)
 '(global-display-line-numbers-mode t)
 '(global-hl-line-mode 1)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
)

(custom-set-faces
 '(default ((t (:family "IBM Plex Mono" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
 



