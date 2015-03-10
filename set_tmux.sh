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

fpinscala() {
    dir="${BASE_DIR}/code/mr/fpinscala"
    build_session "fpinscala"
    tmux send-keys "cd $dir" C-m
    tmux send-keys "./sbt" C-m
    vim_window $dir
    git_window $dir
}

taft() {
    dir="${BASE_DIR}/code/mr/taft"
    build_session "taft"
    tmux send-keys "cd $dir" C-m
    tmux send-keys "./sbt" C-m
    vim_window $dir
    git_window $dir
}

scala() {
    dir="${BASE_DIR}/code/workspace/microwave"
    build_session "scala"
    tmux send-keys "cd $dir" C-m
    tmux send-keys "./sbt" C-m
    vim_window $dir
    git_window $dir
}

georgina() {
    dir="${BASE_DIR}/code/mr/georgina"
    build_session "georgina"
    tmux send-keys "cd $dir" C-m
    tmux send-keys "./sbt" C-m
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

haskell() {
    dir="${BASE_DIR}/code/mr/note"
    build_session "haskell"
    tmux send-keys "cd $dir" C-m
    git_window $dir
    vim_window $dir
}

#build them
bakery
taft
waldorf
dickens
scala
haskell

#and attach me
tmux attach-session -t dickens
