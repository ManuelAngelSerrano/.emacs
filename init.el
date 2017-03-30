 ;; MELPA
(require 'package)
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

(setq default-input-method "MacOSX")
;;(setq mac-option-key-is-meta t)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-right-option-modifier nil)
(setq x-select-enable-clipboard t)
(setq mac-pass-command-to-system t)

;;(setq mac-pass-command-to-system t)
;;(setq mac-option-modifier nil
;;      mac-command-modifier 'meta
;;      x-select-enable-clipboard t)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")


;; Tema
;;;;;;;;;;;;;;;
(load-theme 'tango-dark)

;; Word Wrap
(global-visual-line-mode 1)

;; markdown-mode
;;;;;;;;;;;;;;;;
(add-hook 'markdown-mode-hook
        (lambda ()
            (when buffer-file-name
              (add-hook 'after-save-hook
                        'check-parens
                        nil t))))


;;Markdown-mode comillas
(add-hook 'markdown-mode-hook (lambda () (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))

;;pandoc-mode
;;;;;;;;;;;;;;
(add-hook 'markdown-mode-hook 'pandoc-mode)
;(add-hook 'pandoc-mode-hook (lambda () (setq pandoc-binary "/usr/local/bin/pandoc"))

;;ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)


;; Keybinds
;;;;;;;;;;;

(global-set-key (kbd "C-<SPC>") 'set-mark-command) ; Ctrl-SPC Set Mark

(global-set-key (kbd "C-k") 'kill-whole-line) ; Ctrl-K Kill

(global-set-key (kbd "C-<tab>") 'other-window) ; Ctrl-TAB Next Window Buffer

;(global-set-key (kbd  "M-4") 'split-window-horizontally) ; Alt-4 abrir ventana a la derecha
;(global-set-key (kbd  "M-S-4") 'split-window-vertically) ; M-Shift-4 abrir ventana abajo

(global-set-key (kbd "C-q") 'save-buffers-kill-emacs) ; Ctrl-Q Quit

(define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward) ; -> Search Forward
(define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward) ; <- Search Backward

(global-set-key (kbd "M-<left>") 'backward-word)
(global-set-key (kbd "M-<right>") 'forward-word)
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "M-x") 'smex)


(global-set-key (kbd "C-z") 'undo) ; Ctrl-Z Undo
(global-set-key (kbd "C-S-Z") 'redo) ; Ctrl-Shift-Z Redo

(global-set-key (kbd "C-'") 'comment-dwim) ; Ctrl-ç Comment

(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
;(define-key markdown-mode-map (kbd "C-b") 'pandoc-convert-to-pdf)

;;Reescribimos las teclas del markdown-mode
(defun mp-add-markdown-keys ()
  (local-set-key (kbd "M-<left>") 'backward-word)
  (local-set-key (kbd "M-<right>") 'forward-word)
  (local-set-key (kbd "M-b") 'backward-word)
  (local-set-key (kbd "M-f") 'forward-word)
  (local-set-key (kbd "M-p") 'backward-paragraph)
  (local-set-key (kbd "M-n") 'forward-paragraph)
  (local-set-key (kbd "M-<up>") 'backward-paragraph)
  (local-set-key (kbd "M-<down>") 'forward-paragraph)
)

(add-hook 'markdown-mode-hook 'mp-add-markdown-keys)
;;Fin Keybind markdown-mode

;; redo+
(require 'redo+)

;; dirtree
(require 'dirtree)

;; linum-mode
(global-linum-mode t)

;; lorem-ipsum
(require 'lorem-ipsum)

;; Yasnippet
;;(add-to-list 'load-path "~/.emacs.d/snippets")
(require 'yasnippet) ;; not yasnippet-bundle
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"
        ))
(yas-global-mode 1)



;; smartparens
(package-initialize)
(smartparens-global-mode t)
(require 'smartparens-config)


;; ;; Autocomplete
;; (add-hook 'c-mode-common-hook '(lambda ()
;;   ;; ac-omni-completion-sources is made buffer local so
;;   ;; you need to add it to a mode hook to activate on
;;   ;; whatever buffer you want to use it with.  This
;;   ;; example uses C mode (as you probably surmised).

;;   ;; auto-complete.el expects ac-omni-completion-sources to be
;;   ;; a list of cons cells where each cell's car is a regex
;;   ;; that describes the syntactical bits you want AutoComplete
;;   ;; to be aware of. The cdr of each cell is the source that will
;;   ;; supply the completion data.  The following tells autocomplete
;;   ;; to begin completion when you type in a . or a ->

;;   (add-to-list 'ac-omni-completion-sources
;;                (cons "\\." '(ac-source-semantic)))
;;   (add-to-list 'ac-omni-completion-sources
;;                (cons "->" '(ac-source-semantic)))

;;   ;; ac-sources was also made buffer local in new versions of
;;   ;; autocomplete.  In my case, I want AutoComplete to use
;;   ;; semantic and yasnippet (order matters, if reversed snippets
;;   ;; will appear before semantic tag completions).

;;   (setq ac-sources '(ac-source-semantic ac-source-yasnippet))
;; ))

;; haml-mode
(require 'haml-mode)

;;tabuladores... No se si funciona
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 5 120 5))

;;auctex
;;;;;;;;
(load "auctex.el" nil t t)
(setq TeX-PDF-mode t)

;; coffeescript
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(delete-selection-mode t)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys t)
 '(package-selected-packages
   (quote
    (yasnippet smex smartparens redo+ markdown-mode+ lorem-ipsum key-chord ido-vertical-mode haml-mode evil-surround dirtree company coffee-mode auctex)))
 '(recentf-mode t)
 '(shift-select-mode nil)
 '(show-paren-mode t))


(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))


;;;;;;;;;;;;;;;;;;;;


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 160 :width normal)))))

(set-face-attribute 'default nil :font  "Menlo-16" )
(set-frame-font   "Menlo-16" nil t)


(setq shift-select-mode t)
;;Para el auto completado
(add-hook 'after-init-hook 'global-company-mode)


;(setq pandoc-binary "/usr/local/bin/pandoc")

(linum-mode 1)

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.15)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;(define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)
