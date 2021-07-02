--[[
---------------------------------------------------------------
Maintainer:     Tobias Johansson (TobiasDev)
Repo:           https://github.com/TobiasDev/dot-files
NeoVim:         ^0.5
Version:        0.1.0
Changes:        Trying to convert my init.vim to init.lua
Windows:        C:\Users\USERNAME\AppData\Local\nvim\
Linux:          .config\nvim\
---------------------------------------------------------------
--]]

---------------------------------------------------------------
-- HOST - Windows 10 specific
---------------------------------------------------------------
vim.g.python3_host_prog = "C:/Scoop/apps/python/current/python.exe"

---------------------------------------------------------------
-- Plugin-manager (paq)
---------------------------------------------------------------
require 'paq-nvim' {
    'savq/paq-nvim';                  -- Let Paq manage itself
------------------------------------------
-- Style
------------------------------------------
    'rktjmp/gruvbox.nvim';
    'npxbr/lush.nvim';
------------------------------------------
-- Development
------------------------------------------
    'neovim/nvim-lspconfig';
    'nvim-lua/completion-nvim';
    'nvim-treesitter/nvim-treesitter';
    'p00f/nvim-ts-rainbow';
    'windwp/nvim-autopairs';
    'TimUntersberger/neogit'; 
------------------------------------------
-- Nice other things
------------------------------------------
    'junegunn/fzf';
    'junegunn/fzf.vim';
    'nvim-lua/plenary.nvim';
    'nvim-lua/popup.nvim';
    'nvim-telescope/telescope.nvim';
    'hoob3rt/lualine.nvim';
}

---------------------------------------------------------------
-- Requirments
---------------------------------------------------------------
require('nvim-autopairs').setup()
require('lualine').setup()
require('neogit').setup()

---------------------------------------------------------------
-- Settings
---------------------------------------------------------------
------------------------------------------
-- Style
------------------------------------------
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

------------------------------------------
-- Other
------------------------------------------
vim.o.number = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.signcolumn = "yes"

-- Change TAB to be similar to VS Code
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

------------------------------------------
-- Plugins
------------------------------------------

---------------------------------------------------------------
-- Shortcuts
---------------------------------------------------------------
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------------------------------------------
-- DIFF Specifics
------------------------------------------
-- Go between diffs
map('n', '<Leader>j', '<esc>]c')
map('n', '<Leader>k', '<esc>[c')

------------------------------------------
-- Splits
------------------------------------------
-- Jumping between splits 
map('n', '<S-h>', '<esc><C-w>h')
map('n', '<S-l>', '<esc><C-w>l')

-- Move between split
map('n', '<Leader>h', '<esc><C-w>R')
map('n', '<Leader>l', '<esc><C-w>r')

------------------------------------------
-- Copy paste behaviour
------------------------------------------
map('i', '<C-v>', '<esc>"+pi')
map('v', '<C-c>', '"+y')

------------------------------------------
-- Adding shortcuts to open files and such
------------------------------------------
map('n', '<C-f>', '<cmd>BLines<CR>')
map('n', '<Leader>f', '<cmd>:Telescope grep_string<CR>')
map('n', '<C-g>', '<cmd>:Telescope find_files<CR>')
map('n', '<Leader>g', '<cmd>:Telescope live_grep<CR>')
map('n', '<Leader>b', '<cmd>Telescope file_browser<CR>')
