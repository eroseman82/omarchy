# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias snapshot='~/Suppliment/scripts/snapshot.sh'
alias v='nvim'

y() {
  local tmp cwd

  # Portable mktemp on Linux
  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return 1

  # Run yazi and let it write the chosen cwd to the temp file
  yazi "$@" --cwd-file="$tmp"

  # Read it and cd if it changed
  cwd="$(cat -- "$tmp")"
  if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
    cd -- "$cwd" || return
  fi

  rm -f -- "$tmp"
}

fastfetch
