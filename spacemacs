;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default

   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(windows-scripts
     ansible
     sql
     (ivy :variables ivy-enable-advanced-buffer-information t)
     swift
     (lsp :variables
          lsp-ui-doc-enable nil
      )
     restructuredtext
     protobuf
     (c-c++ :variables
            c-c++-backend 'lsp-clangd)
     evil-snipe
     vinegar
     epub
     clojure
     (chinese :variables
              chinese-enable-youdao-dict t
              chinese-fcitx-use-dbus t
              chinese-enable-fcitx t)
     systemd
     kotlin
     neotree
     yaml
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-backend 'lsp
           ruby-enable-enh-ruby-mode nil)
     (rust :variables
           rust-backend 'lsp
           rust-format-on-save t)
     dap
     lua
     (go :variables
         go-format-before-save t
         go-use-golangci-lint t
         go-backend 'lsp
         godoc-at-point-function 'godoc-gogetdoc
         gofmt-command "goimports"
         go-tab-width 4 )
     ;; lua
     shell-scripts
     ;; ipython-notebook
     docker
     (java :variables java-backend 'lsp)
     html
     (markdown :variables markdown-live-preview-engine 'vmd)
     javascript
     react
     (python :variables
             python-fill-column 99
             python-backend 'lsp
             python-sort-imports-on-save t
             python-enable-yapf-format-on-save t)
     (dash :variables helm-dash-docset-newpath "~/Library/Application Support/Dash/DocSets/")
     (osx :variables
          osx-command-as  'super)
     (elfeed :variables
             rmh-elfeed-org-files (list
                                   "~/develop/think.org/elfeed.org")
             url-queue-timeout 30)
     vimscript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory nil
                      auto-completion-return-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     git
     (org :variables
          org-want-todo-bindings t)
     spacemacs-org
     (shell :variables
            shell-default-shell 'eshell
            shell-enable-smart-eshell nil
            shell-default-full-span nil
            shell-default-height 35
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
    )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(plantuml-mode ivy-explorer ox-reveal unicode-escape lsp-ivy company-tabnine evil-vimish-fold all-the-icons-ivy posframe go-dlv evil-collection evil-find-char-pinyin ace-pinyin all-the-icons-dired evil-indent-textobject gist evil-leader switch-window evil-easymotion evil-snipe exec-path-from-shell super-save helm-rg kubernetes kubernetes-evil find-file-in-project)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()

  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((projects . 5)
                                (bookmarks . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         monokai
                         spacemacs-dark
                         solarized-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   ;; dotspacemacs-default-font '("FuraCode Nerd Font Mono Retina"
   dotspacemacs-default-font '("Cascadia Mono PL"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (setq-default evil-escape-key-sequence "jj")
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; (set-frame-font "Monaco 12" nil t)

  ;; use C-w o
  ;; (define-key evil-window-map (kbd "z") 'spacemacs/toggle-maximize-buffer)

  ;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/google-translate-chinese.el/"))
  ;; (require 'google-translate-config)

  ;; (setq flycheck-clang-include-path "/usr/local/include")

  ;; (use-package composite
  ;;   :defer t
  ;;   :init
  ;;   (defvar composition-ligature-table (make-char-table nil))
  ;;   :hook
  ;;   (((prog-mode conf-mode nxml-mode markdown-mode help-mode)
  ;;     . (lambda () (setq-local composition-function-table composition-ligature-table))))
  ;; :config
  ;; ;; support ligatures, some toned down to prevent hang
  ;; (when (version<= "27.0" emacs-version)
  ;;   (let ((alist
  ;;          '((33 . ".\\(?:\\(==\\|[!=]\\)[!=]?\\)")
  ;;            (35 . ".\\(?:\\(###?\\|_(\\|[(:=?[_{]\\)[#(:=?[_{]?\\)")
  ;;            (36 . ".\\(?:\\(>\\)>?\\)")
  ;;            (37 . ".\\(?:\\(%\\)%?\\)")
  ;;            (38 . ".\\(?:\\(&\\)&?\\)")
  ;;            (42 . ".\\(?:\\(\\*\\*\\|[*>]\\)[*>]?\\)")
  ;;            ;; (42 . ".\\(?:\\(\\*\\*\\|[*/>]\\).?\\)")
  ;;            (43 . ".\\(?:\\([>]\\)>?\\)")
  ;;            ;; (43 . ".\\(?:\\(\\+\\+\\|[+>]\\).?\\)")
  ;;            (45 . ".\\(?:\\(-[->]\\|<<\\|>>\\|[-<>|~]\\)[-<>|~]?\\)")
  ;;            ;; (46 . ".\\(?:\\(\\.[.<]\\|[-.=]\\)[-.<=]?\\)")
  ;;            (46 . ".\\(?:\\(\\.<\\|[-=]\\)[-<=]?\\)")
  ;;            (47 . ".\\(?:\\(//\\|==\\|[=>]\\)[/=>]?\\)")
  ;;            ;; (47 . ".\\(?:\\(//\\|==\\|[*/=>]\\).?\\)")
  ;;            (48 . ".\\(?:\\(x[a-fA-F0-9]\\).?\\)")
  ;;            (58 . ".\\(?:\\(::\\|[:<=>]\\)[:<=>]?\\)")
  ;;            (59 . ".\\(?:\\(;\\);?\\)")
  ;;            (60 . ".\\(?:\\(!--\\|\\$>\\|\\*>\\|\\+>\\|-[-<>|]\\|/>\\|<[-<=]\\|=[<>|]\\|==>?\\||>\\||||?\\|~[>~]\\|[$*+/:<=>|~-]\\)[$*+/:<=>|~-]?\\)")
  ;;            (61 . ".\\(?:\\(!=\\|/=\\|:=\\|<<\\|=[=>]\\|>>\\|[=>]\\)[=<>]?\\)")
  ;;            (62 . ".\\(?:\\(->\\|=>\\|>[-=>]\\|[-:=>]\\)[-:=>]?\\)")
  ;;            (63 . ".\\(?:\\([.:=?]\\)[.:=?]?\\)")
  ;;            (91 . ".\\(?:\\(|\\)[]|]?\\)")
  ;;            ;; (92 . ".\\(?:\\([\\n]\\)[\\]?\\)")
  ;;            (94 . ".\\(?:\\(=\\)=?\\)")
  ;;            (95 . ".\\(?:\\(|_\\|[_]\\)_?\\)")
  ;;            (119 . ".\\(?:\\(ww\\)w?\\)")
  ;;            (123 . ".\\(?:\\(|\\)[|}]?\\)")
  ;;            (124 . ".\\(?:\\(->\\|=>\\||[-=>]\\||||*>\\|[]=>|}-]\\).?\\)")
  ;;            (126 . ".\\(?:\\(~>\\|[-=>@~]\\)[-=>@~]?\\)"))))
  ;;     (dolist (char-regexp alist)
  ;;       (set-char-table-range composition-ligature-table (car char-regexp)
  ;;                             `([,(cdr char-regexp) 0 font-shape-gstring]))))
  ;;   (set-char-table-parent composition-ligature-table composition-function-table))
  ;; )

  (use-package ivy-explorer
    :ensure t
    :config
    (ivy-explorer-mode 1)
    )

  (use-package ox-reveal
    :ensure t
    :config
    (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js" )
    (setq org-reveal-mathjax t)
    )

  (use-package plantuml-mode
    :ensure t
    :config
    (setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml.jar"))
    (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
    (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

  ;; (use-package helm-lsp
  ;;   :ensure t
  ;;   :config
  ;;   (spacemacs/set-leader-keys-for-minor-mode 'lsp-mode-hook "gs" 'helm-lsp-workspace-symbol)
  ;;   )

  (use-package lsp-ivy
    :ensure t
    :commands lsp-ivy-workspace-symbol)

  (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-fuzzy)
          ;; (swiper . ivy--regex-plus)
          (t . ivy--regex-plus)))

  (defun jazz/region-string()
    "get region string then current-point-symbol"
    (if (not (use-region-p)) (thing-at-point 'symbol)
      (let* ((beg (region-beginning))
             (end (region-end))
             (eol (save-excursion (goto-char beg) (line-end-position))))
        (deactivate-mark) (buffer-substring-no-properties beg (min end eol)))))

  (setq ivy-initial-inputs-alist '((swiper . jazz/region-string)
                                   (t . "")))



  (setq org-clock-into-drawer t)
  (setq org-capture-templates
        '(
           ("t" "Task" entry (file+headline "~/develop/think.org/todolist.org" "Tasks")
            "* TODO %?\n%U\n%a\n %i" :empty-lines 1)

           ;; ("j" "Journal" entry (file+datetree "~/develop/think.org/journal.org" )
           ;;  "* %<%H:%M>\n%?\n" :empty-lines-before 1)

           ("j" "Journal" entry (file+datetree "~/org/journal.org")
            "* %<%R: >%? %^g\n" :empty-lines-before 1)

           ("b" "bookmark" entry (file+headline "~/develop/think.org/bookmarks.org" "Unsorted")
            "* %^{Title}\n\n Source: %u, %c\n\n %i")

           ("w" "WorkLog" entry (file+datetree "~/develop/think.org/worklog.org")
            "* TODO %^{Description}  %^g\n%?\n\n"
            :clock-in t
            :clock-keep t)

          ))


  (use-package evil-vimish-fold
    :ensure t
    :config
    (vimish-fold-global-mode 1))

  (add-hook 'c++-mode-hook
            (lambda ()
              (setq flycheck-clang-include-path (list "/usr/local/include/c++/v1/"))))


  (setq neo-theme 'icons)
  (setq neo-vc-integration '(face))

  ;; (global-set-key (kbd "C-x o") 'switch-window)

  ;; https://www.callmewing.com/2015/12/08/Spacemacs中文字体解决方案/
  (global-pangu-spacing-mode 0)

  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      ;; charset (font-spec :family "文泉驿等宽微米黑" :size 16)))
                      charset (font-spec :family "WenQuanYi Micro Hei Mono" :size 15)))

  (with-eval-after-load 'go-mode
    (require 'go-dlv)
    (gud-def gud-restart "restart"          "r"    "restart session")
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "db" 'gud-break)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dc" 'gud-cont)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dr" 'gud-remove)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dn" 'gud-next)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dt" 'gud-trace)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dp" 'gud-print)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dd" 'gud-restart)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "ds" 'gud-step)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "dl" 'dlv)
  )

  ;; (when (memq window-system '(mac ns x))
  ;;   (exec-path-from-shell-initialize))

  (define-key evil-motion-state-map (kbd "C-w C-q") (kbd "C-w q"))

  ;; (define-key ivy-minibuffer-map (kbd "C-l") (kbd "DEL"))
  ;; (defun jazz/ivy-toggle-mark ()
  ;;   "Toggle mark for current candidate and move forwards."
  ;;   (interactive)
  ;;   (if (ivy--marked-p)
  ;;       (ivy-unmark)
  ;;     (ivy-mark)))
  ;; (define-key ivy-minibuffer-map (kbd "C-SPC") 'jazz/ivy-toggle-mark)

  (spacemacs/set-leader-keys-for-major-mode 'eshell-mode "," 'spacemacs/ivy-eshell-history)

  (define-key Buffer-menu-mode-map (kbd "k") 'previous-line)

  (setq x-select-enable-clipboard t)

  ;; modify with
  (defun my/rudekill-matching-buffers (regexp &optional internal-too)
  "Kill - WITHOUT ASKING - buffers whose name matches the specified REGEXP. See
the `kill-matching-buffers` for grateful killing. The optional 2nd argument
indicates whether to kill internal buffers too.

Returns the count of killed buffers."
  (let* ((buffers (remove-if-not
                   (lambda (buffer)
                     (let ((name (buffer-name buffer)))
                       (and name (not (string-equal name ""))
                            (or internal-too (/= (aref name 0) ?\s))
                            (not (buffer-modified-p buffer))
                            (string-match regexp name))))
                   (buffer-list))))
    (mapc 'kill-buffer buffers)
    (length buffers)))

  (defun my/kill-matching-buffers-rudely (regexp &optional internal-too)
    "Kill - WITHOUT ASKING - buffers whose name matches the specified REGEXP. See
the `kill-matching-buffers` for grateful killing. The optional 2nd argument
indicates whether to kill internal buffers too.

Returns a message with the count of killed buffers."
    (interactive "sKill buffers matching this regular expression: \nP")
    (message
     (format "%d buffer(s) killed."
             (my/rudekill-matching-buffers regexp internal-too))))


  (use-package lsp-mode
    :ensure t
    :commands lsp
    :init
    (setq
          ;; lsp-ui-sideline-enable t
          ;; lsp-enable-symbol-highlighting nil
          ;; lsp-ui-doc-use-webkit t
          ;; lsp-ui-sideline-show-code-actions  nil
          lsp-response-timeout 5
          lsp-auto-guess-root t
          lsp-auto-configure t
          ;; lsp-enable-snippet nil
          ;; lsp-enable-file-watchers nil
          lsp-java-vmargs (list
                           "-noverify"
                           "-Xms2G"
                           "-Xmx2G"
                           "-XX:+UseG1GC"
                           "-XX:+UseStringDeduplication"
                           "-javaagent:/home/zhijia.zhang/.emacs.d/vendor/lombok.jar")
          ;; lsp-ui-flycheck-enable t
          )
    :config
    (require 'lsp-go)
    (require 'lsp-solargraph)
    (require 'lsp-pyls)
    (require 'lsp-rust))

    (require 'lsp-json)
    (add-hook 'json-mode-hook 'lsp)
    (require 'lsp-yaml)
    (add-hook 'yaml-mode-hook 'lsp)


    (use-package company-tabnine
      :ensure t
      ;; :after (company-lsp)
      :defer t
      :commands company-tabnine
      :config
      (add-to-list 'company-backends '(company-capf :with company-tabnine :with company-yasnippet :separate))
      ;; (add-to-list 'company-backends 'company-tabnine)
      (setq company-tabnine-max-num-results 5))


    (defun jazz/merge-company-tabnine-with-company-capf()
      (interactive)
      ;; (add-to-list 'company-backends 'company-tabnine :append)
      ;; (add-to-list 'company-backends 'company-tabnine)
      (add-to-list 'company-backends '(company-capf :with company-tabnine :with company-yasnippet :separate))
      ;; (when (member '(company-lsp :with company-yasnippet) company-backends)
      ;;     ;; (setq company-backends (remove 'company-tabnine company-backends))
      ;;     ;; (setq company-backends (remove '(company-lsp :with company-tabnine :separate) company-backends))
      ;;   (setq company-backends (remove '(company-lsp :with company-yasnippet) company-backends))
      ;;   (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate)))
      )

    ;; (remove-hook 'go-mode-hook 'jazz/merge-company-tabnine-with-company-lsp)
    (add-hook 'go-mode-hook 'jazz/merge-company-tabnine-with-company-capf :append)

    (use-package company
      :config
      (setq company-idle-delay 0.2)
      (setq company-show-numbers nil)
      )

  ;; (require 'lsp-mode)
  ;; (remhash 'gopls lsp-clients)
  ;; (setq lsp-clients-go-command "/Users/admin/develop/go/bin/gopls")
  ;; (setq lsp-ui-doc-use-webkit t)
  ;; (setq lsp-response-timeout 5)
  ;; (setq lsp-enable-snippet t)
  ;; (setq lsp-auto-guess-root t)
  ;; (setq lsp-auto-configure nil)
  ;; (setq company-lsp-enable-recompletion t)
  ;; (setq company-lsp-async t)
  ;; (setq lsp-enable-completion-at-point t)
  ;; (setq company-lsp-enable-snippet t)


  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-stdio-connection "gopls")
  ;;                   :major-modes '(go-mode)
  ;;                   :priority 0
  ;;                   :initialization-options 'lsp-clients-go--make-init-options
  ;;                   :server-id 'gopls
  ;;                   :library-folders-fn (lambda (_workspace)
  ;;                                         lsp-clients-go-library-directories)))

  ;; (defun lsp-clients-ruby-make-options ()
  ;;   `(:solargraph.diagnostics t))

  ;; ;; Ruby
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-stdio-connection '("solargraph" "stdio"))
  ;;                   :major-modes '(ruby-mode enh-ruby-mode)
  ;;                   :priority -1
  ;;                   :multi-root t
  ;;                   :initialization-options #'lsp-clients-ruby-make-options
  ;;                   :server-id 'ruby-ls))

  ;; (remove-hook 'yaml-mode-hook 'lsp)


  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'web-mode-hook 'highlight-indentation-mode)

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :hook
      (lsp-mode . lsp-ui-mode)
    :custom-face
      (lsp-ui-doc-background ((t (:background nil))))
      (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
    :bind (:map lsp-ui-mode-map
                ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                ([remap xref-find-references] . lsp-ui-peek-find-references))
    :custom
      (lsp-ui-doc-enable t)
      (lsp-ui-doc-use-childframe t)
      (lsp-ui-flycheck-enable t)
      (lsp-ui-flycheck-list-position 'right)
      (lsp-ui-flycheck-live-reporting t)
      (lsp-ui-peek-enable t)
      (lsp-ui-peek-list-width 60)
      (lsp-ui-peek-peek-height 25)
      (lsp-ui-doc-header t)
      (lsp-ui-doc-include-signature t)
      (lsp-ui-doc-position 'top)
      (lsp-ui-doc-border (face-foreground 'default))
      (lsp-ui-sideline-enable t)
      (lsp-ui-sideline-ignore-duplicate t)
      (lsp-ui-sideline-show-code-actions t)
    )

  ;; (use-package company-lsp
  ;;   :ensure t
  ;;   :commands company-lsp
  ;;   :config
  ;;   (require 'company)
  ;;   (push '(company-lsp :with company-yasnippet) company-backends))


  ;; (with-eval-after-load 'lsp-mode
  ;;   (require 'lsp-ui)
  ;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  ;;   (require 'lsp-ui-flycheck)
  ;;   (lsp-ui-flycheck-enable t)
  ;;   (flycheck-mode 1)
  ;;   (require 'company)
  ;;   (push '(company-lsp :with company-yasnippet) company-backends))

  ;; (use-package go-mode
  ;;   :ensure t
  ;;   :config
  ;;   (require 'dap-go)
  ;;   (add-hook 'go-mode-hook #'lsp))
  ;; ;; configurations for golang
  ;; (setq go-format-before-save t)

  ;; (require 'evil-collection)
  ;; (evil-collection-init 'eshell)
  ;; (dolist (mode '(company))
  ;;   (setq evil-collection-mode-list (delq mode evil-collection-mode-list)))
  (setq evil-collection-mode-list '(eshell))
  (require 'evil-collection)
  (evil-collection-init)
  ;; support chinese character

  (require 'evil-find-char-pinyin)
  (evil-find-char-pinyin-mode 1)

(require 'ace-pinyin)
  (ace-pinyin-global-mode 1)

  (require 'all-the-icons)
  (require 'all-the-icons-dired)
  (setq ls-lisp-use-insert-directory-program nil)
  (require 'ls-lisp)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  ;;https://github.com/domtronn/all-the-icons.el#slow-rendering
  (setq inhibit-compacting-font-caches t)

  (with-eval-after-load "neotree"
    (defun neo-buffer--insert-fold-symbol (name &optional file-name)
      "Custom overriding function for the fold symbol.
`NAME' decides what fold icon to use, while `FILE-NAME' decides
what file icon to use."
      (or (and (equal name 'open)  (insert (all-the-icons-icon-for-dir file-name "down")))
          (and (equal name 'close) (insert (all-the-icons-icon-for-dir file-name "right")))
          (and (equal name 'leaf)  (insert (format "\t\t\t%s\t" (all-the-icons-icon-for-file file-name))))))

    (defun neo-buffer--insert-dir-entry (node depth expanded)
      (let ((node-short-name (neo-path--file-short-name node)))
        (insert-char ?\s (* (- depth 1) 2)) ; indent
        (when (memq 'char neo-vc-integration)
          (insert-char ?\s 2))
        (neo-buffer--insert-fold-symbol
         (if expanded 'open 'close) node)
        (insert-button (concat node-short-name "/")
                       'follow-link t
                       'face neo-dir-link-face
                       'neo-full-path node
                       'keymap neotree-dir-button-keymap)
        (neo-buffer--node-list-set nil node)
        (neo-buffer--newline-and-begin)))

    (defun neo-buffer--insert-file-entry (node depth)
      (let ((node-short-name (neo-path--file-short-name node))
            (vc (when neo-vc-integration (neo-vc-for-node node))))
        (insert-char ?\s (* (- depth 1) 2)) ; indent
        (when (memq 'char neo-vc-integration)
          (insert-char (car vc))
          (insert-char ?\s))
        (neo-buffer--insert-fold-symbol 'leaf node-short-name)
        (insert-button node-short-name
                       'follow-link t
                       'face (if (memq 'face neo-vc-integration)
                                 (cdr vc)
                               neo-file-link-face)
                       'neo-full-path node
                       'keymap neotree-file-button-keymap)
        (neo-buffer--node-list-set nil node)
        (neo-buffer--newline-and-begin))))

  (require 'find-file-in-project)
  (setq ffip-use-rust-fd t)

  ;; yasnippet

  ;; (require 'yasnippet)
  ;; (add-to-list 'yas-snippet-dirs "/Users/admin/develop/yasnippet-golang/")
  ;; ln -s /Users/admin/develop/yasnippet-golang/go-mode/ ~/.emacs.d/private/snippets/go-mode/

  ;; end

  ;; start configure prettify-symbols-mode
  ;; https://stack overflow.com/questions/26657225/how-to-use-emacs-prettify-symbols-mode
  ;; https://github.com/emacs-china/hello-emacs/blob/master/Emacs_Redux/prettify-symbols-mode%E4%B8%80%E8%A7%88.org
  (global-prettify-symbols-mode t)
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              ;; (message "1. hook prettify @ emacs-lisp-mode")
              (push '("<=" . ?≤) prettify-symbols-alist)
              (push '(">=" . ?≥) prettify-symbols-alist)))
  (add-hook 'go-mode-hook
            (lambda ()
              (setq go-format-before-save t)
              (push '("<-" . ?←) prettify-symbols-alist)
              (push '("->" . ?→) prettify-symbols-alist)))



  (setq org-startup-with-inline-images t)
  ;; https://blog.jft.rocks/emacs/unicode-for-orgmode-checkboxes.html
  (add-hook 'org-mode-hook (lambda ()
                             "Beautify Org Checkbox Symbol"
                             (push '("[ ]" . "☐" ) prettify-symbols-alist)
                             (push '("[X]" . "☑" ) prettify-symbols-alist)
                             (push '("[-]" . "❍" ) prettify-symbols-alist)
                             (prettify-symbols-mode)))
  (defface org-checkbox-done-text
    '((t (:foreground "#71696A" :strike-through t)))
    "Face for the text part of a checked org-mode checkbox.")

  (font-lock-add-keywords
   'org-mode
   `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
      1 'org-checkbox-done-text prepend))
   'append)

  ;; https://github.com/tonsky/FiraCode/issues/312
  ;; https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
  ;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/fira-code-mode/"))
  ;; (require 'fira-code-mode)
  ;; 这里存在缺陷，不能保障prog最后执行
  ;; (add-hook 'prog-mode-hook
  ;;           (lambda ()
  ;;             ;; (message "2. hook prettify @ prog-mode")
  ;;             (fira-code-mode t)))
  ;; ;; end

  ;; (add-hook 'after-make-frame-functions
  ;;  (lambda (frame)
  ;;   (when (not (display-graphic-p frame))
  ;;    (remove-hook 'prog-mode-hook
  ;;     (lambda()
  ;;      (fira-code-mode t))))))

  ;; (add-hook 'after-make-frame-functions
  ;;  (lambda (frame)
  ;;   (if (display-graphic-p frame)
  ;;    (add-hook 'prog-mode-hook (fira-code-mode t))
  ;;    (remove-hook 'prog-mode-hook 'fira-code-mode)
  ;;   )))

  ;; (add-hook 'java-mode-hook (add-hook 'before-save-hook 'lsp-format-buffer))

  ;; chinese charset

  ;; https://callmewing.com/2015/12/08/Spacemacs%E4%B8%AD%E6%96%87%E5%AD%97%E4%BD%93%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/
  ;;
  ;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;   (set-fontset-font (frame-parameter nil 'font)
  ;;                     ;; charset (font-spec :family "苹方-简"
  ;;                     charset (font-spec :family "文泉驿等宽微米黑"
  ;;                     ;; charset (font-spec :family "兰亭黑-简"
  ;;                     ;; charset (font-spec :family "微软雅黑"
  ;;                                        :size 15)))

  ;;

  ;; config the projectile-find
  ;; (setq projectile-generic-command "fd -H --ignore-file .projectile -t f -0")
  ;; (setq projectile-generic-command "fd --ignore-file .projectile -cnever -tf -0")

  ;; (setq projectile-completion-system 'ivy)

  ;; (setq projectile-generic-command "fd -cnever -0")
  (setq projectile-enable-caching t)
  ;; (setq projectile-indexing-method 'alien)
  (setq projectile-git-submodule-command nil)
  ;; (setq projectile-git-command "fd . -H -tf -cnever -0")
  (setq projectile-sort-order 'recently-active)
  ;; (setq projectile-require-project-root nil)
  ;; (setq projectile-hg-command "fd -cnever -tf -0")

  ;; pippel
  ;; (eval-after-load 'pippel
  ;;   '(progn
  ;;      (setq pippel-python-command "python3")
  ;;      )
  ;;   )

  ;; begin elfeed

  ;; http://pragmaticemacs.com/emacs/star-and-unstar-articles-in-elfeed/

  (eval-after-load 'elfeed-search
    '(progn
       (setq elfeed-show-mode-hook
             (lambda ()
               (set-face-attribute 'variable-pitch (selected-frame)
                                   :font (font-spec :family "Input Mono" :size 18))
               (setq fill-column 120)))
       ;; @6-months-ago
       ;; @8-hours-ago
       (setq-default elfeed-search-filter "@1-day-ago +unread -minor")
       (defalias 'elfeed-toggle-star
         (elfeed-expose #'elfeed-search-toggle-all 'star))
       (define-key elfeed-search-mode-map (kbd "m") 'elfeed-toggle-star)
       (define-key elfeed-search-mode-map (kbd "t") 'elfeed-search-toggle-all)
       (defface elfeed-search-star-title-face '((t :foreground "#f77")) "Marks a starred Elfeed entry.")
       (push '(star elfeed-search-star-title-face) elfeed-search-face-alist)))

  ;; end elfeed

  ;; https://github.com/bbatsov/super-save
  ;; (require 'super-save)
  ;; (setq super-save-auto-save-when-idle nil)
  ;; (spacemacs|diminish super-save-mode "◕ᴥ◕" "s")
  ;; (super-save-mode +1)


  (use-package ivy-explorer
    :config
    (spacemacs|diminish ivy-explorer-mode "◕ᴥ◕" "V")
    )

  (add-to-list 'evil-emacs-state-modes 'gist-list-mode)
  (evil-add-hjkl-bindings gist-list-menu-mode-map 'emacs
    (kbd "X")  'gist-kill-current)

  (with-eval-after-load 'kubernetes-overview
    (require 'kubernetes-evil)
    )

  (defun my/print-major-mode()
    (interactive)
    (print major-mode))

  (defun my/which-active-modes ()
    "Give a message of which minor modes are enabled in the current buffer."
    (interactive)
    (let ((active-modes))
      (mapc (lambda (mode) (condition-case nil
                               (if (and (symbolp mode) (symbol-value mode))
                                   (add-to-list 'active-modes mode))
                             (error nil) ))
            minor-mode-list)
      (message "Active modes are %s" active-modes)))

  ;; (define-key markdown-mode-map (kbd "TAB") 'evil-toggle-fold)
  ;; (define-key orgtbl-mode-map (kbd "TAB") 'evil-toggle-fold)
  ;; (defvar prelude-mode-map
  ;;   (let ((map (make-sparse-keymap)))
  ;;     (define-key map (kbd "TAB") 'evil-toggle-fold)
  ;;     map))

  ;; (defvar prelude-mode-keymap (make-keymap) "prelude-mode-keymap")

  ;; (define-minor-mode prelude-mode
  ;;   "helpful functionality for prelude-mode."
  ;;   nil
  ;;   "prelude mode"
  ;;   prelude-mode-map)

  ;; (define-key prelude-mode-map (kbd "TAB") 'evil-toggle-fold)

  ;; (add-hook 'markdown-mode-hook
  ;;           (lambda ()
  ;;             (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
  ;;                   (newmap (make-sparse-keymap)))
  ;;               (set-keymap-parent newmap oldmap)
  ;;               (define-key newmap (kbd "TAB") 'evil-toggle-fold)
  ;;               (make-local-variable 'minor-mode-overriding-map-alist)
  ;;               (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))))

  ;;
  ;; https://www.reddit.com/r/emacs/comments/69oqzw/how_do_i_make_a_keymap_with_higher_precedence/
  ;; the order from lowest to highest priority is
  ;;  global-map <- major-mode <- minor-mode <- emulation-mode-maps
  ;;
  ;; (defun local-set-minor-mode-key (mode key def)
  ;;   "Overrides a minor mode keybinding for the local
  ;;  buffer, by creating or altering keymaps stored in buffer-local
  ;;  `minor-mode-overriding-map-alist'."
  ;;   (let* ((oldmap (cdr (assoc mode minor-mode-map-alist)))
  ;;          (newmap (or (cdr (assoc mode minor-mode-overriding-map-alist))
  ;;                      (let ((map (make-sparse-keymap)))
  ;;                        (set-keymap-parent map oldmap)
  ;;                        (push `(,mode . ,map) minor-mode-overriding-map-alist)
  ;;                        map))))
  ;;     (define-key newmap key def)))

  ;; (with-eval-after-load 'markdown
  ;;     (local-set-minor-mode-key 'evil-motion-state-minor-mode (kbd "TAB") 'evil-toggle-fold)))

  ;; (add-hook 'markdown-mode-hook 'lambda()
  ;;           (local-set-minor-mode-key 'evil-motion-state-minor-mode (kbd "TAB") 'evil-toggle-fold))
  ;; (setq markdown-mode-hook nil)
  ;; (define-key evil-normal-state-map (kbd "TAB") nil)

  ;; (eval-after-load 'markdown-mode
  ;;   '(progn
  ;;      (define-key 'evil-normal-state-minor-mode (kbd "TAB") 'markdown-cycl)
  ;;      ;; (evil-make-overriding-map markdown-mode-map 'normal)
  ;;      ;; (evil-define-key 'hybrid markdown-mode-map
  ;;      ;;   "TAB" markdown-cycle
  ;;      ;;   )
  ;;      ;; )
  ;; )

  ;; https://github.com/syl20bnr/spacemacs/issues/5933

  ;; ========================================================================================================
  ;; You need to install https://github.com/vovkasm/input-source-switcher
  ;; In thу Terminal # issw   show you namу of the current layout
  ;; (setq issw_default_lang_source "com.sogou.inputmethod.sogou.pinyin")
  ;; (setq issw_default_lang_source "fcitx-keyboard-us")

  ;; (defun my/enter-evil-state-hook()
  ;;   (interactive)
  ;;   (shell-command (concat "fcitx-remote -s " issw_default_lang_source)))

  ;; (defun my/exit-evil-state-hook()
  ;;   (interactive)
  ;;   (setq issw_default_lang_index (substring (shell-command-to-string "fcitx-remote") 0 -1))
  ;;   (message issw_default_lang_index)
  ;;   (if (equal issw_default_lang_index "1")
  ;;       (setq issw_default_lang_source "fcitx-keyboard-us")
  ;;       (setq issw_default_lang_source "sogoupinyin")
  ;;       )
  ;;   (shell-command "fcitx-remote -s fcitx-keyboard-us"))

  ;; (add-hook 'evil-hybrid-state-entry-hook 'my/enter-evil-state-hook)
  ;; (add-hook 'evil-hybrid-state-exit-hook  'my/exit-evil-state-hook)

  ;; (add-hook 'evil-emacs-state-entry-hook 'my/enter-evil-state-hook)
  ;; (add-hook 'evil-emacs-state-exit-hook  'my/exit-evil-state-hook)

  ;; (add-hook 'evil-insert-state-entry-hook 'my/enter-evil-state-hook)
  ;; (add-hook 'evil-insert-state-exit-hook  'my/exit-evil-state-hook)

  ;; (add-hook 'evil-replace-state-entry-hook 'my/enter-evil-state-hook)
  ;; (add-hook 'evil-replace-state-exit-hook  'my/exit-evil-state-hook)

  ;; ========================================================================================================
  (defun my/compile-then-exec-java()
    (interactive)
    (require 'deferred)
    (deferred:$
      (deferred:next
        (lambda () (meghanada-compile-file)))
      (deferred:nextc it
        (lambda () (meghanada-exec-main)))
      (deferred:error it
        (lambda (err)
          (message "wrong happy: %s" err)))))

  (defun jazz/run-current-ruby-file()
    (interactive)
    (let* ((fname (buffer-file-name))
           (cmd (concat "ruby" " -rpry" " \"" fname "\"")))
      (when (buffer-modified-p)
        (when (y-or-n-p "Buffer modified. Do you want to save first?")
          (save-buffer)))
      (progn
        (message "Running…")
        (async-shell-command cmd "*ruby-exec-output*"))))


  (defun my/open-markdown-with-typora()
    (interactive)
    (let ((file-path (if (derived-mode-p 'dired-mode)
                         (dired-get-file-for-visit)
                       buffer-file-name)))
      (if file-path
          (if (eq system-type 'gnu/linux)
              (shell-command (format "xdg-open \"%s\"" file-path))
            (shell-command (format "open \"%s\"" file-path)))
        (message "No file associated to this buffer."))))


  ;; (spacemacs/set-leader-keys-for-major-mode 'java-mode "xx" 'meghanada-exec-main)
  (spacemacs/set-leader-keys-for-major-mode 'java-mode "xx" 'my/compile-then-exec-java)
  (spacemacs/set-leader-keys-for-major-mode 'ruby-mode "xx" 'jazz/run-current-ruby-file)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "xx" 'spacemacs/python-execute-file)
  (spacemacs/set-leader-keys-for-major-mode 'kotlin-mode "tt" 'gradle-test)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "xx" 'my/open-markdown-with-typora)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "q" 'markdown-insert-blockquote)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "Q" 'markdown-insert-gfm-code-block)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "ll" 'org-ctrl-c-minus)
  ;; should be `,dd` which toggle-breakpoint for general
  (spacemacs/set-leader-keys-for-major-mode 'ruby-mode "dp" 'jazz/ruby-toggle-pry)

  ;; (use-package org-bullets
  ;;   :config
  ;;   (setq org-bullets-bullet-list '("■" "◆" "▶" "▲" ))
  ;;   (add-hook 'org-mode-hook #'org-bullets-mode)
  ;;   )

  (use-package org-superstar
    ;; :config
    ;; (setq org-superstar-headline-bullets-list '("☰" "◉" "✸" "➤"))
    )


  ;; (require 'evil-easymotion)
  ;; (require 'evil-snipe)
  ;; (define-key evil-normal-state-map "s"  (evilem-create (list #'evil-snipe-repeat #'evil-snipe-repeat-reverse)
  ;;                                                       :name 'evil-easymotion-snipe-forward
  ;;                                                       :pre-hook (save-excursion (call-interactively #'evil-snipe-s))
  ;;                                                       :bind ((evil-snipe-scope 'buffer)
  ;;                                                              (evil-snipe-enable-highlight nil)
  ;;                                                              (evil-snipe-enable-incremental-highlight nil))))


  (defun jazz/ruby-toggle-pry()
    "Add a break point, highlight it."
    (interactive)
    (let ((trace "binding.pry if defined?(binding.pry)")
          (line (thing-at-point 'line)))
      (if (and line (string-match "binding.pry\sif\sdefined\\?\(binding.pry\)"  line))
          (kill-whole-line)
        (progn
          (back-to-indentation)
          (insert trace)
          (insert "\n")
          (ruby-indent-line)
          ))))

  (remove-hook 'python-mode-hook 'importmagic-mode)
  (setq python-shell-interpreter "ipython3")
  ;; (setq python-shell-interpreter "/usr/local/bin/python3")

  ;; https://github.com/syohex/emacs-helm-ag/issues/316
  (add-to-list 'exec-path "/usr/local/bin/")

  ;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/evcxr-mode/"))
  ;; (require 'evcxr)
  ;; (use-package evcxr
  ;;   :load-path "~/.emacs.d/vendor/evcxr-mode/"
  ;;   :defer t
  ;;   :config
  ;;   (add-hook 'rust-mode-hook #'evcxr-minor-mode)
  ;;   )

  ;; https://github.com/manateelazycat/awesome-tab
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/awesome-tab/"))
  (require 'awesome-tab)
  ;; (with-eval-after-load 'awesome-tab
  ;;   (customize-set-variable 'awesome-tab-ace-keys '(?j ?k ?f ?k ?g ?h ?n ?b ?r ?y ?t)))
  ;; (setq awesome-tab-style "wave")
  (setq awesome-tab-height 120)
  (setq awesome-tab-dark-active-bar-color "#4afa0f")
  (setq awesome-tab-icon-height 0.8)
  ;; (setq awesome-tab-dark-active-bar-color nil)
  ;; (setq awesome-tab-display-sticky-function-name t)
  ;; (setq awesome-tab-light-active-bar-color "#0c40eb")
  (awesome-tab-mode t)

  (defun my/open-awesome-tab-group()
    (interactive)
    (awesome-tab-build-helm-source)
    (helm :sources 'helm-source-awesome-tab-group
          :buffer "*helm-awesome-tab-group*")
    )

  (defun my/toggle-lsp-ui-mode()
    (interactive)
    (let ((lsp-ui--on "on")
          (lsp-ui--off "off"))
      (if (bound-and-true-p lsp-ui-mode)
          (progn
            (lsp-ui-mode -1)
            (remove-hook 'lsp-mode-hook 'lsp-ui-mode)
            (setq my/is-lsp-ui-mode-present nil)
            (message "lsp-ui-mode %s" lsp-ui--off))
        (progn
          (add-hook 'lsp-mode-hook 'lsp-ui-mode)
          (lsp-ui-mode 1)
          (setq my/is-lsp-ui-mode-present t)
          (message "lsp-ui-mode %s" lsp-ui--on)
          ))))

  (spacemacs-evil/init-hs-minor-mode)
  ;; use za  (evil-toggle-fold)
  ;; (spacemacs/set-leader-keys "[" #'hs-toggle-hiding)
  ;; bind to SPC o m ]
  ;; (spacemacs/set-leader-keys "]" #'my/toggle-hs-hide-all)

  (require 'hideshow)
  (defun my/toggle-hs-hide-all()
    (interactive)
    (hs-life-goes-on
     (if (hs-already-hidden-p)
         (hs-show-all)
       (hs-hide-all))))

  ;; ;; https://github.com/emacsmirror/hide-region
  ;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/hide-region/"))
  ;; (require 'hide-region)
  ;; (setq hide-region-after-string ".. }}}")


  ;; https://github.com/skeeto/youtube-dl-emacs.git
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/youtube-dl-emacs/"))
  (require 'youtube-dl)
  (setq youtube-dl-arguments '("--proxy" "socks5://127.0.0.1:1086" "--no-mtime" "--restrict-filenames" "--format" "best"))
  (setq youtube-dl-directory "~/Downloads/youtube-dl/")

  (setq-default
   flycheck-python-pycompile-executable "python3"
   ;; flycheck-checker 'python-pylint
   ;; flycheck-pylintrc "~/.pylintrc"
   flycheck-python-pylint-executable "python3"
   ;; ;; python-flake8
   flycheck-python-flake8-executable "python3"
   ;; flycheck-flake8-maximum-line-length 120

   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

;;; transparency
  (defun my/djcb-opacity-modify (&optional dec)
    "modify the transparency of the emacs frame; if DEC is t,
   decrease the transparency, otherwise increase it in 10%-steps"
    (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
           (oldalpha (if alpha-or-nil alpha-or-nil 100))
           (newalpha (if dec (- oldalpha 5) (+ oldalpha 5))))
      (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
        (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

  ;; (setq mac-command-modifier 'super)
  ;; C-8 will increase opacity (== decrease transparency)
  ;; C-9 will decrease opacity (== increase transparency
  ;; C-0 will returns the state to normal
  (global-set-key (kbd "s-8") '(lambda()(interactive)(my/djcb-opacity-modify)))
  (global-set-key (kbd "s-9") '(lambda()(interactive)(my/djcb-opacity-modify t)))
  (global-set-key (kbd "s-0") '(lambda()(interactive)
                                 (modify-frame-parameters nil `((alpha . 100)))))
  (global-set-key [f8] 'neotree-find-project-root)
  (global-set-key [f11] 'helm-semantic-or-imenu)
  ;; (global-set-key (kbd "s-o") 'helm-projectile)
  ;; (global-set-key (kbd "s-f") 'spacemacs/helm-project-do-rg-region-or-symbol)
  ;; (global-set-key (kbd "s-b") 'ivy-switch-buffer)
  ;; (global-set-key (kbd "s-t") 'org-agenda)
  ;; (global-set-key (kbd "s-h") 'helm-swoop)
  (global-set-key (kbd "s-=") 'text-scale-increase)
  (global-set-key (kbd "s--") 'text-scale-decrease)
  ;; (global-set-key (kbd "s-p") 'awesome-tab-forward-group)
  ;; (global-set-key (kbd "s-[") 'awesome-tab-forward-tab)
  ;; (global-set-key (kbd "s-n") 'next-buffer)
  ;; (global-set-key (kbd "s-p") 'previous-buffer)
  ;; (global-set-key (kbd "s-n") 'awesome-tab-backward-group)
  ;; (global-set-key (kbd "s-]") 'awesome-tab-backward-tab)
  (global-set-key (kbd "s-[") 'awesome-tab-backward-tab)
  ;; (global-set-key (kbd "M-[") 'awesome-tab-backward-tab)
  (global-set-key (kbd "s-]") 'awesome-tab-forward-tab)
  ;; (global-set-key (kbd "M-]") 'awesome-tab-forward-tab)
  ;; (global-set-key (kbd "s-o") 'helm-mini)
  ;; (global-set-key (kbd "s-r") 'helm-recentf)
  ;; (global-set-key (kbd "M-n") 'next-buffer)
  ;; (global-set-key (kbd "M-p") 'previous-buffer)
  (global-set-key (kbd "s-g") 'awesome-tab-counsel-switch-group)
  (global-set-key (kbd "s-a") 'awesome-tab-select-beg-tab)
  (global-set-key (kbd "s-e") 'awesome-tab-select-end-tab)

  ;; (add-hook 'after-init-hook 'server-start)
  (add-hook 'window-setup-hook 'server-start)
  (setq confirm-kill-emacs 'y-or-n-p)

  (setq dotspacemacs-startup-lists nil)
  ;; (add-hook 'emacs-startup-hook (lambda nil (kill-buffer "*scratch*")))
  ;; (add-hook 'window-setup-hook (lambda nil (kill-buffer "*scratch*")))
  ;; unset key \ for 'evil-execute-in-emacs-state
  (define-key evil-motion-state-map "\\" nil)
  (require 'evil-leader)
  (global-evil-leader-mode 1)
  ;; (evil-leader/set-leader "<SPC>")

  (require 'switch-window)
  (global-set-key (kbd "C-x o") 'switch-window)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-auto-resize-window t)
  (setq switch-window-default-window-size 0.8) ;80% of frame size
  (setq switch-window-qwerty-shortcuts
        '("j" "k" "l" "f" "o" "r" "y" "m" "n"))
  ;; (setq switch-window-shortcut-appearance 'asciiart)

  (defcustom my/proxy-enabled nil "holding whether enable url proxy or not"
    :type 'boolean)
  ;; https://stackoverflow.com/questions/1595418/emacs-behind-http-proxy
  (defun my/toggle-url-proxy()
    (interactive)
    (if my/proxy-enabled
        (progn
          (setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)" )
                                     ("socks5" . "127.0.0.1:10802")
                                     ("socks5" . "127.0.0.1:10802")))
          (setq my/proxy-enabled nil)
          (message "set proxy = 127.0.0.1:10802"))
      (progn
        (setq url-proxy-services '(()))
        (setq my/proxy-enabled t)
        (message "set no proxy ")
        )
      ))

  (defun my/open-org-file()
    (interactive)
    (find-file "~/develop/think.org/inbox.org"))

  (defun my/create-scratch-buffer nil
    "create a scratch buffer"
    (interactive)
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (lisp-interaction-mode))

  (evil-leader/set-key
    "i" 'helm-semantic-or-imenu
    ;; "t" 'neotree-find-project-root
    "t" 'my/open-org-file
    "b" 'ivy-switch-buffer
    ;; "f" 'counsel-projectile
    "f" 'counsel-fzf
    ;; "p" 'helm-projectile-switch-project ;; use SPC-p-p for alternative
    "r" 'helm-recentf
    "a" 'spacemacs/helm-project-do-rg-region-or-symbol
    "k" 'kill-buffer
    "m" 'bookmark-set
    "l" 'helm-bookmarks
    "d" 'bookmark-delete
    "w" 'wg-switch-to-workgroup
    "s" 'kid-star-dict
    "c" 'my/create-scratch-buffer
    "e" 'evil-execute-in-emacs-state
    "\\" 'er/expand-region
    "g" 'window-configuration-to-register
    "j" 'jump-to-register
    "y" 'prelude-copy-file-name-to-clipboard
    "n" 'my-search-note-md
    "h" 'helm-swoop
    "=" 'align-regexp
    ;; "m" 'maximize-window ;; use winner-redo/ winner-undo  default C-c <-/->
    ;; "gs" 'magit-status)
    )
  (setq magit-refresh-status-buffer nil)

  (setq neo-theme 'nerd)
  (setq neo-vc-integration '(face))

  ;; SPC p s helm-project-ag
  ;; (spacemacs/set-leader-keys "ps" 'helm-projectile-ag)

  ;; SPC p p switch projectile
  (spacemacs/declare-prefix "o" "my-fun")
  ;; (spacemacs/declare-prefix "og" "magit")
  ;; (spacemacs/declare-prefix "oc" "container")
  (spacemacs/declare-prefix "om" "my-utils")
  (spacemacs/declare-prefix "ok" "kill-utils")
  (spacemacs/declare-prefix "og" "git-utils")
  ;; (spacemacs/declare-prefix "ob" "bookmark")
  ;; (spacemacs/set-leader-keys "om" nil)
  ;; (spacemacs/set-leader-keys "oy" nil)
  ;; (spacemacs/set-leader-keys "ok" nil)
  ;; (spacemacs/declare-prefix "ob" "bookmarks")

  ;; (defun awesome-tab-switch-tab-with-current-group ()
  ;;   "Switch tab with current awesome-group"
  ;;   (interactive)
  ;;   (setq current-group-name (cdr (awesome-tab-selected-tab (awesome-tab-current-tabset t))))
  ;;   (ivy-read "tabs: "
  ;;             (mapcar #'buffer-name  (remove-if-not (lambda (buffer) (with-current-buffer buffer
  ;;                                                                      (string-equal current-group-name (cdr (awesome-tab-selected-tab (awesome-tab-current-tabset t)))))) (buffer-list)))
  ;;             :action '(1 ;; index (1 based) of the default action
  ;;                       ("s" (lambda (x)
  ;;                              (switch-to-buffer x)) "switch"))))

  (defun awesome-tab-switch-tab-with-current-group ()
    "Switch tab with current awesome-group"
    (interactive)
    (setq current-group-name (cdr (awesome-tab-selected-tab (awesome-tab-current-tabset t))))
    (ivy-read "Current group Tabs: "
              (mapcar #'buffer-name  (-filter (lambda (buffer) (with-current-buffer buffer
                                                             (string-equal current-group-name (awesome-tab-current-tabset)))) (buffer-list)))

              :preselect (buffer-name (other-buffer (current-buffer)))
              :action #'ivy--switch-buffer-action
              :caller 'awesome-tab-switch-tab-with-current-group))


  (spacemacs/set-leader-keys
    ;; C-k ivy-switch-buffer-kill  in ivy-switch-buffer
    ;; C-c C-o call ivy-occur and C-x C-q wget-mode in swiper
    ";" #'ivy-switch-buffer
    "[" 'my/aj-toggle-fold
    ;; "o;" #'awesome-tab-switch-tab-with-current-group
    ;; https://emacs.stackexchange.com/questions/14438/remove-hooks-for-specific-modes
    ;; "ox" #'my/kill-matching-buffers-rudely
    ;; "ock" #'kubernetes-overview
    ;; "ocd" #'docker
    "op" #'counsel-list-processes
    "oc" #'counsel-org-capture
    "omp" #'my/toggle-url-proxy
    "omm" #'counsel-mark-ring
    "omc" #'my/create-scratch-buffer
    ;; "omg" #'my/open-awesome-tab-group
    "omu" #'my/toggle-lsp-ui-mode
    "om]" #'my/toggle-hs-hide-all
    "om[" #'my/aj-toggle-fold
    ;; "oo" #'helm-mini
    "oo" #'neotree-toggle
    "on" #'my-search-note-md-helm-rg
    "og" #'spacemacs/search-project-auto-region-or-symbol
    "oj" #'awesome-tab-switch-tab-with-current-group
    ;; "of" #'helm-projectile-find-file-dwim
    ;; "of" #'counsel-projectile   ;; use <leader>pf
    "of" #'counsel-fzf
    "oy" #'counsel-yank-pop
    "oa" #'counsel-evil-marks
    ;; "os" #'swiper
    "oe" #'counsel-flycheck
    "omk" #'awesome-tab-kill-other-buffers-in-current-group
    ;; "omk" #'my/kill-matching-buffers-rudely
    "ok" #'kill-this-buffer
    "or" #'counsel-buffer-or-recentf
    ;; "oa" #'point-to-register
    ;; "obc" #'bookmark-set-no-overwrite
    "ob" #'counsel-bookmark
    "ot" #'lsp-treemacs-symbols
    ;; "ogl" #'magit-log-buffer-file
    ;; "ogf" #'counsel-git
    "ol" #'magit-log-buffer-file
    "oh" #'undo-tree-visualize
    ;; "ol" #'counsel-mark-ring
    ;; "o;" #'evil-switch-to-windows-last-buffer
    "oi" #'counsel-imenu
    ;; "op" #'counsel-projectile  ; pp
    ;; "oga" #'magit-log-all
    ;; "ogb" #'magit-log-buffer-file
    ;; ;; "ogd" #'ffip-show-diff
    ;; "ogd" #'magit-diff-working-tree
    ;; "ogs" #'magit-diff-staged
    ;; "ogu" #'magit-diff-unstaged
    "ow" #'awesome-tab-counsel-switch-group  ; workspace
    "od" #'youdao-dictionary-search-at-point-posframe
    ;; "o[" #'hide-region-hide
    ;; "o]" #'hide-region-unhide
  )


  ;; https://stackoverflow.com/questions/1587972/how-to-display-indentation-guides-in-emacs/4459159#4459159
  (defun my/aj-toggle-fold ()
    "Toggle fold all lines larger than indentation on current line"
    (interactive)
    (let ((col 1))
      (save-excursion
        (back-to-indentation)
        (setq col (+ 1 (current-column)))
        (set-selective-display
         (if selective-display nil (or col 1))))))

  (defun my/set-local-mark-ring()
    (interactive)
    (progn
      (call-interactively 'set-mark-command)
      (call-interactively 'keyboard-quit)
      )
    )

  (defun my/pop-local-mark-ring ()
    "Move cursor to last mark position of current buffer.
Call this repeatedly will cycle all positions in `mark-ring'.
URL `http://ergoemacs.org/emacs/emacs_jump_to_previous_position.html'
Version 2016-04-04"
    (interactive)
    (set-mark-command t))

  (setq global-mark-ring-max 6)
  (setq mark-ring-max 5)
  (global-set-key (kbd "<f7>") 'pop-global-mark)
  (global-set-key (kbd "<f6>") 'my/pop-local-mark-ring)
  (global-set-key (kbd "<f5>") 'my/set-local-mark-ring)
  ;; time-machine-transient-state

  (defun disable-y-or-n-p (orig-fun &rest args)
    (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
      (apply orig-fun args)))

  (advice-add 'ediff-quit :around #'disable-y-or-n-p)

  (with-eval-after-load 'neotree
    (define-key neotree-mode-map (kbd "C-w w") 'evil-window-next)
    (define-key neotree-mode-map (kbd "C-w l") 'evil-window-left)
    (define-key neotree-mode-map (kbd "C-w r") 'evil-window-right)
    (define-key neotree-mode-map (kbd "C-w C-w") 'evil-window-next)
    (define-key neotree-mode-map (kbd "o") 'neotree-expand-or-collapse))

  ;; fix tab or use za
  ;; https://emacs.stackexchange.com/questions/44244/assign-tab-in-markdown-mode
  (evil-define-key 'normal markdown-mode-map
    (kbd "<tab>") 'markdown-cycle)

  (with-eval-after-load 'markdown
    (define-key markdown-mode-map (kbd "C-c -") 'org-ctrl-c-minus)
    )

  ;; don't work
  ;; https://github.com/syl20bnr/spacemacs/issues/8221
  ;; https://qiita.com/itiut@github/items/4d74da2412a29ef59c3a
  (add-hook 'markdown-mode-hook
            (lambda ()
              (set (make-local-variable 'whitespace-action) nil)))
  ;; end

  (defun neotree-expand-or-collapse()
    "Expand or open a neotree node."
    (interactive)
    (when-let (node (neo-buffer--get-filename-current-line))
      (if (file-directory-p node)
          (if (neo-buffer--expanded-node-p node)
              (spacemacs/neotree-collapse)
            (spacemacs/neotree-expand-or-open))
            (spacemacs/neotree-expand-or-open))))

  ;; search note.md
  ;; (defun my-search-note-md-color-rg()
  ;;   ;; https://github.com/manateelazycat/color-rg
  ;;   (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/color-rg/"))
  ;;   (require 'color-rg)
  ;;   (evil-set-initial-state 'color-rg-mode 'emacs)
  ;;   (define-key color-rg-mode-map (kbd "<return>") 'switch-window)
  ;;   (interactive)
  ;;   (color-rg-search-input (color-rg-read-input) "~/develop/note.md/"))

  (defun my-search-note-md-helm-ag()
    (interactive)
    (counsel-ag "~/develop/note.md/" ))
    ;; (helm-do-ag "~/develop/note.md/" ))

  ;; (define-key counsel-ag-map (kbd "TAB") 'ivy-call)
  (defun my-search-note-md-helm-rg()
    (interactive)
    (counsel-rg nil "~/develop/note.md"))
    ;; (require 'helm-rg)
    ;; (setq helm-rg-default-directory "~/develop/note.md")
    ;; (call-interactively 'helm-rg)
    ;; (setq helm-rg-default-directory 'default))

  ;; setup the company
  (defun my-company-visible-and-explicit-action-p ()
    (and (company-tooltip-visible-p)
         (company-explicit-action-p)))

  (defun company-ac-setup ()
    "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
    (setq company-require-match nil)
    (setq company-auto-complete #'my-company-visible-and-explicit-action-p)
    (setq company-frontends '(company-echo-metadata-frontend
                              company-pseudo-tooltip-unless-just-one-frontend-with-delay
                              company-preview-frontend))

         (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
         (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle))
    ;; (define-key company-active-map (kbd "<tab>")  'company-select-next-if-tooltip-visible-or-complete-selection)
    ;; (define-key company-active-map (kbd "TAB") 'company-select-next-if-tooltip-visible-or-complete-selection))

  (with-eval-after-load 'company
    (company-ac-setup))


  ;; https://github.com/alexott/emacs-configs/blob/master/rc/emacs-rc-sdcv.el
  (defun kid-star-dict ()
    (interactive)
    (let ((begin (point-min))
          (end (point-max)))
      (if mark-active
          (setq begin (region-beginning)
                end (region-end))
        (save-excursion
          (backward-word)
          (mark-word)
          (setq begin (region-beginning)
                end (region-end))))
      (message "searching for %s ..." (buffer-substring begin end))
      (push 'escape unread-command-events)
      (call-process-shell-command (concat "say -v Alex "
                             (buffer-substring begin end)) nil 0)
      (message (shell-command-to-string
                     (concat "sdcv -n --utf8-output --utf8-input "
                             (buffer-substring begin end))))))

  ;; (setq-default evil-escape-key-sequence "jj")
  ;; (setq-default evil-escape-delay 0.2)

  (define-key evil-normal-state-map "\C-e" 'end-of-line)
  ;; (define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
  ;; (define-key evil-insert-state-map "\C-e" 'end-of-line)
  ;; ctrl-d  scroll window downwards in the buffer default in vim-insert-mode
  ;; (define-key evil-insert-state-map "\C-d" 'evil-delete-char)

  ;;  https://github.com/syl20bnr/spacemacs/issues/5471
  ;;  dotspacemacs-distinguish-gui-tab t
  (define-key evil-normal-state-map "\C-i" 'evil-jump-forward)

  ;; dotspacemacs-editing-style 'hybrid
  (define-key evil-hybrid-state-map "j" #'cofi/maybe-exit)
  (define-key evil-insert-state-map "j" #'cofi/maybe-exit)
  (evil-define-command cofi/maybe-exit ()
    :repeat change
    (interactive)
    (let ((modified (buffer-modified-p)))
      (insert "j")
      (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
                             nil 0.5)))
        (cond
         ((null evt) (message ""))
         ((and (integerp evt) (char-equal evt ?j))
          (delete-char -1)
          (set-buffer-modified-p modified)
          (push 'escape unread-command-events))
         (t (setq unread-command-events (append unread-command-events
                                                (list evt))))))))

  ;; (with-eval-after-load 'org
    ;; (setq org-indent-mode t))
    ;; (define-key org-mode-map (kbd "C-c C-k") (lambda () (interactive) (universal-argument) (call-interactively 'org-ctrl-c-ctrl-c)))
    ;; (define-key org-mode-map (kbd "C-c b") (lambda () (interactive) (let ((current-prefix-arg 4)) (call-interactively 'org-ctrl-c-ctrl-c))))
  ;; )


  ;; end
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "f0c98535db38af17e81e491a77251e198241346306a90c25eb982b57e687d7c0" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#3C3D37" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (yaml-mode ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby go-guru go-eldoc company-go go-mode lua-mode helm-dash dash-at-point powershell insert-shebang fish-mode company-shell evil-leader ein request-deferred websocket deferred docker tablist dockerfile-mode docker-tramp company-emacs-eclim eclim xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-web web-completion-data company-tern company-statistics company-anaconda company auto-yasnippet auto-dictionary ac-ispell auto-complete vmd-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode zenburn-theme tern ag mmm-mode markdown-toc markdown-mode gh-md web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl vimrc-mode dactyl-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(projectile-require-project-root nil)
 '(send-mail-function (quote mailclient-send-it))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(awesome-tab-ace-keys '(106 107 102 107 103 104 110 98 114 121 116))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "f0c98535db38af17e81e491a77251e198241346306a90c25eb982b57e687d7c0" default))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#3C3D37" t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(org-agenda-files
   '("~/develop/think.org/inbox.org" "~/develop/think.org/learn.org" "~/develop/think.org/index.org"))
 '(package-selected-packages
   '(plantuml-mode ivy-explorer evcxr-mode evcxr flycheck-grammarly lsp-ivy company-tabnine eshell-prompt-extras all-the-icons-gnus ivy-todo helm-gtags ggtags counsel-gtags yaml-mode ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby go-guru go-eldoc company-go go-mode lua-mode helm-dash dash-at-point powershell insert-shebang fish-mode company-shell evil-leader ein request-deferred websocket deferred docker tablist dockerfile-mode docker-tramp company-emacs-eclim eclim xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z esh-help diff-hl company-web web-completion-data company-tern company-statistics company-anaconda company auto-yasnippet auto-dictionary ac-ispell auto-complete vmd-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode zenburn-theme tern ag mmm-mode markdown-toc markdown-mode gh-md web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl vimrc-mode dactyl-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(projectile-require-project-root nil)
 '(safe-local-variable-values
   '((eval progn
           (pp-buffer)
           (indent-buffer))
     (flycheck-clang-include-path . "/usr/local/include/c++/v1/")
     (flycheck-gcc-include-path . "/usr/local/include")
     (flycheck-clang-include-path . "/usr/local/include")
     (checkdoc-minor-mode . t)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp)))
 '(send-mail-function 'mailclient-send-it)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F"))))
 '(lsp-ui-doc-background ((t (:background nil))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
 '(markdown-code-face ((t (:inherit nil)))))
)
