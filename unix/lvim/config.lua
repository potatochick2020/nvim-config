--[[LSP
 K	                                hover information (double tap to get inside)	normal
 KK	                                move cursor inside K window	normal
 gd	                                go to definition normal
 gD	                                go to declaration	normal
 gr	                                go to references	normal
 gI	                                go to implementation	normal
 gs	                                show signature help	normal
 gl	                                show line diagnostics	normal
 glgl	                            move cursor inside gl diagnostics window	normal
]]

--[[Editing
<leader>/	                        comment	normal, visual
<leader>j                           hop1char
]]

--[[Mark
 m,                                  Set the next available alphabetical (lowercase) mark
 m]                                  Move to next mark
 m[                                  Move to previous mark
 dmx                                 Delete mark x
 dm-                                 Delete all marks on the current line
 dm<space>                           Delete all marks in the current buffer
 m:                                  Preview mark. This will prompt you for a specific mark to
                                     preview; press <cr> to preview the next mark.
]]

-- Navigate plane(splited windows) : Cltr + h/j/k/l
-- Navigate buffer(tab) : Shift + q/e

-- NvimTree : F5
-- UndoTree : F6
-- Terminal : Cltr + t

--command shortcut
vim.cmd [[command! Qa :qa]]
vim.cmd [[command! Q :q]]
vim.cmd [[command! W :w]]
vim.cmd [[command! Wq :wq]]
vim.cmd [[command! WQ :wq]]
vim.cmd [[command! ScriptRemoveAllEmptyLines :g/^$/d]]
vim.cmd [[command! ScriptRemoveMultipleEmptyLines :g/^\_$\n\_^$/d]]
vim.cmd [[command! ScriptChangeDirectoryToParentOfBuffer :cd %:h]]
vim.cmd [[command! ConfigLvim :e ~/.config/lvim/config.lua]]
-- NvimTree toggle to <F5>
lvim.keys.normal_mode["<F5>"] = ":NvimTreeToggle<CR>"
lvim.keys.insert_mode["<F5>"] = "<C-o>:NvimTreeToggle<CR>"
-- UndoTree toggle to <F6>
lvim.keys.normal_mode["<F6>"] = ":UndotreeToggle<CR>"
lvim.keys.insert_mode["<F6>"] = "<C-o>:UndotreeToggle<CR>"

-- Toggle terminal
-- lvim.builtin.which_key.mappings["t"] = { "<cmd>ToggleTerm direction=float size=50<CR>", "Terminal" }
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm direction=float<CR>"
lvim.keys.term_mode["<C-t>"] = "<C-\\><C-n><C-w>l"

-- Buffer
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<S-q>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-w>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-e>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-r>"] = ":BufferLineMoveNext<CR>"

-- Marks
lvim.keys.normal_mode["["] = "m["
lvim.keys.normal_mode["]"] = "m]"

-- Telescope
lvim.builtin.which_key.mappings["f"] = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Telescope find_files" },
    g = { "<cmd>Telescope live_grep<cr>", "Telescope live_grep" },
    s = { "<cmd>Telescope grep_string<cr>", "Telescope grep_string" },
    t = { "<cmd>Telescope treesitter<cr>", "Telescope Treesitter" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
}
-- Golang
lvim.builtin.which_key.mappings["G"] = {
    name = "Go lang",
    tf = { ":GoTestFunc -F<cr>", "Go Test Function -F" },
    tc = { ":GoTermClose<cr>", "Go Terminal Close" },
}
--[[
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimports()
    end,
    group = format_sync_grp,
})
--]]
-- map redo
lvim.keys.normal_mode["<C-u>"] = "<C-r>"

-- change navigation - Use Cltr + hjkl to navigate
lvim.keys.normal_mode["<Up>"] = ""
lvim.keys.normal_mode["<Down>"] = ""
lvim.keys.normal_mode["<Left>"] = ""
lvim.keys.normal_mode["<Right>"] = ""
lvim.keys.insert_mode["<Up>"] = ""
lvim.keys.insert_mode["<Down>"] = ""
lvim.keys.insert_mode["<Left>"] = ""
lvim.keys.insert_mode["<Right>"] = ""
lvim.keys.insert_mode["<C-Up>"] = ""
lvim.keys.insert_mode["<C-Down>"] = ""
lvim.keys.insert_mode["<C-Left>"] = ""
lvim.keys.insert_mode["<C-Right>"] = ""
lvim.keys.insert_mode["<C-k>"] = "<C-o>k"
lvim.keys.insert_mode["<C-h>"] = "<C-o>h"
lvim.keys.insert_mode["<C-l>"] = "<C-o>l"
lvim.keys.insert_mode["<C-j>"] = "<C-o>j"

-- auto close lvim
lvim.plugins = {
    { 'wakatime/vim-wakatime', lazy = false },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "<leader>j", ":HopChar1<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "<leader>J", ":HopWord<cr>", { silent = true })
        end,
    },
    {
        'mg979/vim-visual-multi',
        branch = 'master'
    },
    {
        'sakshamgupta05/vim-todo-highlight'
    },
    {
        'chentoast/marks.nvim',
        config = function()
            require 'marks'.setup { -- whether to map keybinds or not. default true
                default_mappings = true,
                -- which builtin marks to show. default {}
                builtin_marks = { ".", "<", ">", "^" },
                -- whether movements cycle back to the beginning/end of buffer. default true
                cyclic = true,
                -- whether the shada file is updated after modifying uppercase marks. default false
                force_write_shada = false,
                -- how often (in ms) to redraw signs/recompute mark positions.
                -- higher values will have better performance but may cause visual lag,
                -- while lower values may cause performance penalties. default 150.
                refresh_interval = 250,
                -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
                -- marks, and bookmarks.
                -- can be either a table with all/none of the keys, or a single number, in which case
                -- the priority applies to all marks.
                -- default 10.
                sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
                -- disables mark tracking for specific filetypes. default {}
                excluded_filetypes = {},
                -- disables mark tracking for specific buftypes. default {}
                excluded_buftypes = {},
                -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
                -- sign/virttext. Bookmarks can be used to group together positions and quickly move
                -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
                -- default virt_text is "".
                bookmark_0 = {
                    sign = "⚑",
                    virt_text = "hello world",
                    annotate = false,
                },
                mappings = {}
            }
        end
    },
    {
        'mbbill/undotree'
    },
    -- colorscheme
    {
        'sainnhe/sonokai',
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.sonokai_enable_italic = true
            vim.g.sonokai_style = "espresso"
            lvim.colorscheme = "sonokai"
            require 'lualine'.setup {
                options = {
                    theme = 'sonokai'
                }
            }
        end
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup({
                run_in_floaterm = true,
                floaterm = {               -- position
                    posititon = 'right',   -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
                    width = 0.45,          -- width of float window if not auto
                    height = 0.98,         -- height of float window if not auto
                    title_colors = 'nord', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
                    -- can also set to a list of colors to define colors to choose from
                    -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
                },
            })
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "Shatur/neovim-session-manager",
        lazy = false,
        config = function()
            local present, session_manager = pcall(require, "session_manager")
            if not present then
                return
            end

            local path_present, Path = pcall(require, "plenary.path")
            if not path_present then
                return
            end

            local config = require('session_manager.config')

            session_manager.setup({
                sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
                path_replacer = '__',                                        -- The character to which the path separator will be replaced for session files.
                colon_replacer = '++',                                       -- The character to which the colon symbol will be replaced for session files.
                autoload_mode = { config.AutoloadMode.GitSession, config.AutoloadMode.CurrentDir },
                --autoload_mode = require('session_manager.config').AutoloadMode., -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
                autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
                autosave_ignore_filetypes = {      -- All buffers of these file types will be closed before the session is saved.
                    'gitcommit',
                    'gitrebase',
                },
                autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
                max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
                autosave_last_session = true,
            })

            local config_group = vim.api.nvim_create_augroup('SessionManagerGroup', {})

            vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
                callback = function()
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        -- Don't save while there's any 'nofile' buffer open.
                        if vim.api.nvim_get_option_value("buftype", { buf = buf }) == 'nofile' then
                            return
                        end
                    end
                    session_manager.save_current_session()
                end
            })

            vim.api.nvim_create_autocmd({ 'User' }, {
                pattern = "SessionLoadPost",
                group = config_group,
                callback = function()
                    require('nvim-tree.api').tree.toggle(false, true)
                end,
            })

            vim.api.nvim_create_autocmd({ 'User' }, {
                pattern = "SessionSavePost",
                group = config_group,
                callback = function()
                    require('nvim-tree.api').tree.toggle(false, true)
                end,
            })
        end,
        keys = {
            { "<Leader>ps", "<cmd>SessionManager available_commands<CR>",   desc = "session manager" },
            { "<Leader>pS", "<cmd>SessionManager save_current_session<CR>", desc = "save session" },
        },
        -- Markdown Preview
        {
            "toppair/peek.nvim",
            event = { "VeryLazy" },
            build = "deno task --quiet build:fast",
            config = function()
                require("peek").setup()
                vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
                vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
            end,
        },
    }
}

-- #AUTO COMMAND
-- nvim tree auto close
local function is_modified_buffer_open(buffers)
    for _, v in pairs(buffers) do
        if v.name:match("NvimTree_") == nil then
            return true
        end
    end
    return false
end
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})
vim.api.nvim_create_autocmd("bufWrite", {
    nested = true,
    callback = function()
        vim.cmd([[silent ScriptRemoveMultipleEmptyLines]])
    end,
})
-- #DISPLAY SETTING
lvim.builtin.telescope.pickers = {
    find_files = {
        layout_config = {
            width = 0.95,
        },
    },
    live_grep = {
        layout_config = {
            width = 0.95,
        },
    },
    grep_string = {
        layout_config = {
            width = 0.95,
        },
    },
    treesitter = {
        layout_config = {
            width = 0.95,
        },
    }
}
-- #VIM SETTING
-- Set Tab to 4 space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Disable swap file
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- Hightlight current line
vim.wo.cursorline = true
-- Add Hybrid linue number showing
vim.wo.number = true
vim.wo.relativenumber = true
-- wrap line
vim.o.wrap = true
vim.wo.wrap = true
-- jump to next line if end line
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- search during typing
vim.o.incsearch = true
-- auto format on save
lvim.format_on_save.enabled = true

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
