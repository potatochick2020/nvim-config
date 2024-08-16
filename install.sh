#!/bin/bash

# Copy and overwrite ./lvim/config.lua to the LunarVim config directory
cp -f ./lvim/config.lua ~/.config/lvim/config.lua

# Copy and overwrite ./lvim/kitty.conf to the kitty config
cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf

# Function to check and add alias if it doesn't already exist
add_alias_if_missing() {
    local alias_command="alias $1='lvim'"
    local rc_file="$2"

    # Check if the alias is already present in the file
    if grep -Fxq "$alias_command" "$rc_file"; then
        echo "Alias $1 already exists in $rc_file, skipping..."
    else
        echo "$alias_command" >> "$rc_file"
        echo "Alias $1 added to $rc_file"
    fi
}

# Add aliases for vim and nvim to use lvim
add_alias_if_missing "vim" "$HOME/.bashrc"
add_alias_if_missing "nvim" "$HOME/.bashrc"

if [ -f "$HOME/.zshrc" ]; then
    add_alias_if_missing "vim" "$HOME/.zshrc"
    add_alias_if_missing "nvim" "$HOME/.zshrc"
fi

# Reload the shell configuration to apply the aliases immediately
if [ "$SHELL" = "/bin/bash" ]; then
    source "$HOME/.bashrc"
elif [ "$SHELL" = "/bin/zsh" ]; then
    source "$HOME/.zshrc"
fi

# Confirm success
echo "Copied ./lvim/config.lua to ~/.config/lvim/config.lua"
echo "Alias setup complete!"
