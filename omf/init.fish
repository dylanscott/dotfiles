# aliases
source $OMF_CONFIG/abbreviations.fish

# vi mode hype
fish_vi_mode

function fish_mode_prompt
# don't use builtin vi-mode indicator
end

# always be multiplexing
# test $TERM != "screen"; and exec tmux
