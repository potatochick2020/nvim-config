return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- color scheme
    use ({ 'projekt0n/github-nvim-theme' }) 
    -- nvim-tree
    use {
         'kyazdani42/nvim-tree.lua',
         requires = 'kyazdani42/nvim-web-devicons'
    }
    -- bufferline 
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- Undo tree
    use 'mbbill/undotree'
    -- status bar 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Telescope
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Markdown preview
    use "ellisonleao/glow.nvim"
    -- start up theme
    use {'rmagatti/auto-session'}
    use { 'echasnovski/mini.nvim', branch = 'stable' }
    -- mark visualization
    use 'jeetsukumaran/vim-markology'
    -- Multi Cursor  
    use {'mg979/vim-visual-multi', branch = 'master'}
    -- Hightlight TODO    
    use 'sakshamgupta05/vim-todo-highlight'
    -- Any jump 
    use 'pechorin/any-jump.vim'
    -- hop https://github.com/phaazon/hop.nvim
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup {}
        end
    }
    -- vimwiki
    use {'vimwiki/vimwiki'}
    -- Fterm
    use "numToStr/FTerm.nvim"
    -- pandoc
    use {
        'aspeddro/pandoc.nvim',
        config = function()
            require'pandoc'.setup()
        end
    }
end)
