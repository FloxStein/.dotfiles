" Plugins
call plug#begin('~/.config/nvim/plugged')

" NerdTree
Plug 'preservim/nerdtree'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorscheme
Plug 'patstockwell/vim-monokai-tasty'
Plug 'morhetz/gruvbox'

" Syntax Checker
Plug 'scrooloose/syntastic'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

" Plugin Settings
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline_theme='monokai_tasty'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" My Settings

" colorscheme vim-monokai-tasty
" colorscheme gruvbox

syntax on
set number relativenumber

set smartindent smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=0
set noexpandtab

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

let $BASH_ENV = "~./bash_aliases"

" Mapping
let mapleader = ","
noremap <leader>w :w<CR>
noremap <F1> :NERDTreeToggle<CR>

noremap <leader>c :w<cr>:vsplit term://bash<cr>:startinsert<cr>timeout 1s cmatrix ; ./run<cr>
noremap <leader>p :w<cr>:!python main.py<cr>

noremap <C-s> :source ~/.config/nvim/init.vim<cr>
tnoremap <ESC> <C-\><C-n>:q<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap jj <esc>

set scrolloff=5

set splitbelow
set splitright
