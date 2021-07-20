-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  	use 'wbthomason/packer.nvim'    -- Packer can manage itself
    ------------------------------------------
    -- Style
    ------------------------------------------
    use {
        'npxbr/gruvbox.nvim', 
        requires = {'rktjmp/lush.nvim'}
    }
    use 'hoob3rt/lualine.nvim'

    ------------------------------------------
    -- Development
    ------------------------------------------
    -- use 'neovim/nvim-lspconfig'
    -- use 'nvim-treesitter/nvim-treesitter'
    -- use 'hrsh7th/nvim-compe'
    use 'neoclide/coc.nvim' 
    use 'windwp/nvim-autopairs'
    use 'habamax/vim-godot'
    use 'b3nj5m1n/kommentary'
    use 'godlygeek/tabular'
    use 'TimUntersberger/neogit'

    ------------------------------------------
    -- Nice to have other things 
    ------------------------------------------
    use {
        'nvim-telescope/telescope.nvim', 
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'plasticboy/vim-markdown'


    use { 
        "vhyrro/neorg",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                my_workspace = "~/neorg"
                            }
                        }
                    }
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }
end)
