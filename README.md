# Install Packer
# Install Life Grep

# Install nvimtree + bufferline

# Install a color theme 
https://github.com/nyoom-engineering/oxocarbon.nvim
# Install a status line + winbar 
https://github.com/nvim-lualine/lualine.nvim

# Install Wakatime

# Install Start up theme
https://github.com/echasnovski/mini.starter

# Install telescope.nvim
https://github.com/nvim-lua/plenary.nvim
https://github.com/nvim-telescope/telescope.nvim
# Install common tools for searching / these tools are used by telescope
https://github.com/BurntSushi/ripgrep
https://github.com/sharkdp/fd
# Install nvim treesitter
https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
# Install markdown-preview
https://github.com/toppair/peek.nvim
https://deno.land/
-----
Key mapping/ Common key usage until now:

1. <F5> to navigate nvim tree (File explorer)
2. Alt + hjkl to navigate between window, nvim tree count as a window too
3. ctrl + qe to navigate between buffer in bufferline (similar to tabs in vs code)
4. Disable arrow key in normal mode and insert mode, use ctrl + hjkl to navigate in insertmode, use ctrl + wbx in insertmode to perform wbx
5. press a in normal mode to enter insert mode with cursor being after the current char
6. space as leader key, space + fg/ff/fb/fh for telescope
7. <F6> to navigate undo tree

-----

# Potential Issues
## Get the most update version
The version in debian-based apt repository is v0.6.1 which as at 2023 July, the most update version is v0.9.1 for stable release.

## Case Sensitive File System
Windows and Mac are Case - Insensitive file system by default, and Linux are Case - Sensitive, it might leads to some issues

## Search where will be your path 
In nvim normal mode type `:help vimrc-intro`

It state the 2 default file path
- ~/.config/nvim/init.vim         (Unix and OSX) 
- ~/AppData/Local/nvim/init.vim   (Windows) 
 
