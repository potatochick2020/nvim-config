require 'nvim-treesitter.install'.compilers = {"zig"}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jsp = {
  install_info = {
    url = "C:/Users/ryancheung/Documents/github/tree-sitter-jsp", -- local path or git repo
    files = {"src/parser.c","src/scanner.cc"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "jsp", -- if filetype does not match the parser name
}

require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"c","cpp","html", "css", "vim", "lua", "javascript", "typescript", "tsx" , "java" , "jsp"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
  },
}

-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
