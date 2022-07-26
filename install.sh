#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y

# Install the Volian Scar repo 
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
# Download asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
# Nvim 
sudo add-apt-repository ppa:neovim-ppa/stable

# Apt packages
sudo apt install -y \
  software-properties-common \
  make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
  curl git stow zsh bat zip unzip ripgrep fd-find fzf neovim tmux \
  default-jre default-jdk exa nala

# symlink dot files
stow zsh
stow fonts
stow git
stow neovim

# give permission to zsh 
which zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)

# source .zshrc
. ~/.zshrc

# key generation
if [ ! -e ~/.ssh/id_ed25519.pub ]
then
    ssh-keygen -t ed25519 -C $USER_EMAIL
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
fi

# programming languages
# node
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# python
asdf plugin-add python
asdf install python latest
asdf global python latest

# rust
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf install rust latest
asdf global rust latest

# haskell
asdf plugin-add haskell https://github.com/vic/asdf-haskell.git
asdf install haskell 8.6.5
asdf global haskell 8.6.5

# Global language packages
# Node packages
npm install -g tldr
npm install -g yarn
npm install -g typescript
