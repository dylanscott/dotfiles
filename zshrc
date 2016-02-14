export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh-custom

ZSH_THEME="tomita"

plugins=(osx vi-mode gitfast tmux npm httpie zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/aliases

bindkey -v

bindkey "^R" history-incremental-search-backward

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
# override gst from git plugin
unalias gst
alias gst="gs"
# override glg from git plugin
unalias glg
alias glg="git log --stat"

export NVM_DIR="/Users/dscott/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
