function rvm -d 'Ruby enVironment Manager'
  # run RVM and capture the resulting environment
  set -l env_file (mktemp -t rvm.fish.XXXXXXXXXX)
  zsh -c 'source ~/.rvm/scripts/rvm; rvm "$@"; st=$?; source `pwd`/.rvmrc; env > "$0"; exit $st' $env_file $argv

  # apply rvm_* and *PATH variables from the captured environment
  and eval (grep '^rvm\|^[^=]*PATH' $env_file | sed '/^[^=]*PATH/y/:/ /; s/^/set -xg /; s/=/ /; s/$/ ;/; s/(//; s/)//')
  rm -f $env_file
end
