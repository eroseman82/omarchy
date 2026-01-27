# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias y='yazi'
alias snapshot='~/Suppliment/scripts/snapshot.sh'
function y() {
local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
yazi "$@" --cwd-file="$tmp"
if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
builtin cd -- "$cwd"
fi
rm -f -- "$tmp"
}
