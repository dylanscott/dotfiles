set -g __fish_git_prompt_show_informative_status true

set -g __fish_git_prompt_char_stagedstate '±'
set -g __fish_git_prompt_char_dirtystate '±'
set -g __fish_git_prompt_char_untrackedfiles '+'
set -g __fish_git_prompt_char_cleanstate '✓'

set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_color_stagedstate green
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_untrackedfiles red
set -g __fish_git_prompt_color_upstream_ahead green
set -g __fish_git_prompt_color_upstream_behind red
set -g __fish_git_prompt_color_invalidstate red

function fish_prompt
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  set_color normal
  printf '%s ' (__fish_git_prompt)

  if set -q __fish_vi_mode
    printf '['
    switch $fish_bind_mode
      case default
        set_color red
        printf 'n'
      case insert
        set_color green
        printf 'i'
      case visual
        set_color purple
        printf 'v'
    end
    set_color normal
    printf '] '
  end

  set_color -o yellow
  printf '⏛  '
  set_color normal
end
