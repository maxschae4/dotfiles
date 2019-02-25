set nocompatible              " required
filetype off                  " required


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

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
highlight ColorColumn ctermbg=235 guibg=#2c2d27

"misc
set encoding=utf-8
set mouse=a

"search
set ignorecase
set smartcase
set incsearch
set hlsearch

""" SPLITS
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" KEYBINDINGS
map <C-n> :NERDTreeToggle<CR>


""" Python stuff
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufNewFile,BufRead *.py let &colorcolumn=join(range(80,999),",")
"au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on



" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

highlight ExtraWhitespace ctermbg=167 guibg=#fb4934
match ExtraWhitespace /\s\+$/
set list listchars=tab:\∣\ ,trail:·,extends:>
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
