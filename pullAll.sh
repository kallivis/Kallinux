#!/bin/sh
cd ~/Kallinux
echo "Pulling Kallinux"
git pull
echo "Pulling teamocil"
cd ~/teamocil
git pull
echo "Pulling Oh My Zsh"
cd ~/.oh-my-zsh
git pull
