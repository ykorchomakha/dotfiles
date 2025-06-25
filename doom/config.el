;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 18)
     doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 18))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Java Configuration
(after! lsp-java

  (setq lombok-library-path (concat doom-data-dir "lombok.jar"))

  (unless (file-exists-p lombok-library-path)
    (url-copy-file "https://projectlombok.org/downloads/lombok.jar" lombok-library-path))

  (setq lsp-java-vmargs '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90" "-Dsun.zip.disableMemoryMapping=true" "-Xmx4G" "-Xms100m"))

  (push (concat "-javaagent:"
                  (expand-file-name lombok-library-path))
          lsp-java-vmargs)
)

;; Show whitespace
(use-package! whitespace
  :config
  (setq
    whitespace-style '(face tabs tab-mark spaces space-mark newline newline-mark)
    whitespace-display-mappings '(
      (space-mark   ?\     [?\u00B7]     [?.])
      (space-mark   ?\xA0  [?\u00A4]     [?_])
      (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])))
  (global-whitespace-mode +1))

;; (use-package! corfu
;;   :custom
;;   (corfu-auto t)                     ; Show completion menu automatically
;;   (corfu-auto-delay 0.2)            ; Delay before popup
;;   (corfu-auto-prefix 1)             ; Start completing after 1 character
;;   (corfu-quit-no-match 'separator)  ; Keep corfu open even if no match
;;   (corfu-quit-at-boundary nil)
;;   (corfu-on-exact-match nil)        ; Don't auto-commit on exact match
;;   (corfu-cycle t)                   ; Optional: cycle through candidates
;;   :bind
;;   (:map corfu-map
;;    ("RET" . corfu-insert)           ; RET confirms selection
;;    ;; disable RET quitting the menu if nothing selected:
;;    ("C-RET" . corfu-insert)
;;    ("<return>" . corfu-insert)))

;; (after! corfu
;;   (setq corfu-preselect 'first))

;; (defun my/corfu-setup-return ()
;;   "Make RET confirm completion only when corfu is visible."
;;   (define-key corfu-map (kbd "RET") #'corfu-insert)
;;   (define-key corfu-map (kbd "<return>") #'corfu-insert))

;; (add-hook 'corfu-mode-hook #'my/corfu-setup-return)

;; (defun my/corfu-insert-or-first ()
;;   "Insert selected candidate, or first if none selected."
;;   (interactive)
;;   (if corfu--candidates
;;       (corfu-insert (or corfu--selected (car corfu--candidates)))
;;     (newline)))

;; (with-eval-after-load 'corfu
;;   (define-key corfu-map (kbd "RET") #'my/corfu-insert-or-first)
;;   (define-key corfu-map (kbd "<return>") #'my/corfu-insert-or-first))
