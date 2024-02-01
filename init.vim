"Basic Configuration
lua require('basic')
lua require('plugins')
"Basic plugins
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/color-theme')
lua require('plugin-config/startup-theme')
lua require('plugin-config/markdown-preview')
lua require('plugin-config/auto-session')
lua require('plugin-config/status-bar')
lua require('plugin-config/hop')
lua require('plugin-config/fterm')

" Vim Plugin Setting
" AnyJump
let g:any_jump_disable_default_keybindings = 1
" Normal mode: Jump to definition under cursor
nnoremap <leader><leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader><leader>j :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader><leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader><leader>al :AnyJumpLastResults<CR>
