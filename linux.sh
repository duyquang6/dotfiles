# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

# setup vim
# ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ln -s $(pwd)/lvim/config.lua ~/.config/lvim/config.lua
ln -s $(pwd)/lvim/lua ~/.config/lvim/lua
ln -s $(pwd)/lvim/lsp-settings ~/.config/lvim/lsp-settings

# setup alacritty
mkdir -p $(pwd)/alacritty/
ln -s $(pwd)/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
