BASE_DIR=$HOME
build_session() {
    SESSION_NAME=$1
    tmux new-session -d -s $SESSION_NAME
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
    git_window $dir
}

fes() {
    dir="${BASE_DIR}/code/workspace/stx-frontend-services"
    build_session "FES"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

marissa() {
    dir="${BASE_DIR}/code/mr/marissa"
    build_session "marissa"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

waldorf() {
    dir="${BASE_DIR}/code/mr/waldorf"
    build_session "waldorf"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

dickens() {
    dir="${BASE_DIR}/code/mr/dickens"
    build_session "dickens"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

grover() {
    dir="${BASE_DIR}/code/mr/grover"
    build_session "grover"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

piney() {
    dir="${BASE_DIR}/code/mr/piney"
    build_session "piney"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

waldorf
dickens
fes
adserver
piney
grover
marissa

# attach
tmux attach-session -t dickens
