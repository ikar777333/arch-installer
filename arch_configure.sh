#!/bin/bash

sudo pacman -S --noconfirm xf86-video-vesa &
sudo pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa &
sudo pacman -S --noconfirm xterm

cd /home/ikar/
Xorg :0 -configure
sudo cp /root/xorg.conf.new /etc/X11/xorg.conf
sudo cp /arch_installer_scripts/.xinitrc /home/ikar/

sudo pacman -S --noconfirm alsa-utils alsa-plugins &
sudo pacman -S --noconfirm ranger wget chromium &

#Visual install
sudo pacman -S --noconfirm i3 slim rofi feh
#systemctl enable slim.service

#Yey install
cd /home/ikar/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#Zsh install
sudo pacman -S --noconfirm zsh
sudo chsh -s /bin/zsh ikar
sudo chsh -s /bin/zsh root
zsh /arch_installer_scripts/install.sh
#wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

#copy configs files