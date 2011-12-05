#! /bin/bash

alias al='vim ~/.bash_aliases ; . ~/.bash_aliases'
alias task='ps auxw | head -n1 ; ps auxw | grep -v grep | grep'
alias fuzzy='echo logic'
alias work-hours='gvim ~/hours.txt'
alias py='ipython'
alias ap='sudo aptitude'
alias upup='ap update && ap upgrade'
alias h='history | grep'
alias cp='cp --preserve=mode,timestamps'
alias pg='sudo -u postgres'
alias t='task tom | grep `pwd`'
alias cdg='cd ~/Dropbox/Year3/FallSem/comp3553\(Graphics\)/'
complete -F _aptitude -o default ap
complete -F _root_command -o default pg

function o()
{
    for file in "$@"
    do
        gnome-open "$file"
    done
}

# git stuff
alias ci='git commit'
alias co='git checkout'
alias st='git status'
alias rb='git rebase'
alias dci='git svn dcommit'
alias srb='git svn rebase'
alias br='git branch'
alias log='git log --oneline --graph --branches --decorate'
alias gk='gitk --all'
alias ga='git add'
alias pa='ga --patch'
alias a.='ga .'
alias gd='git diff'
alias gdc='gd --cached'
alias gs='git stash'
alias gsa='gs apply'
alias gsk='gs -k'
alias gm='git merge --no-ff'
alias gmff='git merge --ff'

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

# git flow
alias gf='git flow'
alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'
