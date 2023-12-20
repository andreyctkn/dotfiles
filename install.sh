#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

echo "\n[Repo Init]: ⏳ \n"

export DEV_DIR="$HOME/Dev"
mkdir -p $DEV_DIR
cd $DEV_DIR
git clone --recursive https://github.com/andreyctkn/dotfiles.git
cd dotfiles

echo "\n[Repo Init]: 👌 \n"

echo "[Symlinking config files]: ⏳ \n"
sh etc/symlink-dotfiles.sh
echo "\n[Symlinking config files]: 👌 \n"

echo "\n[install brew | openjdk | nodejs | nvm]: ⏳ \n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install node

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install JVM via https://gist.github.com/gwpantazes/50810d5635fc2e053ad117b39b597a14 
brew install openjdk
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
echo "\n[install brew | openjdk | nodejs | nvm]: 👌 \n"