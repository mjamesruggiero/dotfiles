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
"remove EOL whitespace
autocmd FileType c,cpp,java,ruby,python,javascript,scala,clojure,haskell autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

" sensible temp
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
"
" And load session with F3
map <F3> :source ~/.vim_session <cr>     

"commandT should ignore scala target dirs
let g:CommandTWildIgnore=&wildignore . ",**/project/target/*,**/target/*2.10/*,**/target/streams/*,**/target/*2.11/*"

" toggle fold
nnoremap <Space> za

" commenting -------------------------
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

"Javascript: turn string into a JS string (and back again)
vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>

"turn
map <leader>5 :s/<\/[A-Za-z]\+>/&/g<CR>

" format SQL
vnoremap ;7 :!/usr/local/bin/sql_formatter<cr>  " only work in 'visual' mode
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
"set number for cutting and pasting
map ;q :set number!<CR>

" from http://bit.ly/1f6NvrF
" semicolon-1 opens buffer *wildmenu*
" I know, wild, huh?
set wildcharm=<C-Z>
nnoremap ;1 :b <C-Z>

" attempting to close buffers
" while keeping windows
nmap ;3 :bprevious<CR>:bdelete #<CR>

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
map ;n :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']

"remove debug logging statements (bracketed by delimiter text)
map <leader>q :g/_debug_start/,/_debug_end/d<CR>
map - ddjP

" fireplace
map ;m :Eval<CR>
map ;e :Last<CR>

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

" vim-rspec
map <Leader>u :call RunCurrentSpecFile()<CR>
map <Leader>i :call RunNearestSpec()<CR>
map <Leader>o :call RunLastSpec()<CR>
map <Leader>p :call RunAllSpecs()<CR>

" map rspec_command to zeus
let g:rspec_command = "!zeus rspec -fp {spec}"

" open this file in Mou
map ;0 :exec ':silent !open %'<CR>

" copied this from dbolson's https://github.com/dbolson/dotvim
" Find the related spec for any file you open. Requires
"  * Your specs live in spec/ or fast_spec/
"  * Your pwd (current dir) is the project root
"  * You use the same dir structure in your code and specs so that
"    code living at lib/foo/bar.rb has a spec at spec/lib/foo/bar.rb
"
" This method handles files in fast_spec unlike the :A and :AV functions
" that ship with rails.vim
function! FindSpec()
  let s:fullpath = expand("%:p")
  let s:filepath = expand("%:h")
  let s:fname = expand("%:t")

  " Possible names for the spec/test for the file we're looking at
  let s:test_names = [substitute(s:fname, ".rb$", "_spec.rb", ""), substitute(s:fname, ".rb$", "_test.rb", "")]

  " Possible paths
  let s:test_paths = ["spec", "fast_spec", "test"]
  for test_name in s:test_names
    for path in s:test_paths
      let s:filepath_without_app = substitute(s:filepath, "app/", "", "")
      let s:spec_path = path . "/" . s:filepath_without_app . "/" . test_name
      let s:full_spec_path = substitute(s:fullpath, s:filepath . "/" . s:fname, s:spec_path, "")
      if filereadable(s:full_spec_path)
        execute ":botright vsp " . s:full_spec_path
        return
      endif
    endfor
  endfor
endfunction

"nnoremap <C-s> :call FindSpec()<CR>
:map ;4 :call FindSpec()<CR>

" pymode settings
let g:pymode_doc = 0
let g:pymode_rope_complete_on_dot = 0

" jshint
au BufWritePost *.js :JSHint


" pulled from http://bit.ly/1hA6d2C
" populates the arglist with files in the quickfix list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"----------------------- code generation -----------------------
" templates for generating Python tests
:map ;f :0r! /usr/local/bin/makemepython 
:map ;x :0r! /usr/local/bin/makemepythontest

"add Python logging lines
:map ;8 :r ~/Dropbox/python/scratch/debug_logging_bp.txt<CR>
:map ;9 :r ~/Dropbox/python/argparse_template.txt<CR>

"--------------------------- and the status line!
:set statusline=[BUF=%n]\ [FILE=%f]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

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
  GuiColorScheme hybrid
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme hybrid
endif
