#!/bin/bash

pacman -S --noconfirm xf86-video-vesa
pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa
pacman -S --noconfirm xterm

sudo -u ikar Xorg :0 -configure
sudo -u ikar cp /root/xorg.conf.new /etc/X11/xorg.conf
sudo -u ikar cp /etc/X11/xinit/xinitrc ~/.xinitrc

pacman -S --noconfirm alsa-utils alsa-plugins
pacman -S --noconfirm ranger wget chromium 

#Visual install
pacman -S --noconfirm i3 slim rofi polybar feh
systemctl enable slim.service

#Zsh install
pacman -S --noconfirm zsh
sudo -u ikar zsh
chsh -s /bin/zsh root
chsh -s /bin/zsh ikar
sudo -u ikar wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

#Yey install
sudo -u ikar git clone https://aur.archlinux.org/yay.git
sudo -u ikar cd yay
sudo -u ikar makepkg -si

#copy configs files