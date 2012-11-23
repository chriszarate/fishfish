alias vi "vim"

set PATH /usr/local/bin $PATH
set PATH /usr/local/go/bin $PATH
set PATH ~/bin $PATH
set PATH ~/Library/Haskell/bin $PATH

set -xg GOPATH /usr/local/go

set -xg __fish_git_prompt_showdirtystate 1
set -xg __fish_git_prompt_showuntrackedfiles 1

set -xg __fish_git_prompt_color_dirtystate red
set -xg __fish_git_prompt_color_untrackedfiles red
set -xg __fish_git_prompt_color_branch normal
set -xg __fish_git_prompt_color_prefix normal
set -xg __fish_git_prompt_color_suffix normal
set -xg __fish_git_prompt_color_stagedstate "green"
set -xg __fish_git_prompt_color_bare red
set -xg __fish_git_prompt_color_invalidstate red

set -xg ___fish_git_prompt_char_dirtystate !

set fish_greeting

__fish_git_prompt

function fish_prompt -d "Write out the prompt"
  if test -e ".git"
    printf '%s%s%s:%s%s%s%s $ ' (set_color -o green) (hostname|cut -d . -f 1) (set_color normal) (basename (prompt_pwd)) (set_color  cyan) (__fish_git_prompt '%s') (set_color normal)
  else
    printf '%s%s%s:%s $ ' (set_color -o green) (hostname|cut -d . -f 1) (set_color normal) (basename (prompt_pwd))
  end
end

set -xg EDITOR vim
