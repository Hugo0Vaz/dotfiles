-- Packer Config

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- bootstraps packer without needing an install
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- plugin manager
    use 'wbthomason/packer.nvim'

    -- theme
    use 'gruvbox-community/gruvbox'

    -- icons for vim
    -- use 'ryanoasis/vim-devicons'

    -- status line
    use {'hoob3rt/lualine.nvim',
         requires = {'nvim-tree/nvim-web-devicons', opt = true}}

    -- lsp | mason
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        run = ':MasonUpdate',
    }

    -- startpage for vim
    use 'mhinz/vim-startify'

    -- nvim treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- autocomplete
    use 'hrsh7th/nvim-cmp'

    -- autocomplete additional sources
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets engine
    use 'L3MON4D3/LuaSnip'

    -- nerdtree
    use 'preservim/nerdtree'

    -- autopairs
    use 'windwp/nvim-autopairs'

    -- telescope.nvim
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- fugitive.vim
    use 'tpope/vim-fugitive'

    -- Comment.nvim
    use 'numToStr/Comment.nvim'

    -- todo-comments.nvim
    use {'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'}

    -- pretty list for diagnostics
    use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }

    -- luasnipe snippets
    use "rafamadriz/friendly-snippets"

    -- automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
