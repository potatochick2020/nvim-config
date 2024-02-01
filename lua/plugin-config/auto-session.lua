require('auto-session').setup {
    pre_save_cmds = {":NvimTreeCollapse"},
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {},
    auto_session_use_git_branch = nil,
    log_level = "error",
    cwd_change_handling = {
    restore_upcoming_session = true, 
    pre_cwd_changed_hook = nil,
    post_cwd_changed_hook = function() 
      require("lualine").refresh() 
    end,
  },
}
