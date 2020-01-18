# === Environment Variables ===

# Path
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export NODE_PATH="$HOME/.config/yarn/global/node_modules"

# Path to your oh-my-zsh installation.
export ZSH="/home/jake/.oh-my-zsh"

export TERM=xterm-256color

# === ZSH Config ===

ZSH_THEME="avit"

# ZSH Autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history)

# Use UK timestamps in history
HIST_STAMPS="dd/mm/yyyy"

# Oh-My-ZSH plugins
plugins=(git adb colored-man-pages colorize command-not-found common-aliases gulp pip sudo ubuntu virtualenv zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# === Functions and Aliases === 

source /usr/share/doc/pkgfile/command-not-found.zsh

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

function diary {
  datestring="$(date +"%d-%m-%y")"
  file="/home/jake/.diary/$datestring.md"

  if [ ! -f "$file" ]
  then
    echo "# $datestring" > $file
  fi

  nvim "$file"
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

function color {
  if [ -z "$1" ]
  then
    ls "/home/jake/bin/color-scripts"
  else
    "/home/jake/bin/color-scripts/$1"
  fi
}

alias cat=pygmentize_cat

alias upgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias vim=nvim

alias ls=exa
alias la="exa -la --git"

alias c="code ."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
