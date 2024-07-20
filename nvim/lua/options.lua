
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")
keymap.set("i", "jj", "<ESC>")
keymap.set("n", "x", '"_x')

vim.opt.relativenumber = true
vim.opt.number = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"

vim.opt.splitright = true
vim.opt.splitbelow = true


-- Aktiviere die Cursorline
vim.opt.cursorline = true

-- Ändere die Farbe der Cursorline passend zum catppuccino-Theme
vim.cmd('highlight CursorLine guibg=#2b3b41 guifg=NONE')

-- Verwende eine transparente Cursorline
vim.cmd('highlight CursorLine ctermbg=NONE ctermfg=NONE guibg=#2b3b41 guifg=NONE')

