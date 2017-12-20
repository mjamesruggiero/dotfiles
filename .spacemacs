;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     csv
     php
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     ;; better-defaults
     clojure
     common-lisp
     dash
     emacs-lisp
     git
     go
     html
     javascript
     markdown
     org
     python
     racket
     ruby
     ruby-on-rails
     ;; scala
     spell-checking
     sql
     syntax-checking
     themes-megapack
     version-control
     yaml
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (ruby :variables ruby-version-manager 'rvm))
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(pivotal-tracker)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(jbeans
                         ir-black
                         sanityinc-tomorrow-night
                         niflheim
                         dakrone
                         darkburn
                         afternoon
                         solarized-dark
                         solarized-light
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil

   ;; line numbers
   dotspacemacs-line-numbers t
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/user-config ()
  ;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (global-linum-mode)

  (global-set-key (kbd "C-c t") 'timestamp)

  (fset 'evil-visual-update-x-selection 'ignore)

  (setq-default evil-escape-key-sequence "jk")

  ;; org-mode stuff
  ;; mostly copied from http://bit.ly/2bkYZlq
  ;; (global-set-key (kbd "C-c o")
  ;;                 (lambda () (interactive) (find-file "~/org/organizer.org")))

  ;; (setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

  ;; (setq org-agenda-files '("~/org"))

  (global-set-key (kbd "C-c c") 'org-capture)

  ;; (setq org-default-notes-file "~/org/organizer.org")

  ;; Capture templates for: TODO tasks, Notes, etc.
  ;; cribbed from http://doc.norang.ca/org-mode.html#CaptureTemplates
  (setq org-capture-templates
      (quote (("t" "todo" entry (file "~/org/todo.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("n" "note" entry (file "~/organizer.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "journal" entry (file+datetree "~/org/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("m" "meeting" entry (file "~/org/organizer.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "call" entry (file "~/org/organizer.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t))))

  ;; multiple cursors
  ;; (require 'multiple-cursors)
  ;; (global-set-key (kbd "C-c 9") 'mc/edit-lines)

  ;; yasnippet
  (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
  (require 'yasnippet)
  (yas-global-mode 1)

  ;; end user-config
  )

(defun timestamp()
  (interactive)
  (insert "-------------------------\n")
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;; (eval-after-load "org"
;;   '(require 'ox-md nil t))

;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "~/.virtualenvs")

;; (setq cider-cljs-lein-repl
;;       "(do (user/run)
;;            (user/browser-repl))")

;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (add-hook 'before-save-hook 'gofmt-before-save)
;;             (setq tab-width 4)
;;             (setq indent-tabs-mode 1)))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "75d422d50e883b5d7a667d5b72444516b48a5d5aa1fd0904f447ff3fa1a0aa69" "ce557950466bf42096853c6dac6875b9ae9c782b8665f62478980cc5e3b6028d" "3ff96689086ebc06f5f813a804f7114195b7c703ed2f19b51e10026723711e33" "2bed8550c6f0a5ce635373176d5f0e079fb4fb5919005bfa743c71b5eed29d81" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#373b41" t)
 '(package-selected-packages
   (quote
    (phpunit phpcbf php-auto-yasnippets drupal-mode php-mode zonokai-theme zenburn-theme zen-and-art-theme yaml-mode web-beautify underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slime-company slime seti-theme rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme rbenv railscasts-theme racket-mode faceup purple-haze-theme projectile-rails rake professional-theme planet-theme pivotal-tracker phoenix-dark-pink-theme phoenix-dark-mono-theme orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noflet noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode skewer-mode simple-httpd light-soap-theme json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc jazz-theme ir-black-theme inkpot-theme htmlize heroku-theme hemisu-theme helm-gitignore helm-dash helm-company helm-c-yasnippet hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck flatui-theme flatland-theme feature-mode farmhouse-theme evil-magit magit magit-popup git-commit with-editor espresso-theme ensime sbt-mode scala-mode dracula-theme django-theme diff-hl dash-at-point darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-anaconda company common-lisp-snippets color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode chruby cherry-blossom-theme busybee-theme bundler inf-ruby bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-dictionary apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell auto-complete jbeans-theme yapfify ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline slim-mode scss-mode sass-mode restart-emacs request rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode info+ indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump define-word cython-mode csv-mode column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 140 :width normal)))))
