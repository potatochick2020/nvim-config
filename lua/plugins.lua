return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- color scheme
    use {'nyoom-engineering/oxocarbon.nvim'}
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
    -- wakatime
    use 'wakatime/vim-wakatime'
    -- start up theme
    use {'rmagatti/auto-session'}
    use { 'echasnovski/mini.nvim', branch = 'stable' }
    -- mark visualization
    use 'jeetsukumaran/vim-markology'
    -- Multi Cursor  
    use {'mg979/vim-visual-multi', branch = 'master'}
    -- Hightlight TODO    
    use 'sakshamgupta05/vim-todo-highlight'


    -- LSP / Source COde / Syntax Highlight
    -- LSP config
    --Nvim LSP 客户端的快速入门配置
--    use "neovim/nvim-lspconfig"
--    --自动提示插件
--    use {
--      "hrsh7th/nvim-cmp",
--      requires = {
--        "hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
--        "hrsh7th/cmp-buffer", --从buffer中智能提示
--        "hrsh7th/cmp-path" --自动提示硬盘上的文件
--      }
--    }
--    -- 代码段提示
--    use {
--      "L3MON4D3/LuaSnip",
--      requires = {
--        "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
--        "rafamadriz/friendly-snippets" --代码段合集
--      }
--    }
--    -- java语言支持jdtls扩展插件，在lsp基础上扩展了一些实用的内容
--    use "mfussenegger/nvim-jdtls"
    -- nvim-tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
use {
    'nvim-treesitter/playground',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    cmd = 'TSPlaygroundToggle',
    config = function()
        R'nvim-treesitter.configs'.setup({})
    end,
}
end)
