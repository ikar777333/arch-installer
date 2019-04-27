#!/bin/bash

sudo pacman -S --noconfirm xf86-video-vesa 
sudo pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa 
sudo pacman -S --noconfirm termite

cd /home/ikar/
Xorg :0 -configure
sudo cp /root/xorg.conf.new /etc/X11/xorg.conf

sudo pacman -S --noconfirm alsa-utils alsa-plugins 
sudo pacman -S --noconfirm ranger wget chromium 
sudo pacman -S --noconfirm termite neovim neofetch cmus htop thunar w3m nodejs npm maven rxvt-unicode urxvt-perls lxappearance-gtk3 
sudo pacman -S --noconfirm i3-gaps slim rofi feh python-pywal xcompmgr
sudo pacman -S --noconfirm ttf-ubuntu-font-family zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps tmux
sudo systemctl enable slim.service

#Yey install
cd /home/ikar/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si

#Polybar install
yay -S --noconfirm polybar

#Vim setup
yay -S --noconfirm neovim-plug
yay -S --noconfirm visual-studio-code-bin
yay -S --noconfirm jdk8
yay -S --noconfirm urxvt-font-size-git
yay -S --noconfirm i3lock-color
zsh refind-theme-regular.sh

#Zsh install
sudo pacman -S --noconfirm zsh
sudo chsh -s /bin/zsh ikar
sudo chsh -s /bin/zsh root
sh /arch_installer_scripts/oh-my-zsh.sh

