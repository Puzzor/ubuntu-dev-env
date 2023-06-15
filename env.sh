#!/bin/bash
sudo apt-get update
sudo apt-get install zsh -y
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
# install zsh
sudo apt-get install tmux -y
echo "tmux finish!"
# install oh my tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo "set -g mouse on" >> ~/.tmux.conf.local
# install plugins 
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export ZSH_CUSTOM
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM}"/plugins/zsh-history-substring-search
sed -i 's/^plugins=.*/plugins=(git\n extract\n sudo\n autojump\n jsontools\n colored-man-pages\n zsh-autosuggestions\n zsh-syntax-highlighting\n zsh-history-substring-search\n)/g' ~/.zshrc
# Install powerlevel10k and configure it.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}"/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
# Move ".zcompdump-*" file to "$ZSH/cache" directory.
sed -i -e '/source \$ZSH\/oh-my-zsh.sh/i export ZSH_COMPDUMP=\$ZSH\/cache\/.zcompdump-\$HOST' ~/.zshrc
# Configure the default ZSH configuration for new users.
sudo cp ~/.zshrc /etc/skel/
sudo cp ~/.p10k.zsh /etc/skel/
sudo cp -r ~/.oh-my-zsh /etc/skel/
sudo chmod -R 755 /etc/skel/
sudo chown -R root:root /etc/skel/
chsh -s $(which zsh)
zsh
