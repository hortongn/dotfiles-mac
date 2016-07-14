function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NO_COLOR="\[$(tput sgr0)\]\[\033[38;5;15m\]"
YELLOW="\[$(tput sgr0)\]\[\033[38;5;11m\]"
HOST_COLOR="\[\033[38;5;2m\]"
if [ -f /home/vagrant/.bash_profile ]; then
  HOST_COLOR="\[\033[38;5;4m\]"
fi

export PS1="$HOST_COLOR\u@\h$NO_COLOR:\W$YELLOW\$(parse_git_branch)$NO_COLOR\\$\[$(tput sgr0)\] "

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

# For Fits
export PATH=$PATH:~/Development/fits

# Add my bin directory to path
export PATH=$PATH:/Users/hortongn/Google_Drive/bin

# Git auto-completion
source ~/.git-completion.bash

# For homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set default editor
export EDITOR='vim'

if [[ ! $TERM =~ screen ]]; then
  if [ -f /home/vagrant/.bash_profile ]; then
    /usr/local/bin/tmux
  fi
fi
