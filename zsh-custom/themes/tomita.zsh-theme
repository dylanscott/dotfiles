TOMITA_DIR_COLOR="%{$fg[green]%}"
TOMITA_GIT_BRANCH_COLOR="%{$fg[white]%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

abbreviate() {
  # abbreviated=$(echo $1 | sed -e "s/([^a-zA-Z]*[a-zA_Z]?).*/\1/")
  abbreviated=$(echo $1 | sed -E "s/([^a-zA-Z]*[a-zA-Z]?).*/\1/")
  echo $abbreviated
}

directory_name() {
  DIR=$(echo $PWD | sed -e "s|^$HOME|~|g")
  DIRS=("${(@f)$(echo $DIR | tr '/' '\n')}")
  ABBREVIATED=()
  for e in $DIRS; do
    ABBREVIATED+=("$(abbreviate "$e")")
  done
  echo "${(j:/:)ABBREVIATED}"
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
