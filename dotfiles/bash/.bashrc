# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# ALIASES 
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Add your own exports, aliases, and functions here.
# Make an alias for invoking commands you use constantly

# alias p='python'
alias snapshot='~/Suppliment/scripts/snapshot.sh'
alias v='nvim'
alias vm='virt-manager'
alias eric='ssh eric@31.97.218.42'
alias pi='ssh eric@192.168.1.40'
alias pifi='ssh eric@raspy'



# FUNCTIONS 
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# SSH agent persistence (keychain)
eval "$(keychain --eval --agents ssh id_ed25519)"

# SSH PUSH FOLDER OR FILE
push() {
  rsync -avz --progress "$1" eric@31.97.218.42:~/linux/
}
pull() {
  rsync -avz --progress eric@31.97.218.42:~/mac/"$1" .
}


# STOW 
stoww() {
    local DOTFILES="$HOME/Suppliment/dotfiles"

    if [ -z "$1" ]; then
        echo "Usage: stowpkg <package>"
        return 1
    fi

    (cd "$DOTFILES" && stow -t ~ -v "$1")
}


# YAZI
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
