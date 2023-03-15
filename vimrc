function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.sh
    endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'jnurmine/Zenburn'
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'vim-crystal/vim-crystal'
Plug 'tpope/vim-fugitive'
Plug 'kergoth/vim-bitbake'
call plug#end()

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

autocmd FileType javascript setlocal ts=2 sw=2

autocmd FileType crystal setlocal ts=2 sw=2

autocmd FileType dts setlocal noexpandtab

