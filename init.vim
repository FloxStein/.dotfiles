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
Plug 'sainnhe/gruvbox-material'

" Syntax Checker
Plug 'scrooloose/syntastic'

" Completion
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'

" Latex
Plug 'lervag/vimtex'

" Startify
Plug 'mhinz/vim-startify'

" Emmet for HTML
Plug 'mattn/emmet-vim'

" Color Picker
Plug 'KabbAmine/vCoolor.vim'

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

" Vimtex for Latex
let g:vimtex_view_general_viewer = 'sumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Emmet
let g:user_emmet_leader_key=','

" My Settings

set guicursor+=a:blinkon1
set mouse=a

" colorscheme vim-monokai-tasty
" colorscheme gruvbox
if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material

syntax on
set number relativenumber

set smartindent smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=0
set noexpandtab

" inoremap {<cr> {<cr>}<c-o><s-o>
" inoremap [<cr> [<cr>]<c-o><s-o>
" inoremap (<cr> (<cr>)<c-o><s-o>

inoremap {		{}<Left>
inoremap {<cr> 	{<cr>}<c-o><s-o>
inoremap {{		{
inoremap {}		{}

let $BASH_ENV = "~./bash_aliases"

" Mapping
let mapleader = ","
noremap <leader>w :w<CR>
noremap <F1> :NERDTreeToggle<CR>

noremap <leader>cc :w<cr>:vsplit term://bash<cr>:startinsert<cr>timeout 1s cmatrix -u 1; ./run<cr>
noremap <leader>cp :w<cr>:vsplit term://bash<cr>:startinsert<cr>timeout 1s cmatrix -u 1; python3 main.py<cr>

noremap <C-s> :source ~/.config/nvim/init.vim<cr>
tnoremap <ESC> <C-\><C-n>:q<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap jj <esc>


" Folding
nnoremap <silent> <leader> <Space> zfa} za
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set scrolloff=5

set splitbelow
set splitright

" set paste
