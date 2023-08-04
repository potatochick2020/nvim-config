# Dependency

[Packer](https://github.com/wbthomason/packer.nvim)
[RIP grep](https://github.com/BurntSushi/ripgrep)
Install nerd font in terminal 

-----
Key mapping/ Common key usage until now:

1. <F5> to navigate nvim tree (File explorer)
2. Alt + hjkl to navigate between window, nvim tree count as a window too
3. ctrl + qe to navigate between buffer in bufferline (similar to tabs in vs code)
4. Disable arrow key in normal mode and insert mode, use ctrl + hjkl to navigate in insertmode, use ctrl + wbx in insertmode to perform wbx
5. press a in normal mode to enter insert mode with cursor being after the current char
6. space as leader key, space + fg/ff/fb/fh for telescope
7. <F6> to navigate undo tree
8. <F4> to navigate markdown preview, <ESC> to close
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
 
