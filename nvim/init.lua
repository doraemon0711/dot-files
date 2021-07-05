--[[
---------------------------------------------------------------
Maintainer:     Tobias Johansson (TobiasDev)
Repo:           https://github.com/TobiasDev/dot-files
NeoVim:         ^0.5
Version:        0.1.0
Changes:        Trying to convert my init.vim to init.lua
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

---------------------------------------------------------------
-- Plugin-manager (paq)
---------------------------------------------------------------
require 'paq-nvim' {
    'savq/paq-nvim';                  -- Let Paq manage itself, after first install
------------------------------------------
-- Style
------------------------------------------
    'rktjmp/gruvbox.nvim';
    'npxbr/lush.nvim';
------------------------------------------
-- Development
------------------------------------------
    'neovim/nvim-lspconfig';
    'nvim-treesitter/nvim-treesitter';
    'hrsh7th/nvim-compe';
    'windwp/nvim-autopairs';
    'TimUntersberger/neogit';
    'kabouzeid/nvim-lspinstall';
------------------------------------------
-- Nice other things
------------------------------------------
    'junegunn/fzf';
    'junegunn/fzf.vim';
    'nvim-lua/plenary.nvim';
    'nvim-lua/popup.nvim';
    'nvim-telescope/telescope.nvim';
    'hoob3rt/lualine.nvim';
    'habamax/vim-godot';
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
require'lspconfig'.pyright.setup{}
require'lspconfig'.gdscript.setup{}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


----------------------------------------------------------------
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


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
