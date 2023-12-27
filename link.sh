#!/bin/sh
ln -sfn $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -sfn $HOME/.dotfiles/vimrc.plugins $HOME/.vimrc.plugins
ln -sfn $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sfn $HOME/.dotfiles/tmux.status.conf $HOME/.tmux.status.conf
ln -sfn $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -sfn $HOME/.dotfiles/scm_breeze $HOME/.scm_breeze
mkdir -p $HOME/.tmux/plugins
ln -sfn $HOME/.dotfiles/tpm $HOME/.tmux/plugins/tpm
