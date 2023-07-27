local header_art = 
[[

   ___  ___  _____  _   _____  ___  ___        _____  ___       ____   ___ ____   ___  
  / _ \/___\/__   \/_\ /__   \/___\/ __\ /\  /\\_   \/ __\ /\ /\___ \ / _ \___ \ / _ \ 
 / /_)//  //  / /\//_\\  / /\//  // /   / /_/ / / /\/ /   / //_/ __) | | | |__) | | | |
/ ___/ \_//  / / /  _  \/ / / \_// /___/ __  /\/ /_/ /___/ __ \ / __/| |_| / __/| |_| |
\/   \___/   \/  \_/ \_/\/  \___/\____/\/ /_/\____/\____/\/  \/|_____|\___/_____|\___/ 
                                                                                       

]]

local function OpenNvimTree()
	vim.cmd("NvimTreeOpen")
end

-- using the mini plugins
require('mini.sessions').setup({
  -- Whether to read latest session if Neovim opened without file arguments
  autoread = false,
  -- Whether to write current session before quitting Neovim
  autowrite = false,
  -- Directory where global sessions are stored (use `''` to disable)
  directory =  'C:/Users/ryancheung/AppData/Local/nvim-data/sessions',
  -- File for local session (use `''` to disable)
  file = 'Session.vim', -- 'Session.vim',
   -- Whether to force possibly harmful actions (meaning depends on function)
  force = { read = false, write = true, delete = false },
    -- Hook functions for actions. Default `nil` means 'do nothing'.
  hooks = {
    -- Before successful action
    pre = { read = nil, write = nil, delete = nil },
    -- After successful action
    post = { read = OpenNvimTree, write = nil, delete = nil },
  },
})

local starter = require('mini.starter')
starter.setup({
  -- evaluate_single = true,
  items = {''},
  content_hooks = {
    function(content)
      local blank_content_line = { { type = 'empty', string = '' } }
      local section_coords = starter.content_coords(content, 'section')
      -- Insert backwards to not affect coordinates
      for i = #section_coords, 1, -1 do
        table.insert(content, section_coords[i].line + 1, blank_content_line)
      end
      return content
    end,
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.aligning('center', 'center'),
  },
  header = header_art,
  footer = '' ,
  silent = false,
})
