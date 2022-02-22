#!/bin/bash

if ! type git >/dev/null ; then
    echo 'You must install git.'
    exit 1
fi

if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo 'installed vim-plug'
fi

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# For neovim
mkdir -p ~/.config
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/.vim $HOME/.config/nvim
ln -sf $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
if [ ! -d $HOME/.vim/ftplugin ]; then
    ln -sf $HOME/dotfiles/ftplugin $HOME/.vim/ftplugin
fi
ln -sf $HOME/dotfiles/filetype.vim $HOME/.vim/filetype.vim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.ctags $HOME/.ctags
