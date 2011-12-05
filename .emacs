; Note to students:
; This is a collection of emacs definitions and bindings that you might
; find useful.  If you want to edit this, I advise you to copy this file
; to a safe place before doing so, in case you make matters worse.

; If you don't want any of this, you can just rename the file and
; be completely without any customization or initialization.  You may not
; like emacs that way, but you might, too.

; You can customize emacs with a (somewhat tedious?) GUI interface
; called "customize".  You get it by typing
;      Alt-x customize <return>

; You can get an emacs tutorial by typing
;      ^H^Ht     (i.e., Control-H Control-H t)



; Good luck
; Jim Diamond


; Last updated Sept 23, 2008.


; -------------------------- My functions ----------------------------------

(defun
    beginning-of-buffer-leave-mark ()
    "Move point to end of buffer, but don't destoy the user's current mark."
    (interactive)
    (goto-char (point-min))
)
			
(defun
    copy-entire-line (num)
    "Copy one or more lines into the kill ring."
    (interactive "p")
    (beginning-of-line)
    (let ((beg (point)))
	(forward-line num)
	(copy-region-as-kill beg (point))
    )
)

(defun
    count-how-many (regexp)
    "Return the number of matches for REGEXP following point."
    (interactive (list (read-from-minibuffer
			"How many matches for (regexp): "
			nil nil nil 'regexp-history))
    )
    (let ((count 0) opoint)
	(save-excursion
	    (while (and (not (eobp))
			(progn (setq opoint (point))
			       (re-search-forward regexp nil t)))
		(if (= opoint (point))
			(forward-char 1)
		    (setq count (1+ count))))
	    count
	)
    )
)


(defun
    cycle-frame (arg)
  "Select the ARG'th different visible frame, raise it, and warp the mouse.
See documentation for other-frame."
;; It moves the mouse to the upper right corner of the selected frame.
;; If you want it somewhere else you'll need to change "(frame-width) 0".
  (interactive "p")
  (other-frame arg)
      (set-mouse-position (selected-frame) (frame-width) 0)
      (unfocus-frame)
)

(defun
    debug-msg (string wait)
    "Print STRING in the minbuffer and sit-for WAIT seconds."
    (message string)
    (sit-for wait)
)

(defun
    end-of-buffer-leave-mark ()
    "Move point to end of buffer, but don't destoy the user's current mark."
    (interactive)
    (goto-char (point-max))
)

(defun
    forward-to-char (arg char)
    "Move forward to ARG'th occurrence of CHAR.
    Goes backward if ARG is negative."
    (interactive "p\ncForward to char: ")
    (search-forward (char-to-string char) nil nil arg)
)

(defun
    goto-percent (percent)
    "Move point to a given percent in the file."
    (interactive "NGoto percent: ")
    (if (= percent 0)
	(goto-char (point-min))
	(goto-char (+ (/ (* (buffer-size) percent) 100) 1))
    )
)

(defun
    goto-window-bottom ()
    "Go to the last line of the current window."
    (interactive)
    (move-to-window-line -1)
)

(defun
    goto-window-top ()
    "Go to the first line of the current window."
    (interactive)
    (move-to-window-line 0)
)

(defun
    match-paren (arg)
    "Go to the matching parenthesis if on parenthesis otherwise insert %.
This works for the [] {} and () pairs."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	  ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	  (t (self-insert-command (or arg 1)))))

(defun
    my-capitalize-word (count)
    "Capitalize the first letter of the word which point is on."
    (interactive "*p")
    (if (looking-at "[A-Za-z]")
	(progn
	    (forward-char 1)
	    (re-search-backward "\\<")
	)
    )
    (capitalize-word count)
)

(defun
    my-downcase-word (count)
    "Downcase the whole word, even if point is in the middle of the word."
    (interactive "*p")
    (if (looking-at "[A-Za-z]")
	(progn
	    (forward-char 1)
	    (re-search-backward "\\<")
	)
    )
    (downcase-word count)
)

(defun
    my-find-file ()
    "Combine the best parts of find-file and find-file-other-window."
    (interactive)
    (if (equal (buffer-name) "*scratch*")
	(call-interactively 'find-file)
	(call-interactively 'find-file-other-window)
    )
)

(defun
    my-upcase-word (count)
    "Upcase the whole word, even if point is in the middle of the word."
    (interactive "*p")
    (if (looking-at "[A-Za-z]")
	(progn
	    (forward-char 1)
	    (re-search-backward "\\<")
	)
    )
    (upcase-word count)
)

(defun
    my-c-ish-mode-hook ()
    "Set up C-ish modes as I like them!"
    ;; By default this is c-submit-bug-report.
    (define-key c-mode-base-map "\C-c\C-b"
				'(lambda ()
				     "Compile without asking for confirmation"
				     (interactive)
				     (setq compilation-read-command nil)
				     (compile "make -k")))
    (defun my-c-half-indent-up (langelem)
	(- c-basic-offset (my-c-half-indent-down langelem)))
    (defun my-c-half-indent-down (langelem) (/ c-basic-offset 2))
    (c-add-style "my-c"
	'((c-basic-offset . 4)
	  (c-comment-only-line-offset . 0)
	  (c-offsets-alist . ((statement-case-intro . my-c-half-indent-down)
			      (case-label . my-c-half-indent-up)
			      (inline-open . 0)
			      (substatement-open . 0)
			     )
	  )
	)
    )
    (c-set-style "my-c")
)


(defun
    my-text-mode-hook ()
    "Set up text mode as I like it!"
    (setq	require-final-newline	t)
    (local-set-key "\^Cs"	'ispell-buffer)
    (auto-fill-mode 1)
)


(defun
    open-line-above (prefix)
    "Open one or more lines above the current one"
    (interactive "*p")
    (beginning-of-line)
    (open-line prefix)
)


(defun
    open-line-below ()
    "Open a line below the current one,
    maintaining the indentation over blank lines,
    but without leaving spurious white space in the buffer."
    (interactive "*")
    (end-of-line)
    ; Don't split the current line if in auto-fill-mode
    (if auto-fill-function
	(progn
	    (auto-fill-mode 0)	; turn off auto-fill
	    (newline)
	    (auto-fill-mode 1)	; and back on
	)
	(newline)
    )
    (previous-line 1)
    (beginning-of-line)
    (re-search-forward "[\t ]*")
    (let ((temp (current-column)))
	(next-line 1)
	(indent-to temp)
    )
    (save-excursion
	(previous-line 1)
	(end-of-line)
	(delete-horizontal-space)
    )
)

(defun
    scroll-backward-a-line (num)
    "Scroll towards the start of the buffer by NUM (default 1) line(s)."
    (interactive "p")
    (scroll-down num)
)

(defun
    scroll-forward-a-line (num)
    "Scroll towards the end of the buffer by NUM (default 1) line(s)."
    (interactive "p")
    (scroll-up num)
)

(defun
    scroll-completions-down (&optional arg)
    "Scroll the completions window of minibuffer selections."
    (interactive "p")
    (save-excursion
	(let ((currwin (selected-window))
	      (compwin (get-buffer-window "*Completions*")))
	    (if compwin
		(unwind-protect
		    (progn
			(select-window compwin)
			(call-interactively 'scroll-down)
		    )
		    (select-window currwin)
		)
	    )
	)
    )
)

(defun
    scroll-completions-up (&optional arg)
    "Scroll the completions window of minibuffer selections."
    (interactive "p")
    (save-excursion
	(let ((currwin (selected-window))
	      (compwin (get-buffer-window "*Completions*")))
	    (if compwin
		    (unwind-protect
			    (progn
				(select-window compwin)
				(call-interactively 'scroll-up)
			    )
			(select-window currwin)
		    )
	    )
	)
    )
)

(defun
    my-transpose-chars (arg)
    "Interchange characters before point.
With prefix arg ARG, effect is to take character before point
and drag it forward past ARG other characters (backward if ARG negative)."
    (interactive "*P")
    (and (null arg) (forward-char -1))
    (transpose-subr 'forward-char (prefix-numeric-value arg))
)

(defun
    undo-multiple ()
    "Allow the user to do multiple undo's under space-bar control.
	Any other character ends the undo-ing.
	If that char is not <CR>, it is executed."
    (interactive "*")
    (let ((c 0))
	(undo-start)
	(undo-more 2)		; Why does the first undo-more do zippo?
	(while
	    (progn
		(message "Hit <space> to undo more")
		(= (setq c (read-char)) ? )
	    )
	    (undo-more 1)
	)
	(message "Finished undoing.")
	(if (not (= c ?\^M))
	    (setq unread-command-events (list c))
	)
    )
)

;---------------------- End of my functions ---------------------------



; ----------------------- X-window stuff ------------------------------

(if (eq window-system 'x)
  (progn

    (if (x-display-color-p)
	(progn	      ;;; for colour x display
	    (set-face-background 'region "cyan")
	    (set-face-foreground 'region "black")
	    (set-face-background 'modeline "#350042")
	    (set-face-foreground 'modeline "green")
	    (set-face-background 'highlight "black")

	    ;; Turn the cursor red when in overwrite mode
	    (add-hook 'post-command-hook
		      (defun overwrite-mode-post-command-hook ()
			  (set-cursor-color
			       (if overwrite-mode "red" "green")
			  )
		      )
	    )

	    ;; font-lock-mode ("colourization") code
	    (require 'font-lock)
	    (require 'cc-mode)
	    (setq c-font-lock-keywords c-font-lock-keywords-2)
	    (setq c++-font-lock-keywords c++-font-lock-keywords-2)

	)
	(progn		;;; for mono x display
	    (set-face-background 'region "Black")
	    (set-face-foreground 'region "White")
	)
    )

    (setq search-highlight t)			;; Hi-light search string
    (setq frame-title-format "%b --- %f")	;; title is buffer --- file

    ; Num lock, / and * currently not mapped to anything except themselves
    (global-set-key	[kp-subtract]	'other-window)

    (global-set-key	[kp-7]		'ediff-buffers)
    (global-set-key	[kp-home]	'ediff-buffers)
    (global-set-key	[kp-8]		'delete-horizontal-space)
    (global-set-key	[kp-up]		'delete-horizontal-space)
    (global-set-key	[kp-9]		'quoted-insert)
    (global-set-key	[kp-prior]	'quoted-insert)

    (global-set-key	[kp-4]		'describe-key)
    (global-set-key	[kp-left]	'describe-key)
    (global-set-key	[kp-5]		'apropos)
    (global-set-key	[kp-begin]	'apropos)
    (global-set-key	[kp-6]		'compare-windows)
    (global-set-key	[kp-right]	'compare-windows)
    (global-set-key	[kp-add]	'repeat-complex-command)

    (global-set-key	[kp-1]		'ispell-word)
    (global-set-key	[kp-end]	'ispell-word)
    (global-set-key	[kp-2]		'delete-char)
    (global-set-key	[kp-down]	'delete-char)
    (global-set-key	[kp-3]		'set-variable)
    (global-set-key	[kp-next]	'set-variable)

    (global-set-key	[kp-0]		'set-fill-prefix)
    (global-set-key	[kp-insert]	'set-fill-prefix)
    (global-set-key	[kp-decimal]	'set-mark-command)
    (global-set-key	[kp-delete]	'set-mark-command)
    (global-set-key	[kp-enter]	'ispell-buffer)
  )

; ----------------------- tty stuff -----------------------------------
    ; Turn on meta-key functionality
    (set-input-mode nil nil t)
)

;------------------------- My preferences ----------------------------

;(menu-bar-mode -1)				;; No menus for me!
;(if (featurep 'tool-bar) (tool-bar-mode 0))
(setq	inhibit-startup-message t)
(setq	default-major-mode	'text-mode)

; If the following is not set, then undesirable behavious occurs
; when you edit a file which has more than one link.  That is,
; the other links now point at the old file, instead of the new one.
(setq	backup-by-copying-when-linked	t)

; If you don't have this set, if you edit a file which is under RCS version
; control, you don't get a backup file.
(setq	vc-make-backup-files t)

; If you don't set the following, when you try to save a file with a
; non-ASCII char in it, emacs prompts you for a coding type.  What a PITA.
(prefer-coding-system 'latin-1)

(add-hook 'csh-mode-hook	'auto-fill-mode)
(add-hook 'expect-mode-hook	'auto-fill-mode)
(add-hook 'java-mode-hook	'my-c-ish-mode-hook)
(add-hook 'c++-mode-hook	'my-c-ish-mode-hook)
(add-hook 'c-mode-hook		'my-c-ish-mode-hook)
(add-hook 'perl-mode-hook	'my-perl-mode-hook)
(add-hook 'sh-mode-hook		'auto-fill-mode)
(add-hook 'text-mode-hook	'my-text-mode-hook)

; Note to students:
; You can uncomment this and modify it if you know what you
; are doing.  Otherwise, you had better leave it until you do.
;(setq auto-mode-alist
;     '(
;	  ("\\.C$"    . c++-mode)
;	  ("\\.java$" . java-mode)
;	  ("\\.tex$"  . tex-mode)
;	  ("\\.sty$"  . tex-mode)
;	  ("\\.el$"   . emacs-lisp-mode)
;	  ("\\.emacs$"   . emacs-lisp-mode)
;	  ("\\.gz$"     "zcat")
;	  ("\\.Z$"      "zcat")
;	  ("\\.f$"    . fortran-mode)
;	  ("\\.for$"  . fortran-mode)
;	  ("\\.l$"    . lisp-mode)
;	  ("\\.lisp$" . lisp-mode)
;	  ("[Mm]akefile" . makefile-mode)
;	  ("\\.cshrc"   . csh-mode)
;	  ("\\.login"   . csh-mode)
;	  ("\\.pl$"   . perl-mode)
;	  ("\\.fvwm.*rc$" . fvwm-mode)
;	  ("\\.idl$"  . idl-mode)
;	  ("" . choose-mode-first-line)
;     )
;)

(autoload 'artist-mode "artist" "Enter artist-mode" t)
(autoload 'flyspell-mode "flyspell" "On-the-fly ispell." t)

; How about this for a mode line?
(setq default-mode-line-format
  (list ""
   'mode-line-modified
   "%11b "
   'global-mode-string
   " %[("
   'mode-name 'mode-line-process 'minor-mode-alist "%n"
   ")%] <"
   '(column-number-mode "%c;")
   '(line-number-mode "%l:")
   '(-3 . "%p")			; Percent at top line in window
   ":"
   '(-3 . "%P")			; Percent at bottom line in window
   ">  %f"
  )
)

(setq mode-line-format default-mode-line-format)

; ----------------------- My key bindings ----------------------------

(global-set-key	  "\^O"		'open-line-above)
(global-set-key	  "\^M"		'open-line-below)

(setq		  search-exit-char	?\^M) ; default is ESC
(global-set-key	  "\^S"		'isearch-forward-regexp)
(global-set-key	  "\^R"		'isearch-backward-regexp)
(global-set-key	  "\e\^S"	'isearch-forward)
(global-set-key	  "\e\^R"	'isearch-backward)
(global-set-key	  "\^Xf"	'forward-to-char)

(global-set-key	  "\^W"		'backward-kill-word) ; like tty driver
(global-set-key	  "\e\^?"	'kill-region) ; what ^W used to be

;(global-set-key	  "\^X\^B"	'buffer-menu)
(global-set-key	  "\C-x\C-b"	'(lambda ()
				     (interactive) (electric-buffer-list t)))

(global-set-key	  "\^X\^V"	'my-find-file)

(global-set-key	  "\^Z"		'scroll-forward-a-line)
(global-set-key	  "\ez"		'scroll-backward-a-line)

;; Make the % key jump to the matching {}[]() of one another.
(global-set-key	  "%"		'match-paren)
(global-set-key	  "\eg"		'goto-line)
(global-set-key	  "\ep"		'goto-percent)
(global-set-key	  "\e#"		'what-line)

(global-set-key	  "\^X,"	'goto-window-top)
(global-set-key	  "\^X."	'goto-window-bottom)
(global-set-key	  "\^XT"	'transpose-windows)
(global-set-key	  "\^T"		'my-transpose-chars)
(global-set-key	  "\^C,"	'beginning-of-buffer-leave-mark)
(global-set-key	  "\^C."	'end-of-buffer-leave-mark)

(global-set-key	  "\ec"		'my-capitalize-word)
(global-set-key	  "\el"		'my-downcase-word)
(global-set-key	  "\eu"		'my-upcase-word)
(global-set-key	  "\^Q"		'query-replace-regexp)
(global-set-key	  "\^Xc"	'copy-entire-line)
(global-set-key	  "\^X\^Q"	'quoted-insert)
(global-set-key	  "\^X\^U"	'undo-multiple)
(global-set-key	  "\^Xz"	'zap-to-char)	; at ESC z by default

;; Wheel mouse definitions.
(global-set-key	  [down-mouse-4] 'previous-line)
(global-set-key	  [down-mouse-5] 'next-line)
(global-set-key	  [mouse-5] (lambda () (interactive)))
(global-set-key	  [mouse-4] (lambda () (interactive)))

(global-set-key	  [f1]		'cycle-frame)
(global-set-key	  [f2]		'other-window)
(global-set-key	  [f3]		'yank)
(global-set-key	  [f4]		'bury-buffer)
(global-set-key	  [(shift f4)]	(lambda () (interactive)
			        (switch-to-buffer (car (last (buffer-list))))))
(global-set-key	  [C-tab]	(function
				 (lambda () (interactive) (insert "\t"))))

(define-key minibuffer-local-completion-map "\C-v" 'scroll-completions-up)
(define-key minibuffer-local-completion-map "\M-v" 'scroll-completions-down)
(define-key minibuffer-local-must-match-map "\C-v" 'scroll-completions-up)
(define-key minibuffer-local-must-match-map "\M-v" 'scroll-completions-down)
     (global-font-lock-mode 1)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
