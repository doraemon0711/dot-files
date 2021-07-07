--[[
---------------------------------------------------------------
Maintainer:     Tobias Johansson (TobiasDev)
Repo:           https://github.com/TobiasDev/dot-files
NeoVim:         ^0.5
Version:        0.1.0
Changes:        Moving to packer and splitting the plugins into it's own .lua file
Windows:        C:\Users\USERNAME\AppData\Local\nvim\
Linux:          .config\nvim\

Possible plugins
- https://github.com/ray-x/lsp_signature.nvim
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
require 'plugins'

------------------------------------------
-- Style (we load this first to make sure all plugins use it)
------------------------------------------
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

------------------------------------------
-- Requirments
------------------------------------------
require('lualine').setup()
require('nvim-autopairs').setup()

---------------------------------------------------------------
-- Settings
---------------------------------------------------------------
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
vim.o.completeopt = "menuone,noselect"

-- Change TAB to be similar to VS Code
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

---------------------------------------------------------------
-- Plugin settings
---------------------------------------------------------------
------------------------------------------
-- nvim-lspconfig
------------------------------------------
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gdscript', 'html' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

------------------------------------------
-- nvim-compe
------------------------------------------
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

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
-- Telescope 
------------------------------------------
map('n', '<C-f>', '<cmd>:Telescope current_buffer_fuzzy_find<CR>')
map('n', '<Leader>f', '<cmd>:Telescope grep_string<CR>')
map('n', '<C-g>', '<cmd>:Telescope find_files<CR>')
map('n', '<Leader>g', '<cmd>:Telescope live_grep<CR>')
map('n', '<Leader>b', '<cmd>:Telescope file_browser<CR>')
map('n', '<Leader>h', '<cmd>:Telescope oldfiles<CR>')
