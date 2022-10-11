require('base')
require('plugins')
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.wo.relativenumber = true
-- For macOS clipboard
vim.opt.clipboard:append {'unnamedplus'}
-- For less revolting colors
vim.opt.termguicolors = true

map('n', '<C-h>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',opts)
map('n', 'mm', ':lua require("harpoon.mark").add_file()<CR>',opts)
map('n', 'H', '^',opts)
map('n', 'L', '$',opts)
map('v', 'H', '^',opts)
map('v', 'L', '$',opts)
-- For shifting lines
map('v', 'J', ":m '>+1<CR>gv=gv",opts)
map('v', 'K', ":m '<-2<CR>gv=gv",opts)
map('n', 'U', '<C-R>',opts)
map('n', 'B', '<C-u>',opts)
map('n', 'F', '<C-d>',opts)
-- Esc Mappings
map('n', '<C-c>', '<Esc>',opts)
map('v', '<C-c>', '<Esc>',opts)
map('i', '<C-c>', '<Esc>',opts)
-- Save file
map('n', '<C-s>', ':w<CR>',opts)
-- Move in insert
map('i', '<C-k>', '<C-o>gk',opts)
map('i', '<C-h>', '<Left>',opts)
map('i', '<C-l>', '<Right>',opts)
map('i', '<C-j>', '<C-o>gj',opts)
-- File browser
map('n','<space>e',':NvimTreeToggle<CR>',opts)
map('n','<space>h',':NvimTreeFindFile<CR>',opts)
local set = vim.opt

map('n','<C-t>',':ToggleTerm direction=float<CR>',opts)

-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

