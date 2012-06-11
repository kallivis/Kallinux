#!/bin/sh
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get update && apt-get -y install zsh konsole vim-gtk tmux google-chrome-stable kdiff3 git git-core git-gui git-doc gitk
