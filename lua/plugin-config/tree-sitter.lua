require 'nvim-treesitter.install'.compilers = {"zig"}

require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"c","cpp","html", "css", "vim", "lua", "javascript", "typescript", "tsx" , "java"},
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
