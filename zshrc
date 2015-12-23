export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh-custom

ZSH_THEME="robbyrussell"

plugins=(osx vi-mode gitfast tmux npm httpie last-working-dir zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/aliases

bindkey -v

bindkey "^R" history-incremental-search-backward

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL