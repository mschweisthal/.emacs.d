;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme
    evil
    neotree
    scala-mode
    go-mode
    elpy
    rust-mode))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

;;;; inhibit at startup
(setq fancy-splash-image nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")
(setq inhibit-startup-message t) ;; hide the startup message

(load-theme 'material t) ;; load material theme

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode 1)

;; shell
(global-set-key [f1] 'ansi-term)

;; evil
;(require `evil)
(evil-mode 1)

;; neotree
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'nerd)
;(setq neo-theme (if (display-graphic-p) 'icons 'nerd))

;; set frame transparency
(set-frame-parameter (selected-frame) 'alpha '(90 70))
(add-to-list 'default-frame-alist '(alpha 90 70))

;; set frame size dynamically
;(if (window-system)
;    (set-frame-size (selected-frame) 180 60))
(defun set-frame-size ()
  (interactive)
  (if window-system
  (progn
    (if (> (x-display-pixel-width) 1280)
    (add-to-list 'default-frame-alist (cons 'width 140))
        (add-to-list 'default-frame-alist (cons 'width 80)))
    (add-to-list 'default-frame-alist
    (cons 'height (/ (- (x-display-pixel-height) 200)
             (frame-char-height)))))))
(set-frame-size)

;; replace yes-no
(fset 'yes-or-no-p 'y-or-n-p)

;; line numbering
(global-linum-mode t) ;; enable line numbers globally
;(line-number-mode 1)
;(column-number-mode 1)

;; start new buffers in text mode
(setq default-major-mode 'text-mode)

;; enable auto fill mode (in all major modes)
(setq auto-fill-mode t)

;; tabs and spacing
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-indent 2)

;; buffer titles
(setq frame-title-format "%b")

;; disable backup files ending in ~
(setq make-backup-files nil)

(elpy-enable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elpy go-mode scala-mode neotree evil material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
