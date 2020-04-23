" --------------------Plugins (VimPlug)-----------------------------------

call plug#begin('~/.config/nvim/plugged')

" NerdTree
Plug 'preservim/nerdtree'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Monokai Colorscheme
Plug 'patstockwell/vim-monokai-tasty'

" Syntax checker
Plug 'scrooloose/syntastic'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

"---------------------Plugin settings---------------------------------------

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Airline
let g:airline_theme='monokai_tasty'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"---------------------------------- My Settings------------------------------

colorscheme vim-monokai-tasty

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

" Closes Vim if NerdTree is the only left && remap key to open NerdTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"hi Normal guibg=NONE ctermbg=NONE

" Let you use bash aliases
let $BASH_ENV = "~./bash_aliases"

" Mapping
let mapleader = ","
noremap <leader>w :w<CR>

map <F2> :w<CR>:vsplit term://bash<CR>:startinsert<CR>timeout 3s cmatrix ; ./r<CR>
map <C-s> :source ~/.config/nvim/init.vim<CR>
tnoremap <ESC> <C-\><C-n>:q<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" jj to throw you in normalmode
inoremap jj <esc>

" Scrolling
set scrolloff=5
