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

# Scala installed via Homebrew
export SCALA_HOME=/usr/local/Cellar/scala/2.11.8/libexec

# Maven credentials
source ~/.maven_credentials

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# set path for Heroku toolbelt
PATH="/usr/local/heroku/bin:$PATH"

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# virtualenv
export PATH=/usr/local/bin:$PATH
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/local/sbin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# add my ~/bin to PATH
export PATH="$HOME/bin:$PATH"

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/amazon/redshift/lib/universal
# export ODBCINI=/etc/odbc.ini
export AMAZONREDSHIFTODBCINI=$HOME/.amazon.redshiftodbc.ini
# export ODBCSYSINI=/usr/local/odbc

##
# Your previous /Users/michaelruggiero/.bash_profile file was backed up as /Users/michaelruggiero/.bash_profile.macports-saved_2017-04-06_at_17:07:19
##

# MacPorts Installer addition on 2017-04-06_at_17:07:19: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

