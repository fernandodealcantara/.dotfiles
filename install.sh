#!/usr/bin/bash
## Install script for the dotfiles

## functions
function upgrade(){
    sudo apt update && sudo apt upgrade -y
}

function addRepos(){
    #nvim
    sudo add-apt-repository ppa:neovim-ppa/stable -y
}

function installPackages(){
    # Apt packages
    sudo apt install -y \
    software-properties-common \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    curl git stow zsh bat zip unzip ripgrep fd-find fzf neovim tmux \
    default-jre default-jdk exa nala wslu
}

function symLink(){
    # Symlink dotfiles
    stow -v -d ~/.dotfiles/ -t ~ zsh
    stow -v -d ~/.dotfiles/ -t ~ fonts
    stow -v -d ~/.dotfiles/ -t ~ neovim
    stow -v -d ~/.dotfiles/ -t ~ git
}

function copyWindowsConfigFiles(){
    cp ~/.dotfiles/alacritty/alacritty.yml "$(wslpath $(wslvar -l AppData))/alacritty"
    cp ~/.dotfiles/wslconfig/.wslconfig $(wslpath $(wslvar -s USERPROFILE))
}

function gitSetup(){
    # Git config
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL
    git config --global commit.template $GIT_COMMIT_TEMPLATE
}

function getClipboardTool(){
    wget https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip -O /tmp/win32yank.zip
    unzip /tmp/win32yank.zip -d ~
}

upgrade
addRepos
installPackages
symLink
copyWindowsConfigFiles
gitSetup
getClipboardTool

# give permission to zsh
which zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)

# source .zshrc
source ~/.zshrc

gitSetup
# programming languages

