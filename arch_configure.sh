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
sudo pacman -S --noconfirm i3 slim rofi feh neovim
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

#Polybar install
sudo yay -S polybar

#Vim setup
sudo yay -S neovim-plug
mkdir /home/ikar/.config/neovim
sudo cp /arch_installer_scripts/configs/neovim/init.vim /home/ikar/.config/neovim/

sudo yay -S visual-studio-code-bin

#copy configs files
sudo cp /arch_installer_scripts/configs/.xinitrc /home/ikar/
mkdir /home/ikar/.config/rofi
sudo cp /arch_installer_scripts/configs/rofi/config /home/ikar/.config/rofi/
mkdir /home/ikar/.config/polybar
sudo cp /arch_installer_scripts/configs/polybar/config /home/ikar/.config/polybar/