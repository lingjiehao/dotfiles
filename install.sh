#! /bin/sh

cd $HOME

sudo apt install silversearcher-ag \
	tmux

ln -s $HOME/.dotfiles/vimrc .vimrc
ln -s $HOME/.dotfiles/tmux.conf tmux.conf
ln -s $HOME/.dotfiles/gitconfig .gitconfig
ln -s $HOME/.dotfiles/bashrc .bashrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
