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

irc_window() {
    tmux new-window -a -n irc
    tmux send-keys "cd $1" C-m
    tmux send-keys "irssi" C-m
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

tripp() {
    dir="${BASE_DIR}/code/mr/tripp"
    build_session "tripp"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

veronica() {
    dir="${BASE_DIR}/code/mr/veronica"
    build_session "veronica"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

gob() {
    dir="${BASE_DIR}/code/mr/gob"
    build_session "gob"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

sla() {
    dir="${BASE_DIR}/code/workspace/sla-analyzer"
    build_session "sla"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

realtime() {
    dir="${BASE_DIR}/code/workspace/realtime"
    build_session "realtime"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

nelly() {
    dir="${BASE_DIR}/code/mr/nelly"
    build_session "nelly"
    tmux send-keys "cd $dir" C-m
    git_window $dir
}

scratch() {
    dir="${BASE_DIR}/code/mr"
    build_session "scratch"
    tmux send-keys "cd $dir" C-m
}

nelly
sla
dickens
veronica
waldorf
scratch

# attach
tmux attach-session -t dickens
