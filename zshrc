export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh-custom

ZSH_THEME="tomita"

plugins=(osx vi-mode gitfast tmux npm httpie zsh-syntax-highlighting docker colored-man-pages)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/aliases

bindkey -v

bindkey "^R" history-incremental-search-backward

export TERM='screen-256color'

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_R_OPTS="--exact"

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

[ -s "/Users/dylanscott/.scm_breeze/scm_breeze.sh" ] && source "/Users/dylanscott/.scm_breeze/scm_breeze.sh"
