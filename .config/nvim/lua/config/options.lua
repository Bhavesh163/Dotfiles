-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- Enable mouse support
vim.opt.mouse = 'a'

-- Enable system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Better selection behavior
vim.opt.selection = 'exclusive'
vim.opt.selectmode = 'mouse,key'
