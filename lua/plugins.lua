return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- nvim-tree
    use {
         'kyazdani42/nvim-tree.lua',
         requires = 'kyazdani42/nvim-web-devicons'
    }
    -- bufferline (新增)
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- color scheme
    use {'nyoom-engineering/oxocarbon.nvim'}
    -- status bar and win bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- wakatime
    use 'wakatime/vim-wakatime'
    -- start up theme
    use { 'echasnovski/mini.nvim', branch = 'stable' }
    -- Telescope
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- nvim-tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- Undo tree
    use 'mbbill/undotree'
    -- Markdown preview
    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
end)
