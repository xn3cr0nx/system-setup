#!/bin/bash

sudo apt update && \ 
  sudo apt upgrade && \
  sudo apt install -y curl wget vim git terminator zsh fonts-powerline tmux rubygems         

# install dev utils and deps
sudo apt install -y software-properties-common apt-transport-https libclang-dev libudev-dev ffmpeg ruby-dev libpq-dev postgresql-client

# install gnome tweak deps
sudo apt install -y gnome-tweak-tool gnome-shell-extension-system-monitor xdotool

# install autocpu-freq
git clone https://github.com/AdnanHodzic/auto-cpufreq.git && cd auto-cpufreq && sudo ./auto-cpufreq-installer && cd .. && rm -rf auto-cpufreq

# set zsh as primary terminal
chsh -s $(which zsh)
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# instal tmuxinator
gem install tmuxinator

# install docker
sudo apt install -y apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco test"
sudo apt update && sudo apt install -y docker-ce
sudo usermod -aG docker xn3cr0nx
# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install node through nvm
mkdir $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
echo export NVM_DIR="$HOME/.nvm" \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" >> $HOME/.zshrc
nvm install node
# install lts versions
nvm install lts/erbium
nvm install lts/fermium

# Install telegram
wget https://telegram.org/dl/desktop/linux
mv tsetup.1.8.2.tar.xz ~/Apps
# then extract it by hand, some problem with xz file

# Install OBS
sudo add-apt-repository ppa:obsproject/obs-studio && \
  sudo apt update && \
  sudo apt install obs-studio
