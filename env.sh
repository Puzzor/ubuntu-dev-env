#!/bin/bash
sudo apt-get update
sudo apt-get install zsh
chsh -s $(which zsh)
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
# install zsh
sudo apt-get install tmux
echo "tmux finish!"
# install oh my tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# install plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh
