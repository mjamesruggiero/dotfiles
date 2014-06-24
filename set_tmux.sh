BASE_DIR='/Users/michaelruggiero'
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

georgina() {
    dir="${BASE_DIR}/code/mr/georgina"
    build_session "georgina"

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m
    tmux send-keys "./sbt" C-m

    # vim
    vim_window $dir

    # git
    git_window $dir
}

lily() {
    dir="${BASE_DIR}/code/mr/lily"
    build_session "lily"

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m
    tmux send-keys "workon ipy" C-m

    # vim
    vim_window $dir

    # git
    git_window $dir
}

sharethrough() {
    dir="${BASE_DIR}/code/workspace/bakery"
    build_session sharethrough

    # repl
    #tmux rename-window -t 0 -n repl
    tmux send-keys "cd $dir" C-m

    # vim
    vim_window $dir

    # git
    git_window $dir
}

hq() {
    dir="${BASE_DIR}/code/workspace/Creatorious"
    build_session "HQ"

    tmux send-keys "cd $dir" C-m

    # vim
    vim_window $dir
}

katas() {
    dir="${BASE_DIR}/code/mr/katas"
    build_session "katas"

    tmux send-keys "cd $dir" C-m

    # vim
    vim_window $dir
}

#build them
sharethrough
hq
georgina
#lily
katas

#and attach me
tmux attach-session -t georgina
