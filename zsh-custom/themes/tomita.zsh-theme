TOMITA_DIR_COLOR="%{$fg[green]%}"
TOMITA_GIT_BRANCH_COLOR="%{$fg[white]%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

directory_name() {
  if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
    # We're in a git repository
    GIT_ROOT=$(basename $(git rev-parse --show-toplevel))
    PREFIX="%{$fg_bold[magenta]%}± ${GIT_ROOT}%{$reset_color%}"
    PATH_TO_CURRENT="${PWD#$(git rev-parse --show-toplevel)}"
    if [[ -n $PATH_TO_CURRENT ]]; then
      PATH_TO_CURRENT=" ${PATH_TO_CURRENT:1}"
    fi
  elif [[ $PWD = $HOME* ]]; then
    PREFIX="~"
    PATH_TO_CURRENT="${PWD#$HOME}"
  else
    PREFIX=""
    PATH_TO_CURRENT="$PWD"
  fi
  echo "$PREFIX$TOMITA_DIR_COLOR$PATH_TO_CURRENT"
}

TOMITA_DIR_='$(directory_name)'
TOMITA_DIR_="$TOMITA_DIR_COLOR$TOMITA_DIR_ "
TOMITA_GIT_="\$(git_prompt_info)"
TOMITA_SUFFIX_="%{$fg[yellow]%}⏛  "

TOMITA_INSERT_MODE_INDICATOR="%{$fg[white]%}[%{$fg[green]%}i%{$fg[white]%}]"
TOMITA_NORMAL_MODE_INDICATOR="%{$fg[white]%}[%{$fg[red]%}n%{$fg[white]%}]"

function vi-mode-indicator {
  case ${KEYMAP} in
    (vicmd)      VI_MODE="$TOMITA_NORMAL_MODE_INDICATOR" ;;
    (main|viins) VI_MODE="$TOMITA_INSERT_MODE_INDICATOR" ;;
    (*)          VI_MODE="$TOMITA_INSERT_MODE_INDICATOR" ;;
  esac
  echo $VI_MODE
}
TOMITA_VI_MODE_='$(vi-mode-indicator) '

PROMPT="$TOMITA_DIR_$TOMITA_GIT_$TOMITA_VI_MODE_$TOMITA_SUFFIX_%{$reset_color%}"
RPROMPT=" "
