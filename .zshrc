# === Environment Variables ===

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export NODE_PATH="$HOME/.config/yarn/global/node_modules"

export LFS=/mnt/lfs

# Path to your oh-my-zsh installation.
export ZSH="/home/jake/.oh-my-zsh"

export TERM=xterm-256color

# === ZSH Config ===

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# ZSH Autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Use UK timestamps in history
HIST_STAMPS="dd/mm/yyyy"

# Oh-My-ZSH plugins
plugins=(git adb colored-man-pages colorize command-not-found common-aliases gulp pip sudo ubuntu virtualenv zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# === Functions and Aliases === 

function pygmentize_cat {
  for arg in "$@"; do
    pygmentize -O style='base16-eighties' -g "${arg}" 2> /dev/null || /bin/cat "${arg}"
  done
}
command -v pygmentize > /dev/null && alias cat=pygmentize_cat

function scratch {
  if [ -z "$1" ]
  then
    nvim "/home/jake/.scratch"
  else
    nvim "/home/jake/.scratch/$1.md"
  fi
}

function push {
  git add .
  git commit -m "$1:-Push changes"
  git push
}

function dotsync {
  echo "$1"
  cp -arlv --parents "$1" ~/.dotfiles
}

alias cat=pygmentize_cat

alias upgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias vim=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
