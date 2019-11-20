set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jnurmine/Zenburn'

Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on
filetype plugin on    " required
filetype indent on

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
set display=uhex

runtime vimrc.local

let mapleader=","

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

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

nnoremap <leader>o :ClassOpen<CR>

