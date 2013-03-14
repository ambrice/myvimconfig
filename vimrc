syntax on
set nocompatible
set ruler
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set title
set scrolloff=3
set history=1000
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set foldmethod=syntax
set foldlevelstart=99
set incsearch
set nohls
set clipboard=unnamed
set tags=tags;
set bs=indent,eol,start
set showcmd
set shiftround
set switchbuf=usetab
set laststatus=2
set encoding=utf-8

set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

call pathogen#infect()

let mapleader=","
let g:rails_leader="\\"

let g:EclimXmlValidate=0

filetype on
filetype plugin on
filetype indent on

runtime macros/matchit.vim

" Mappings for easier window navigation
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l

noremap <SPACE> :bnext!<CR>
noremap <S-SPACE> :bprev!<CR>

colorscheme zenburn

" Project plugin stuff
au BufWinLeave .vimprojects mkview
au BufWinEnter .vimprojects silent loadview

let g:proj_flags="imstgST"

" Fuzzyfinder stuff
nnoremap <leader>f :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>

" Supertab stuff
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

nnoremap <silent> <leader>i :JavaImport<cr>
nnoremap <silent> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <leader>s :JavaSearchContext<cr>
nnoremap <silent> <leader>c :JavaCorrect<cr>

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

nnoremap <leader>o :ClassOpen<CR>

let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_mode_map = { 'passive_filetypes': ['cpp', 'java'] }

