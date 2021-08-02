--[[
---------------------------------------------------------------
Maintainer:     Tobias Johansson (TobiasDev)
Repo:           https://github.com/TobiasDev/dot-files
NeoVim:         ^0.5
Version:        0.1.1
Changes:        Updating font and cleaning
Windows:        C:\Users\USERNAME\AppData\Local\nvim\
Linux:          .config\nvim\
---------------------------------------------------------------
--]]

---------------------------------------------------------------
-- HOST - Windows 10 specific
---------------------------------------------------------------
vim.g.python3_host_prog = "C:/Scoop/apps/python/current/python.exe"

-- Make sure we have packer installed before using it!
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

---------------------------------------------------------------
-- Plugin-manager (Packer)
---------------------------------------------------------------
require "plugins"
------------------------------------------
-- Make sure plugins are used
------------------------------------------
require('lualine').setup()
require('nvim-autopairs').setup()
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
vim.o.guifont = "Fira\\Code Font:h12"
vim.o.completeopt = "menuone,noselect"
vim.o.cmdheight = 2
vim.o.updatetime = 300

-- Change TAB to be similar to VS Code
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

---------------------------------------------------------------
-- Plugin settings
---------------------------------------------------------------
vim.g.vim_markdown_folding_disabled = 1

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

-- Move splits left and right
map('n', '<Leader>h', '<esc><C-w>R')
map('n', '<Leader>l', '<esc><C-w>r')

------------------------------------------
-- Copy paste behaviour
------------------------------------------
map('i', '<C-v>', '<esc>"+pi')
map('v', '<C-c>', '"+y')

------------------------------------------
-- Telescope 
------------------------------------------
map('n', '<C-f>', '<cmd>:Telescope current_buffer_fuzzy_find<CR>')
map('n', '<Leader>f', '<cmd>:Telescope grep_string<CR>')
map('n', '<C-g>', '<cmd>:Telescope find_files<CR>')
map('n', '<Leader>g', '<cmd>:Telescope live_grep<CR>')
map('n', '<Leader>b', '<cmd>:Telescope file_browser<CR>')
map('n', '<Leader>h', '<cmd>:Telescope oldfiles<CR>')

------------------------------------------
-- Godot
------------------------------------------
map('n', '<M-g>', '<cmd>:GodotRun<CR>')
