#!/bin/sh
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update && apt-get -y install zsh konsole vim vim-gtk tmux kdiff3 git git-core git-gui git-doc gitk
