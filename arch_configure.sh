#!/bin/bash

pacman -S --noconfirm xf86-video-vesa
pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa
pacman -S --noconfirm xterm

Xorg :0 -configure
cp /root/xorg.conf.new /etc/X11/xorg.conf
cp /etc/X11/xinit/xinitrc ~/.xinitrc

pacman -S --noconfirm alsa-utils alsa-plugins

#Visual install
pacman -S --noconfirm i3 slim rofi polybar
pacman -S ranger wget chromium 
systemctl enable slim.service

#Zsh install
pacman -S --noconfirm zsh
zsh
chsh -s /bin/zsh root
chsh -s /bin/zsh ikar
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

#Yey install
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si