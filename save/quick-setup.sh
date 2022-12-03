#!/bin/bash

# APT config first
SOURCES="/etc/apt/sources.list"
sudo sed -Ei 's/([a-z]*\.)?archive\.ubuntu\.com/mirrors.ustc.edu.cn/g' "$SOURCES"
sudo sed -Ei 's/security\.ubuntu\.com/mirrors.ustc.edu.cn/g' "$SOURCES"
sudo sed -Ei 's/http:/https:/g' "$SOURCES"

# APT Packages
export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt -y full-upgrade
sudo apt -y install vim build-essential python3-pip git openssh-client wget curl tldr tree cmake gdb tmux nodejs npm zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel9k
unset DEBIAN_FRONTEND

chsh -s /usr/bin/zsh

# 配置 commitizen

# 首先升级node

sudo npm install -g n
sudo n latest
sudo n prune

sudo npm install -g commitizen
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

# 迁移 .zshrc

wget -q https://raw.githubusercontent.com/Momo-Tori/Small-Tools/master/save/.zshrc -O ~/.zshrc &

wait # wait for tasks to complete