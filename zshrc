export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh-custom

ZSH_THEME="tomita"

plugins=(osx vi-mode gitfast tmux npm httpie zsh-syntax-highlighting docker colored-man-pages)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/aliases

bindkey -v

bindkey "^R" history-incremental-search-backward

export TERM='xterm-256color'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

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

vlco() {
  find "$1" -type f | sort -r | xargs -I '{}' open -a /Applications/VLC.app/Contents/MacOS/VLC '{}'
}

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
source "$HOME/Hex/hex/scripts/mfa/mfa.sh"
