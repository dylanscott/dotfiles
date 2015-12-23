TOMITA_DIR_COLOR="%{$fg[green]%}"
TOMITA_GIT_BRANCH_COLOR="%{$fg[white]%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

TOMITA_DIR_="$TOMITA_DIR_COLOR%~ "
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
