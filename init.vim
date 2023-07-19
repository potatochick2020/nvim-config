"Basic Configuration
lua require('basic')
lua require('plugins')
lua require('plugin-config/nvim-tree')
lua require('Plugin-config/bufferline')
lua require('Plugin-config/color-theme')
lua require('Plugin-config/status-bar')
lua require('Plugin-config/startup-theme')
lua require('Plugin-config/markdown-preview')
call plug#begin()
" Multi Cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Highlight ALL TODO 
Plug 'sakshamgupta05/vim-todo-highlight'
" 按 <F6> 可以回朔到開啟檔案以來的任何歷史，還會標出修改的地方，很酷
Plug 'mbbill/undotree'
call plug#end()
