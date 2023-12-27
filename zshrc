# Source Prezto.
if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

export TERM='xterm-256color'

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(scmpuff init --shell=zsh --aliases=false)"

source ~/.aliases
source ~/.functions
[ -s ~/.localrc ] && source ~/.localrc
source ~/.nvm.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zplug/init.zsh
zplug "lib/completion", from:oh-my-zsh

zplug "modules/prompt", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/osx", from:prezto

zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

function zvm_after_init() {
  # otherwise zsh-vi-mode clobbers ^R binding
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

