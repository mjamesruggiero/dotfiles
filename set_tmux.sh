BASE_DIR='/Users/mjamesruggiero'
build_session() {
    SESSION_NAME=$1
    tmux new-session -d -s $SESSION_NAME
}

vim_window() {
    tmux new-window -a -n vim
    tmux send-keys "cd $1" C-m
    tmux send-keys "vim" C-m
}

git_window() {
    tmux new-window -a -n git
    tmux send-keys "cd $1" C-m
    tmux send-keys "git status" C-m
}

scala() {
    dir="${BASE_DIR}/workspace/humphrey"
    build_session "scala"

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m
    tmux send-keys "sbt" C-m

    # vim
    vim_window $dir

    # git
    git_window $dir
}

scratch() {
    dir="${BASE_DIR}/Dropbox/notes"
    build_session "scratch"
}

rufus() {
    dir="${BASE_DIR}/workspace/rufus"
    build_session "rufus"

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m
    tmux send-keys "workon rufus" C-m

    # vim
    vim_window $dir

    # git
    git_window $dir
}

sharethrough() {
    dir="${BASE_DIR}/workspace/bakery"
    build_session sharethrough

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m

    # vim
    vim_window $dir

    # git
    git_window $dir
}

clojure() {
    dir="${BASE_DIR}/Dropbox/clojure"
    build_session "clojure"

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m
    tmux send-keys "clj" C-m

    # vim
    vim_window $dir
}

#build them
sharethrough
clojure
scala
rufus
scratch

#and attach me
tmux attach-session -t rufus
