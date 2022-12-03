#!/bin/bash

# !!!!!!!请在su下运行该脚本!!!!!!!

# APT config first
SOURCES="/etc/apt/sources.list"
sed -Ei 's/([a-z]*\.)?archive\.ubuntu\.com/mirrors.ustc.edu.cn/g' "$SOURCES"
sed -Ei 's/security\.ubuntu\.com/mirrors.ustc.edu.cn/g' "$SOURCES"
sed -Ei 's/http:/https:/g' "$SOURCES"

# APT Packages
export DEBIAN_FRONTEND=noninteractive
apt update
apt -y full-upgrade
apt -y install vim build-essential python3-pip git openssh-client wget curl tldr tree cmake gdb tmux nodejs npm zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel9k
unset DEBIAN_FRONTEND

chsh -s /usr/bin/zsh

# 配置 commitizen

# 首先升级node

npm install -g n
n latest
n prune

npm install -g commitizen
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

# 迁移 .zshrc

wget -q https://raw.githubusercontent.com/Momo-Tori/Small-Tools/master/save/.zshrc -O ~/.zshrc &

wait # wait for tasks to complete