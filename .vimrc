let mapleader=","

set expandtab
set tabstop=2
set smarttab
set shiftwidth=2
set backup
set wildmode=list:longest,full

syntax enable
set background=dark

set incsearch
set ignorecase
set linebreak

set scrolloff=3

set mouse=a

au BufWinEnter *.c,*.java,*.cpp,*.h let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter *.c,*.java,*.cpp,*.h let w:m1=matchadd('Search', '\%<81v.\%>79v', -1)
au BufWinEnter *.txt,*.tex set spell

" These are set in .gvimrc using au so it actually works. Go figure.
"set lines=38
"set columns=80
""
imap <F12> <Esc>:w  :make <CR> 

map <F12> :w  :make <CR> 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
imap destory destroy
vmap cm <ESC>`<^I/*<ESC>`>$a*/<ESC>
vmap :com1 <ESC>`<^I/*<ESC><C-v>j^I//<ESC><C-v>`>$a*/<ESC>

au BufNewFile,BufRead Matefile set noexpandtab
au BufNewFile,BufRead Makefile set tabstop=8
au BufNewFile,BufRead Makefile set shiftwidth=8

au BufNewFile,BufRead *.m set ft=objc
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

inoremap { {}O
inoremap /** /**/ki<End> 
inoremap /* /*/ki<End> 
iab jmain public static void main(String[] args)<CR>{o}<Up>A


set directory=$HOME/tmp/.vim
set backupdir=$HOME/tmp/.vim

set completeopt=menuone,preview,longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Ryans SuperTab stuff for Eclipse
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<S-tab>'
let g:SuperTabMappingTabLiteral = '<C-tab>'
let g:SuperTabLongestHighlight = 1

augroup java
    autocmd FileType java :nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
    autocmd FileType java :nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
    autocmd FileType java :nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
    autocmd FileType java :nnoremap <silent> <buffer> <leader>c :JavaCorrect<cr>
augroup END

let g:EclimBrowser = 'firefox'
filetype plugin indent on
syntax on

"fix eventually
com W w
"com Q q
set ruler

runtime macros/matchit.vim
set nocompatible
if has("autocmd")
    filetype indent plugin on
endif

cabbrev git Git

nmap gk :Gitv --all<cr>
nmap gK :Gitv! --all<cr>

set list
set listchars=tab:>-,trail:~
   
call pathogen#infect()
syntax on
:hi Visual term=reverse cterm=reverse
filetype plugin indent on
