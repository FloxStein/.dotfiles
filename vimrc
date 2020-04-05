set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NerdTree
Plugin 'preservim/nerdtree'

" Monokai Colorscheme
Plugin 'patstockwell/vim-monokai-tasty'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Monokai Theme
" colorscheme vim-monokai-tasty
colorscheme monokai "by sickill/vim-monokai

syntax on
set number relativenumber

set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Closes Vim if NerdTree is the only left && remap key to open NerdTree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
hi Normal guibg=NONE ctermbg=NONE
