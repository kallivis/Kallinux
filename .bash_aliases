#! /bin/bash

alias alb='vim ~/.bash_aliases ; . ~/.bash_aliases'

complete -F _aptitude -o default ap
complete -F _root_command -o default pg

complete -F _git_commit -o default -o nospace ci
complete -F _git_checkout -o default -o nospace co
complete -F _git_rebase -o default -o nospace rb
complete -F _git_svn_rebase -o default -o nospace srb
complete -F _git_branch -o default -o nospace br
complete -F _git_add -o default -o nospace ga
complete -F _git_diff -o default -o nospace gd
complete -F _git_stash -o default -o nospace gs
complete -F _git_merge -o default -o nospace gm
complete -F _git_merge -o default -o nospace gmff


