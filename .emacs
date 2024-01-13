;; Required GNU Emacs version 27.1

;; Sets the theme
(custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(custom-enabled-themes '(tsdh-dark))
)

(custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
)

;; Removes the bell sound
(setq ring-bell-function 'ignore)

;; Sets the default window mode to fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Moves emacs backup files *.txt~ to hidden directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
)

;; Configures the tab to 4 spaces instead of tab character
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)


