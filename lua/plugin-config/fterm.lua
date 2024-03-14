vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

local fterm = require("FTerm")

local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set('n', '<S-g>', function()
    gitui:toggle()
end)

vim.keymap.set('n', '<S-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<S-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
