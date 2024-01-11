#!/usr/bin/bash

# VIM 

# TODO: persian-vim palette

# check if ~/.vim/colors exists
if [ ! -d ~/.vim/colors ]
then
  mkdir ~/.vim/colors
fi

# copy the monokai theme
if [ ! -f ~/.vim/colors/monokai.vim ]
then
  git clone git@github.com:ku1ik/vim-monokai.git
  cp vim-monokai/colors/monokai.vim ~/.vim/colors/
  rm -rf vim-monokai
fi

# copy the vimrc
cp ~/.vimrc ~/.vimrc.bk # make a backup first
cp vimrc ~/.vimrc

# check if vim-plug exists
if [ ! -f ~/.vim/autoload/plug.vim ] 
then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# check if fonts folder exists
if [ ! -d ~/.local/share/fonts ]
then
  mkdir -p ~/.local/share/fonts
fi

git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
rm -rf fonts

# installing fonts
#if [ -f ~/.local/share/fonts/MononokiNerdFontMono-Regular.ttf ] 
#then
#  cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz 
#  tar xf JetBrainsMono.tar.xz 
#  rm -rf JetBrainsMono.tar.xz
#  rm -rf LICENCE.txt
#  rm -rf LICENCE
#  rm -rf README.md
#fi

# install plugins
vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall

# Tmux

# TODO: tmux configs