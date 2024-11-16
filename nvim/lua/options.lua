-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- allow the mouse to be used in nvim
vim.opt.mouse = "a"

-- no swap files
vim.opt.swapfile = false

-- tabs and spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ui
vim.opt.number = true
vim.opt.showmode = false

-- searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.opt.smartindent = true

-- menus
vim.opt.completeopt = "menuone,noselect"

-- leaders
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- fold
vim.g.foldmethod = "syntax"
