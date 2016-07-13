set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-rails'
Bundle 'vim-airline/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-endwise'
Bundle "tpope/vim-commentary"
Bundle 'kana/vim-textobj-user'
Bundle "tpope/vim-surround"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set number
set relativenumber
set showmatch
set incsearch
set hlsearch
set nohlsearch
set autoread

set backspace=indent,eol,start
set backspace=2 " make backspace work like most other apps"

let g:ctrlp_working_path_mode = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:airline#extensions#tabline#enabled = 1
syntax on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme jellybeans

map <C-n> :NERDTreeToggle<CR>

" Set tag tree
set tags=./tags;
