#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

dir="$HOME/Personal/dev"
mkdir -p $dir
cd $dir
git clone --recursive https://github.com/andreyctkn/dotfiles.git
cd dotfiles
sh etc/symlink-dotfiles.sh
