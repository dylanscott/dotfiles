# aliases
source $OMF_CONFIG/abbreviations.fish

function fish_user_key_bindings
  # vi mode hype
  fish_vi_mode
  # restore ctrl-f functionality
  bind -M insert \cf accept-autosuggestion
  bind \cf accept-autosuggestion
end

function fish_mode_prompt
  # don't use builtin vi-mode indicator
end

# always be multiplexing
test $TERM != "screen-256color"; and exec tmux
