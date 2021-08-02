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
end)
