(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(desktop-save-mode t)
 '(display-battery-mode t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date nil)
 '(display-time-mode t)
 '(fringe-mode 0 nil (fringe))
 '(menu-bar-mode nil)
 '(network-speed-format-string " [%NI %AX %AB] ")
;; '(network-speed-interface-list (list "eth0" "eth1"))
 '(network-speed-interface-list (list "eth1"))
 '(network-speed-precision 1)
 '(network-speed-update-interval 2)
;; '(org-agenda-files (quote ("~/org/task_list.org")))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(w3m-session-load-last-sessions t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Slime setup.
;;(setq inferior-lisp-program "/usr/bin/clisp")
;;     (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
;;     (require 'slime)
;;     (slime-setup)

;; Ido setup. Currently disabled because I now use anything.el.
;;ido.el switching buffers and finding files.
;;(require 'ido)
;;(ido-mode t)


;; w3m text browser setup.
 (if (= emacs-major-version 23)
     (progn
       (add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")
       (require 'w3m-load))
   (require 'w3m))


;; Network speed meter setup.
;; http://linuxclues.blogspot.com/2010/01/show-network-speed-emacs-mode-line.html
;;network-speed configuration.
(add-to-list 'load-path "~/.emacs.d")
(require 'network-speed)
(network-speed-start)
;; to stop network-speed, call "network-speed-stop" function.
;; (network-speed-stop)


;; eap music play list setup.
;; eap configuration
;; (add-to-list 'load-path "~/.emacs.d")
;; (setq eap-music-library    "~/Music"
;;       eap-playlist-library    "~/eap-playlists")
;; (require 'eap-autoloads)


;; Auto-complete.el setup.
;;(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
;; There is a bug and auto-complete changes cursor color, so we set it up again.
(set-cursor-color "white") ;; I like white letters on a black background.


;;Anything.el setup.
;; Anything.el
(add-to-list 'load-path "~/.emacs.d/anything-config/")
(add-to-list 'load-path "~/.emacs.d/anything-config/extensions/")
(require 'anything-startup)

;;create a custom my-anything function.
(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers
     anything-c-source-file-name-history
     anything-c-source-info-pages
     anything-c-source-info-elisp
     anything-c-source-man-pages
     anything-c-source-locate
     anything-c-source-emacs-commands)
   " *my-anything*"))

;;search for emacs commands. 
(defun my-anything-execute-extended-command ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-emacs-commands)
   " *command*"))

;;search for anything related to the word pointed at cursor.
(defun rgr/anything ()
  "default to thing at point for anything"
  (interactive)
  (anything nil (word-at-point)))

;;help anything at point.
(defun help-anything-at-point ()
  "default to thing at point for anything"
  (interactive)
;; (&optional sources input prompt resume preselect buffer keymap).
  (anything '(anything-c-source-info-pages
       anything-c-source-info-elisp
       anything-c-source-man-pages)
     (word-at-point)
     nil
     nil
     nil
     "*help-anything-at-point*"
     nil))

;;Search for help using anything buffer.
(defun help-anything ()
  "Show info, man and elisp pages."
  (interactive)
;; (&optional sources input prompt resume preselect buffer keymap).
  (anything-other-buffer '(anything-c-source-info-pages
      anything-c-source-info-elisp
      anything-c-source-man-pages)
    "*help-anything*"))

;;Set anything functions in global keymap.
(global-set-key (kbd "<f12>") 'help-anything)
(global-set-key (kbd "M-x") 'anything-execute-extended-command)
(global-set-key (kbd "<f9>") 'help-anything-at-point)
(global-set-key (kbd "C-ñ") 'anything)
;; (global-set-key (kbd "C-x C-f") 'anything-find-files)


;; Load nxhtml (edit php, html, using severals modes at once.)
(load "/home/vicente/.emacs.d/nxhtml/autostart.el")


;; Some settings for shell console within emacs.
(put 'upcase-region 'disabled nil)

;; deleting ^M characters in M-x shell
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; deleting ls and gcc garbage characters in M-x shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; Org-mode setup. From http:///worg/org-tutorials/orgtutorial_dto.php
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Setting up fonts.
;; overdrive zooming keybindings.
;; Firefox-like zooming of fonts.
;; ZOOM KEYBINDINGS
;; C-+ zoom in
;; C-- zoom out
;; C-0 zoom reset

(setq default-font-zoom-index 8) ;; I set default for 14 in other machine.
(setq font-zoom-index default-font-zoom-index)

;; font list.
(setq font-zoom-list
      (list "-*-fixed-*-*-*-*-13-*-*-*-*-*-*-*"
     "-*-lucida-medium-r-*-*-14-*-*-*-*-iso8859-*"
     "-*-fixed-*-*-*-*-14-*-*-*-*-*-*-*"
     "-*-new century schoolbook-medium-r-*-*-14-*-*-*-*-iso8859-*"
     "-*-fixed-*-*-*-*-17-*-*-*-*-*-*-*"
     "-*-times-medium-r-*-*-17-*-*-*-*-iso8859-*"
     "-*-new century schoolbook-medium-r-*-*-17-*-*-*-*-iso8859-*"
     "-*-lucida-medium-r-*-*-18-*-*-*-*-iso8859-*"
     "-*-fixed-*-*-*-*-18-*-*-*-*-*-*-*"
     "-*-helvetica-medium-r-*-*-18-*-*-*-*-iso8859-*"
     "-*-new century schoolbook-medium-r-*-*-18-*-*-*-*-iso8859-*"
     "-*-times-medium-r-*-*-18-*-*-*-*-iso8859-*"
     "-*-times-medium-r-*-*-20-*-*-*-*-iso8859-*"
     "-*-new century schoolbook-medium-r-*-*-20-*-*-*-*-iso8859-*"
     "-*-fixed-*-*-*-*-20-*-*-*-*-*-*-*"
     "-*-courier-medium-r-*-*-20-*-*-*-*-iso8859-*"
     "-*-helvetica-medium-r-*-*-20-*-*-*-*-iso8859-*"
     "-*-courier-medium-r-*-*-24-*-*-*-*-iso8859-*"
     "-*-helvetica-medium-r-*-*-24-*-*-*-*-iso8859-*"
     "-*-times-medium-r-*-*-24-*-*-*-*-iso8859-*"
     "-*-new century schoolbook-medium-r-*-*-24-*-*-*-*-iso8859-*"
     "-*-courier-medium-r-*-*-25-*-*-*-*-iso8859-*"
     "-*-helvetica-medium-r-*-*-25-*-*-*-*-iso8859-*"
     "-*-times-medium-r-*-*-25-*-*-*-*-iso8859-*"
     "-*-new century schoolbook-medium-r-*-*-25-*-*-*-*-iso8859-*"
     "-*-helvetica-medium-r-*-*-34-*-*-*-*-iso8859-*"
     "-*-times-medium-r-*-*-34-*-*-*-*-iso8859-*"
     "-*-new century schoolbook-medium-r-*-*-34-*-*-*-*-iso8859-*"
     ))


;; Increase font size. 
(defun font-zoom-increase-font-size ()
  (interactive)
  (progn
    (setq font-zoom-index (min (- (length font-zoom-list) 1)
          (+ font-zoom-index 1)))
    (set-frame-font (nth font-zoom-index font-zoom-list))
    (message "font: %s" (nth font-zoom-index font-zoom-list))))

;; Decrease font size.
(defun font-zoom-decrease-font-size ()
  (interactive)
  (progn
    (setq font-zoom-index (max 0
          (- font-zoom-index 1)))
    (set-frame-font (nth font-zoom-index font-zoom-list))
    (message "font: %s" (nth font-zoom-index font-zoom-list))))

;; Reset font size:
(defun font-zoom-reset-font-size ()
  (interactive)
  (progn
    (setq font-zoom-index default-font-zoom-index)
    (set-frame-font (nth font-zoom-index font-zoom-list))
    (message "font: %s" (nth font-zoom-index font-zoom-list))))

;; Set several global keymap shortcuts.
(define-key global-map (read-kbd-macro "C--") 'font-zoom-decrease-font-size)
(define-key global-map (read-kbd-macro "C-+") 'font-zoom-increase-font-size)
(define-key global-map (read-kbd-macro "C-0") 'font-zoom-reset-font-size)

;; Load default font at starting time.
(font-zoom-reset-font-size)


;; ERC logging.
(setq erc-log-channels-directory "~/erc_logs/")
(setq erc-save-buffer-on-part t)
(setq erc-log-insert-log-on-open nil)
;; Save logs when exitting emacs.
(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
  (save-some-buffers t (lambda () (when (eq major-mode 'erc-mode) t))))


;; Function that shows absolute name of the file</b> attached to current buffer.
(defun show-file-name (&optional buffer)
  (interactive)
  (let ((file (buffer-file-name buffer)))
    (if file
 (message (expand-file-name file))
         (error "No file."))))


;; Setting foreground and background color functions.
(defun black-on-white ()
  (interactive)
  (set-background-color "white")
  (set-foreground-color "black"))

(defun white-on-black ()
  (interactive)
  (set-background-color "black")
  (set-foreground-color "white"))

;;; Create a black on white frame for w3m
(defun make-w3m-frame ()
  (interactive)
  (select-frame (make-frame))
  (black-on-white)
  (w3m))

(white-on-black)  ;; I like white letters on a black background.


;; Create trivial modes and asociate them with some file extension.
;; Each trivial mode launches an application command when activated.
;; It is not suitable to open big files.
;; Associate file name patterns to applications which will be executed when opening the file.
(defun define-trivial-mode(mode-prefix file-regexp &optional command)
  (or command (setq command mode-prefix))
  (let ((mode-command (intern (concat mode-prefix "-mode"))))
    (fset mode-command
          `(lambda ()
             (interactive)
             (toggle-read-only t)
      (start-process ,mode-prefix nil
       ,command (buffer-file-name))
      (let ((obuf (other-buffer (current-buffer) t)) ;; Select correct buffer
     (kbuf (current-buffer)))
        (set-buffer obuf)       ;; set it as current
        (kill-buffer kbuf))))       ;; kill temporary buffer
    (add-to-list 'auto-mode-alist (cons file-regexp mode-command))))

(define-trivial-mode "ghostview" "\\.ps$")
(define-trivial-mode "xpdf" "\\.pdf$")
(define-trivial-mode "amp" "\\.mp3$")
(define-trivial-mode "oowriter" "\\.doc$")


;; Customize dired mode. Asociate some commands to file extensions and execute them.
;; Thanks to davazp.

(require 'dired)

;;; Dired actions

(defvar dired-action-alist nil
  "List of user-defined dired actions.")

(defun dired-add-action (regex command)
  "Add a new action for files match with REGEX. COMMAND could be
a function designator, which be called without arguments, or a
STRING with the path of a external executable."
  (add-to-list 'dired-action-alist (cons regex command)))

(defun dired-do-action (prefix)
  "Launch the defined action for the current file."
  (interactive "p")
  (let* ((filename (dired-get-filename)))
    (dolist (entry dired-action-alist)
      (when (string-match (car entry) (file-name-nondirectory filename))
        (cond
          ((stringp (cdr entry))
           (start-process (cdr entry) nil (cdr entry) filename))
          ((symbolp (cdr entry))
           (funcall (symbol-function (cdr entry))))
          ((functionp (cdr entry))
           (funcall (cdr entry))))
        (return)))))

(define-key dired-mode-map (kbd "C-c C-c") 'dired-do-action)

;;; User-defined actions

(defun dired-action-configure ()
  (compile "./configure")
  (pop-to-buffer "*compilation*"))

(defun dired-action-configure-ac ()
  (shell-command "autoconf"))

(defun dired-action-html ()
  (w3m-find-file (dired-filename-at-point)))

(defun dired-action-makefile ()
  (compile "make -k")
  (pop-to-buffer "*compilation*"))

(dired-add-action "^configure$"       'dired-action-configure)
(dired-add-action "^configure\\.ac$"  'dired-action-configure-ac)
(dired-add-action "\\.html$"          'dired-action-html)
(dired-add-action "^Makefile$"        'dired-action-makefile)

;;; External launchers

;;; TODO add arguments to commands.
(dired-add-action "\\.pdf$" "xpdf")
(dired-add-action "\\.flv$" "mnv")
(dired-add-action "\\.mp3$" "mnv")
(dired-add-action "\\.avi$" "amp")
(dired-add-action "\\.mpeg$" "amp")
(dired-add-action "\\.djvu$" "djview")
(dired-add-action "\\.mpg$" "amp")
(dired-add-action "\\.chm$" "xchm")


;; Functions that launch external processes.
;; Shell command that runs in background mode.
(defun shell-command-background (command)
  (interactive "sbackground command: ")
  (let ((background-command (concat command " &")))
    (message "com: %s" background-command)
    (shell-command background-command)))
 
(define-key global-map (read-kbd-macro "M-\"") 'shell-command-background)

;; Another function to launch an external background shell process.
(defun start-process-shell (command)
  (interactive "scommand: ")
  (let ((shell-command command))
    (let ((output-buffer (generate-new-buffer shell-command)))
      (start-process "background process" output-buffer "/bin/sh" "-c" shell-command)
      (switch-to-buffer output-buffer))))
  
;; <f5> is used by anything.el
;;(define-key global-map (read-kbd-macro "<f5>") 'start-process-shell)

;; Execute shell command in background when in dired mode.
(defun dired-shell-command-background (command)
  (interactive "s& command: ")
  (let ((background-command (concat command " \"" (dired-get-filename) "\""))) 
    (shell-command-background background-command)))

(define-key dired-mode-map (kbd "W") 'dired-shell-command-background)


;; Start shell process in background (in dired mode).
(defun dired-start-process (command)
  (interactive "scommand: ")
  (let ((shell-command (concat command " '" (dired-get-filename) "'")))
    (let ((output-buffer (generate-new-buffer shell-command)))
      (start-process "background process" output-buffer "/bin/sh" "-c" shell-command)
      (switch-to-buffer output-buffer))))

(defun dired-start-process-without-buffer (command)
  (interactive "scommand: ")
;;  (let ((shell-command (concat command " '" (dired-get-filename) "'")))
    (let ((shell-command (concat command " \"" (dired-get-filename) "\"")))
    (start-process "background process" nil "/bin/sh" "-c" shell-command)
    (message "com: %s" shell-command)))

(defun dired-start-mplayer-process-without-buffer ()
  (interactive)
;;  (let ((shell-command (concat "mplayer -vo x11 -framedrop -fs -zoom" " '" (dired-get-filename) "'")))
;;  (let ((shell-command (concat "mplayer -vo xv -framedrop -fs -zoom" " '" (dired-get-filename) "'")))
  (let ((shell-command (concat "mplayer -vo xv -framedrop -fs -zoom" " \"" (dired-get-filename) "\"")))
    (start-process "background process" nil "/bin/sh" "-c" shell-command)
    (message "com: %s" shell-command)))

(defun dired-start-mplayer-novideo-process-without-buffer ()
  (interactive)
;;  (let ((shell-command (concat "mplayer -vo x11 -framedrop -fs -zoom" " '" (dired-get-filename) "'")))
;;  (let ((shell-command (concat "mplayer -vo xv -framedrop -fs -zoom" " '" (dired-get-filename) "'")))
  (let ((shell-command (concat "mplayer -novideo -framedrop" " \"" (dired-get-filename) "\"")))
    (start-process "background process" nil "/bin/sh" "-c" shell-command)
    (message "com: %s" shell-command)))


(define-key dired-mode-map (kbd "E") 'dired-start-process)
(define-key dired-mode-map (kbd "F") 'dired-start-process-without-buffer)
(define-key dired-mode-map (kbd "V") 'dired-start-mplayer-process-without-buffer)
(define-key dired-mode-map (kbd "N") 'dired-start-mplayer-novideo-process-without-buffer)


;; Set environment variable.
;; Set an environment variable.
(setenv "DISPLAY" ":0.0")


;; Show size of current mounted partitions.
(defun df-shell-command ()
  "Executes df -h shell command"
  (interactive)
  (shell-command "df -h"))

(define-key global-map (kbd "<f7>") 'df-shell-command)


;; Check spelling and style of the current buffer.
(define-key global-map (kbd "<f8>") 'checkdoc-ispell-current-buffer)


;; Show all running processes in a tree.
;; Creates a buffer with a process tree in it.
(defun list-process-tree ()
  (interactive)
  (let ((output-buffer (generate-new-buffer "pstree")))
  (call-process "pstree" nil output-buffer nil "-a")
  ;;(start-process "pstree" output-buffer "pstree" "-a")
  (switch-to-buffer output-buffer)
  (view-mode t)
  (View-goto-line 1)))

(define-key global-map (read-kbd-macro "<f6>") 'list-process-tree)


;; Launch top application.
;; This does not work very well in my emacs ansi terminal.
(defun top-process ()
  (interactive)
  (ansi-term "top" "top"))

;;(define-key global-map (read-kbd-macro "<f10>") 'top-process)


;; Search for words using dict.
;; Search a definition using dict.
(defun dict-search-word-at-point ()
  (interactive)
  (let ((dict-word (word-at-point)))
    (let ((output-buffer (generate-new-buffer (concat "dict: " dict-word))))
    (start-process (concat "dict: " dict-word) output-buffer "dict" dict-word)
    (switch-to-buffer output-buffer))))

(defun dict-search-word-at-point-sync ()
  (interactive)
  (let ((dict-word (word-at-point)))
    (if (eq dict-word nil)
 (message "Set the point over a word to search for.")
      (progn 
 (let ((output-buffer (generate-new-buffer (concat "dict: " dict-word))))
   (call-process "dict" nil output-buffer nil dict-word)
   (switch-to-buffer output-buffer)
   (view-mode t)
   (View-goto-line 1))))))


(define-key global-map (read-kbd-macro "<f11>") 'dict-search-word-at-point-sync)

(defun dict-search-word (dict-word)
  (interactive "sWord: ")
  (let ((output-buffer (generate-new-buffer (concat "dict: " dict-word))))
    (start-process (concat "dict: " dict-word) output-buffer "dict" dict-word)
    (switch-to-buffer output-buffer)))

(defun dict-search-word-sync (dict-word)
  (interactive "sWord: ")
  (if (eq dict-word nil)
      (message "Set the point over a word to search for.")
    (progn 
      (let ((output-buffer (generate-new-buffer (concat "dict: " dict-word))))
 (call-process "dict" nil output-buffer nil dict-word)
 (switch-to-buffer output-buffer)
 (view-mode t)
 (View-goto-line 1)))))


;; Function that overwrites a file with zeroes.
(defun zero-fill ()
  "This function fills with zeroes the whole file selected in dired line."
  (interactive)
  (let* ((filename (dired-get-filename))
 arguments
 size)
    (with-temp-buffer
      (message "filename: %s" filename)
      (if (or (file-symlink-p filename) (file-directory-p filename))
   (message "Error: %s is a symlink or a directory." filename)
 (shell-command (concat "/bin/ls -s --block-size=1K \"" filename "\"") (current-buffer))
 (beginning-of-buffer)
 (cond 
  ((re-search-forward "^\\([0-9]+\\)" (point-max) t)
   (setq size (match-string 1))
   (setq arguments (concat "dd if=/dev/zero of=\"" filename "\" bs=1K count=" size))
   (message "arguments:%s" arguments)
   (start-process "zero-fill-process" nil "/bin/sh" "-c" arguments))
  (t
   (message "Error seeking for: %s" filename)))))))


