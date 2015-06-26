
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

function drm() { 
    docker rm $(docker ps -q -a); 
}

function dri() { 
    docker rmi $(docker images -q); 
}

function db() { 
    docker build -t="$1" .; 
}
