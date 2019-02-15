filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-rails'
Bundle 'vim-airline/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-endwise'
Bundle "tpope/vim-surround"
Bundle "tpope/vim-commentary"
Bundle "bronson/vim-trailing-whitespace"
Bundle "keith/tmux.vim"
Bundle "jpo/vim-railscasts-theme"
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-repeat'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Bundle 'slim-template/vim-slim.git'
Bundle 'ngmy/vim-rubocop'
Bundle 'neomake/neomake'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-erlang/vim-erlang-runtime'
Bundle 'neo4j-contrib/cypher-vim-syntax'
Bundle 'elmcast/elm-vim'
Bundle 'w0rp/ale'

" Elixir neomake stuff
autocmd! BufWritePost * Neomake
" All of your Bundles must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
syntax enable
filetype plugin indent on

let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>

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
" set spell spelllang=en_us

colorscheme jellybeans

" Cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Elixir LS instance lives
let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers.elixir = ['mix_format']

let g:ale_elixir_elixir_ls_release = '/Users/sergey-chechaev/elixir/elixir-ls/rel'
let g:ale_sign_column_always = 1

" Splits
set splitbelow
set splitright

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

map <C-n> :NERDTreeToggle<CR>
map <leader>j i<CR><Esc>

let g:ag_working_path_mode="r"

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

let g:ctrlp_working_path_mode = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" ERB нажать в инсер моде cntrl+s дальше - или =
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"

nnoremap \ :Ag<SPACE>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set tags=./tags;

nmap 0 ^

imap jk <esc>
imap kj <esc>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nmap <leader>p orequire 'pry'; binding.pry<esc>^
nmap <leader>o orequire IEx; IEx.pry<esc>^


" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"!!!!!!!! возможно тут ошибка
autocmd BufNewFile,BufRead *.thor set syntax=ruby

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "Dispatch bin/rspec {spec}"

set langmenu=en_US
let $LANG = 'en_US'
let g:vimrubocop_config = '~/.rubocop.yml'

let g:neomake_elixir_enabled_makers = ['mycredo']
function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
        let type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
        let type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
        let type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
        let type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
        let type = 'W'
    else
        let type = 'M'           " Everything else is a message
    endif
    let a:entry.type = type
endfunction

let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake


