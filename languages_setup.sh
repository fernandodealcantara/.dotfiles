#!/usr/bin/bash

function nodeSetup(){
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
  asdf global nodejs latest

  npm install -g tldr
  npm install -g yarn
  npm install -g typescript
}

function pythonSetup(){
  asdf plugin-add python
  asdf install python latest
  asdf global python latest
}

function rustSetup(){
  asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
  asdf install rust latest
  asdf global rust latest
}

nodeSetup
pythonSetup
rustSetup