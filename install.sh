#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

export DEV_DIR="$HOME/Dev"
mkdir -p $DEV_DIR
cd $DEV_DIR
git clone --recursive https://github.com/andreyctkn/dotfiles.git
cd dotfiles
sh etc/symlink-dotfiles.sh
