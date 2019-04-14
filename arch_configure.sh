#!/bin/bash

sudo pacman -S --noconfirm xf86-video-vesa 
sudo pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa 
sudo pacman -S --noconfirm termite

cd /home/ikar/
Xorg :0 -configure
sudo cp /root/xorg.conf.new /etc/X11/xorg.conf

sudo pacman -S --noconfirm alsa-utils alsa-plugins 
sudo pacman -S --noconfirm ranger wget chromium 

#Visual install
sudo pacman -S --noconfirm i3 slim rofi feh neovim neofetch cmus htop thunar w3m node npm powerline-fonts maven rxvt-unicode
sudo systemctl enable slim.service

#Yey install
cd /home/ikar/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#Polybar install
yay -S polybar

#Vim setup
yay -S neovim-plug
mkdir /home/ikar/.config/nvim
sudo cp /arch_installer_scripts/configs/nvim/init.vim /home/ikar/.config/nvim/

yay -S visual-studio-code-bin
yay -S jdk
yay -S ttf-dejavu-sans-mono-powerline-git

#copy configs files
mkdir /home/ikar/.config
sudo cp /arch_installer_scripts/configs/.xinitrc /home/ikar/
mkdir /home/ikar/.config/rofi
sudo cp /arch_installer_scripts/configs/rofi/config /home/ikar/.config/rofi/
mkdir /home/ikar/.config/polybar
sudo cp /arch_installer_scripts/configs/polybar/config /home/ikar/.config/polybar/
mkdir /home/ikar/.config/i3
sudo cp -i /arch_installer_scripts/configs/i3/config /home/ikar/.config/i3/
sudo cp -i /arch_installer_scripts/configs/.Xresources /home/ikar/
sudo cp -i -R /arch_installer_scripts/configs/ranger /home/ikar/.config/
sudo cp -R /arch_installer_scripts/configs/walls /home/ikar/.config/walls

#Zsh install
sudo pacman -S --noconfirm zsh
sudo chsh -s /bin/zsh ikar
sudo chsh -s /bin/zsh root
zsh /arch_installer_scripts/install.sh

sudo rm -R /arch_installer_scripts
rm -R /home/ikar/yay