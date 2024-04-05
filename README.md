[#](#) Usage

## Nvim
[Officail Doc for Installation](https://github.com/neovim/neovim/blob/master/INSTALL.md)

## Install repo
```
git clone https://github.com/potatochick2020/nvim-config ~/.config/nvim
```

## [Packer](https://github.com/wbthomason/packer.nvim)
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```
 
Run `:PackerSync` inside nvim

## [RIP grep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

## [Gitui](https://github.com/extrawurst/gitui/releases)
[Binary Download Page](https://github.com/extrawurst/gitui/releases)
```
cp ./gitui_theme.ron ~/.config/gitui/theme.ron
```

## Kitty 
```
cp ./kitty ~/.config/kitty/kitty.conf
```
## i3 
```
cp ./i3 ~/.config/i3/config
```
## picom
```
cp ./picom ~/.config/picom/picom.conf
```

# Other setting
## Set a wallpaper
```
feh --bg-fill ~/wallpaper.png 
```
## To show nvim-tree icon properly, nerd-fonts are required
```
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack
```

-----
Key mapping/ Common key usage until now:

1. `<F5>` to navigate nvim tree (File explorer)
2. `<A-h>/<A-j>/<A-k>/<A-l>` to navigate between window, nvim tree count as a window too
3. `<C-q>/<C-e>` to navigate between buffer in bufferline (similar to tabs in vs code)
4. Disable arrow key in normal mode and insert mode, use `<C-h>/<C-j>/<C-k>/<C-l>`to navigate in insert mode
5. press a in normal mode to enter insert mode with cursor being after the current char
6. space as leader key, space + fg/ff/fb/fh for telescope
7. `<F6>` to navigate undo tree
8. `<F4>` to navigate markdown preview, <ESC> to close
9. `<S-t>` Toggle terminal
10. `<S-g>` Toggle terminal with gitui
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
 
