" ------------------------- the basics -------------------------
let mapleader=","
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set number
set visualbell
set wildignore=*.o,*~,*.pyc

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType c,cpp,java,ruby,python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" insert space characters whenever the tab key is pressed
set expandtab

" insert 4 spaces characters when tab key is pressed
set tabstop=4

" insert 4 spaces wen autoindent indents
set shiftwidth=4

" automatically indent files
set autoindent

" Do smart indentation depending on code syntax (e.g. change after { }, keywords etc)
set smarttab 
set ignorecase smartcase
set ruler
set incsearch
set hidden
"nnoremap <C-N> :tabnext<Enter>
"nnoremap <C-P> :tabprev<Enter>
set confirm
set nowrap

set directory^=/tmp/

"no one needs the arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"set ESC to jk
inoremap jk <esc>

" save everything that is open into a re-openable session
map <F2> :mksession! ~/.vim_session <cr> 
" And load session with F3
map <F3> :source ~/.vim_session <cr>     

" ------------------------- code commenting -------------------------
"HTML comment
map <leader>< :s/^\(.*\)$/<!-- \1 -->/<CR>

"C-style commenting (double-slash)
map <leader>/ :s/^/\/\//<CR>

"C-style commenting (wrap)
map <leader>* :s/^\(.*\)$/\/\* \1 \*\//<CR>

"SQL commenting
map <leader>- :s/^/--/<CR>

"clears starting comments
map <leader>c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

"clears wrapping comments
map <leader>d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>

"Python/Perl/shell commenting
map <leader># :s/^/#/<CR>

"turn string into a Javascript string (and back again)
vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>
"----------------------- working with VIMRC -------------------------
"source the vimrc after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
map <leader>ev :vsplit $MYVIMRC<cr>
set directory^=$HOME/.vim_swap//   "put all swap files together in one place
set backupdir=~/.vim/backup

"------------------------- buffers -------------------------
"move betwn buffers
nnoremap <C-N> :bn<Enter>
nnoremap <C-P> :bp<Enter>

"set paste for those Stack Overfow moments
map ;z :set paste!<CR>

"save the buffer with two strokes
inoremap ;w <esc>:w<CR>
"------------------------- dumb macros ---------------------
function! MakeJournalLine()
    r !date
    -1
    s/^/--------------/
    +1
endfunction

map <leader>j :call MakeJournalLine()<CR>
map ;g :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"remove debug logging statements (bracketed by delimiter text)
map <leader>q :g/_debug_start/,/_debug_end/d<CR>
map - ddjP

"------------------------- experiments ---------------------
"from LVSTHW: move a line down
"and move it up
map - ddkP

"in insert mode, go back to the beginning 
"of the word and upper case it
imap <c-u> <esc>b<c-v>iwU<esc>ea

"Set the shell Vim uses for external commands to bash in such a way that
"it'll source ~/.bash_profile 
set shell=/bin/bash\ --login 

"try to call dash from inside vim
" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>

" pep8 and pyflakes
let g:PyFlakeOnWrite = 1
"----------------------- code generation -----------------------
"python templates
:map ;f :0r! /usr/local/bin/makemepython 
:map ;x :0r! /usr/local/bin/makemepythontest
:map ;l :r ~/Dropbox/python/scratch/logging_bp.txt<CR>
:map ;8 :r ~/Dropbox/python/scratch/debug_logging_bp.txt<CR>
:map ;9 :r ~/Dropbox/python/scratch/debug_logging_bp.txt<CR>
vnoremap ;9 :!/usr/local/bin/sql_formatter<cr>  " only work in 'visual' mode
"
"--------------------------- and the status line!
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"set t_Co=256
"set t_Co=88
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme jellybeans
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme jellybeans
endif
