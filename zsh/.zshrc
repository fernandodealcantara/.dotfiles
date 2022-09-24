##########################################################################################
# custom config
[ -f ~/.custom ] && source ~/.custom

##########################################################################################
# ssh
if [ ! -e ~/.ssh/id_ed25519.pub ]
then
    ssh-keygen -t ed25519 -C $USER_EMAIL
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##########################################################################################
# antidote
# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote
# source antidote
source ~/.antidote/antidote.zsh
# generate and source plugins from ~/.zsh_plugins.txt
antidote load

##########################################################################################
# asdf
[[ -e ~/.asdf ]] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
source ~/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

##########################################################################################
# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
