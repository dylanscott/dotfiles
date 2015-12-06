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
