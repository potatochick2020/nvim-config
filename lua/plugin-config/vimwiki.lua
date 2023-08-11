
local window = package.config:sub(1,1) == '\\'
if window then
    vim.g.vimwiki_list = {{path = 'D://git-workspace/vimwiki', syntax = 'markdown', ext = '.md'}}
else 
    vim.g.vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.md'}}
end
