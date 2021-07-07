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
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-compe'
    use 'windwp/nvim-autopairs'
    use 'habamax/vim-godot'

    ------------------------------------------
    -- Nice to have other things 
    ------------------------------------------
    use {
        'nvim-telescope/telescope.nvim', 
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'


end)
