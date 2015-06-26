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

taft() {
    dir="${BASE_DIR}/code/mr/taft"
    build_session "taft"
    tmux send-keys "cd $dir" C-m
    #tmux send-keys "./sbt" C-m
    vim_window $dir
    git_window $dir
}

vaca() {
    dir="${BASE_DIR}/code/workspace/vaca"
    build_session "vaca"
    tmux send-keys "cd $dir" C-m
    #tmux send-keys "./sbt" C-m
    vim_window $dir
    git_window $dir
}

piney() {
    dir="${BASE_DIR}/code/mr/piney"
    build_session "piney"
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

notes() {
    dir="${BASE_DIR}/Dropbox/job/str/notes"
    notes_file="${dir}/notes.txt"
    build_session "notes"
    tmux send-keys "cd $dir" C-m
    vim_window $notes_file
}

piney() {
    dir="${BASE_DIR}/code/mr/piney"
    build_session "piney"
    tmux send-keys "cd $dir" C-m
    tmux send-keys "git status" C-m
    vim_window $dir
    lein_window $dir
}

# build them
bakery
taft
waldorf
dickens
vaca
adserver
piney

# and attach me
tmux attach-session -t dickens
