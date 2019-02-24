call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

"formatting
"
"appearance
set t_Co=256
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
set cursorline
set number
set showcmd
set showtabline=1

"misc
set encoding=utf-8
set mouse=a

"search
set ignorecase
set smartcase
set incsearch
set hlsearch
