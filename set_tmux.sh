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

swanson() {
    dir="${BASE_DIR}/code/mr/swanson"
    build_session "swanson"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

waldorf() {
    dir="${BASE_DIR}/code/mr/waldorf"
    build_session "waldorf"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

bakery() {
    dir="${BASE_DIR}/code/workspace/bakery"
    build_session "bakery"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

dickens() {
    dir="${BASE_DIR}/code/mr/dickens"
    build_session "dickens"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

datascience() {
    dir="${BASE_DIR}/code/mr/tripp"
    build_session "datascience"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

notes() {
    dir="${BASE_DIR}/Dropbox/job/str/notes"
    notes_file="${dir}/notes.txt"
    build_session "notes"
    tmux send-keys "cd $dir" C-m
}

millard() {
    dir="${BASE_DIR}/code/mr/millard"
    build_session "millard"
    tmux send-keys "cd $dir" C-m
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

# build them
waldorf
dickens
fes
adserver
piney
grover

# attach
tmux attach-session -t dickens
