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
vim.cmd [[command! ScriptRemoveAllEmptyLines :g/^$/d]]
vim.cmd [[command! ScriptRemoveMultipleEmptyLines :g/^\_$\n\_^$/d]]
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

-- Switch buffer
lvim.keys.normal_mode["<S-q>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-e>"] = ":BufferLineCycleNext<CR>"

-- Marks
lvim.keys.normal_mode["["] = "m["
lvim.keys.normal_mode["]"] = "m]"

-- Telescope
lvim.builtin.which_key.mappings["f"] = {
    name = "Find",
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
    }
}

-- #AUTO COMMAND
-- auto format on save
lvim.format_on_save.enabled = true
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
