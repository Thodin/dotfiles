-- GENERAL OPTIONS

-- absolute line number on the current line
vim.opt.number = true
-- relative line numbers on all other lines
vim.opt.relativenumber = true

-- highlight the current line
vim.opt.cursorline = true
-- enable mouse support
vim.opt.mouse = 'a'

-- always sho the sign column (e.g. for Git, diagnostics)
vim.opt.signcolumn = 'yes'

-- Optional: disable netrw (builtin file explorer), we've got nvim-tree now
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optional: set termguicolors for better colors
vim.opt.termguicolors = true

-- Make splits open in a sensible direction
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Number of visual spaces per TAB
vim.opt.tabstop = 4
-- Number of spaces for each indentation
vim.opt.shiftwidth = 4
-- Uses spaces instead of tabs
vim.opt.expandtab = true
-- Smart auto-indenting on new lines
vim.opt.smartindent = true
-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

-- Don't wrap long lines
vim.opt.wrap = false
