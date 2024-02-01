-- Set Tab to 4 space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Disable swap file
vim.o.backup = false
vim.o.writebackup = false 
vim.o.swapfile = false
-- Hightlight current line
vim.wo.cursorline = true
-- Add Hybrid linue number showing
vim.wo.number = true
vim.wo.relativenumber = true
-- wrap line
vim.o.wrap = true
vim.wo.wrap = true
-- jump to next line if end line
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- search during typing
vim.o.incsearch = true
-- set map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- set sessionoptions
vim.api.nvim_set_option('sessionoptions','blank,buffers,folds,help,globals,options,tabpages,winsize,terminal')
-- In insert or command mode, move normally by using Ctrl
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
-- Disable Arrow key
map('i', '<Up>', '<Nop>', opt)
map('i', '<Down>', '<Nop>', opt)
map('i', '<Left>', '<Nop>', opt)
map('i', '<Right>', '<Nop>', opt)
map('n', '<Up>', '<Nop>', opt)
map('n', '<Down>', '<Nop>', opt)
map('n', '<Left>', '<Nop>', opt)
map('n', '<Right>', '<Nop>', opt)
-- Use Cltr + hjkl to navigate
map('i', '<C-k>', '<C-o>k', opt )
map('i', '<C-h>', '<C-o>h', opt )
map('i', '<C-l>', '<C-o>l', opt )
map('i', '<C-j>', '<C-o>j', opt )
-- Use Ctrl + wbx for common control
map('i', '<C-w>', '<C-o>w', opt )
map('i', '<C-b>', '<C-o>b', opt )
map('i', '<C-x>', '<C-o>x', opt )
-- bufferline 左右Tab切换
map("n", "<S-q>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-e>", ":BufferLineCycleNext<CR>", opt)
-- Split Screen
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt) -- close others
-- 比例控制（不常用，因为支持鼠标拖拽）
map("n", "s>", ":vertical resize +20<CR>", opt)
map("n", "s<", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>",opt)
map("n", "sk", ":resize -10<CR>",opt)
-- alt-hjkl navigate between window
map("n", "<S-h>", "<C-w>h", opt)
map("n", "<S-j>", "<C-w>j", opt)
map("n", "<S-k>", "<C-w>k", opt)
map("n", "<S-l>", "<C-w>l", opt)
-- For telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- For Symbol Outline
map('n', '<F3>', ':Lspsaga outline<CR>',opt)
-- For Preview Markdown
map('n', '<F4>', ':Glow<CR>',opt)
-- nvim tree toggle with F5
map('n', '<F5>', ':NvimTreeToggle<CR>', opt)
-- For Undo Tree
map('n', '<F6>', ':UndotreeToggle<CR>', opt)
