PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR=/usr/bin/vim

# import aliases
source ~/.aliases

# show svn status in current directory
. ~/.git_svn_bash_prompt

# autocomplete for git
. ~/.git-completion.bash

# Color for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Colors for ls
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDgxgx

# Increase size of history
export HISTFILESIZE=20000
export HISTSIZE=10000

# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# virtualenv
export PATH=/usr/local/bin:$PATH
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/local/sbin:$PATH"

# tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# add my ~/bin to PATH
export PATH="$HOME/bin:$PATH"
