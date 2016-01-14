BASE_DIR=$HOME
build_session() {
    SESSION_NAME=$1
    tmux new-session -d -s $SESSION_NAME
}

vim_window() {
    tmux new-window -a -n vim
    tmux send-keys "cd $1" C-m
    tmux send-keys "vim" C-m
}

lein_window() {
    tmux new-window -a -n leiningen
    tmux send-keys "cd $1" C-m
    tmux send-keys "lein repl" C-m
}

git_window() {
    tmux new-window -a -n git
    tmux send-keys "cd $1" C-m
    tmux send-keys "git status" C-m
}

adserver() {
    dir="${BASE_DIR}/code/workspace/adserver"
    build_session "adserver"
    tmux send-keys "cd $dir" C-m
    #tmux send-keys "./sbt" C-m
    vim_window $dir
    git_window $dir
}

vaca() {
    dir="${BASE_DIR}/code/workspace/vaca"
    build_session "vaca"
    tmux send-keys "cd $dir" C-m
    vim_window $dir
    git_window $dir
}

swanson() {
    dir="${BASE_DIR}/code/mr/swanson"
    build_session "swanson"
    tmux send-keys "cd $dir" C-m
    tmux send-keys "lein repl" C-m
    vim_window $dir
    git_window $dir
}

waldorf() {
    dir="${BASE_DIR}/code/mr/waldorf"
    build_session "waldorf"
    tmux send-keys "cd $dir" C-m
    vim_window $dir
    git_window $dir
}

bakery() {
    dir="${BASE_DIR}/code/workspace/bakery"
    build_session "bakery"
    tmux send-keys "cd $dir" C-m
    vim_window $dir
    git_window $dir
}

dickens() {
    dir="${BASE_DIR}/code/mr/dickens"
    build_session "dickens"
    tmux send-keys "cd $dir" C-m
    vim_window $dir
    git_window $dir
}

datascience() {
    dir="${BASE_DIR}/code/mr/tripp"
    build_session "datascience"
    tmux send-keys "cd $dir" C-m
    vim_window $dir
    git_window $dir
}

notes() {
    dir="${BASE_DIR}/Dropbox/job/str/notes"
    notes_file="${dir}/notes.txt"
    build_session "notes"
    tmux send-keys "cd $dir" C-m
    vim_window $notes_file
}

# build them
bakery
waldorf
dickens
vaca
adserver
swanson
datascience

# and attach me
tmux attach-session -t dickens
