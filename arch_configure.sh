#!/bin/bash

pacman -S nvidia-390xx-utils
pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa
pacman -S --noconfirm xorg-twm xterm xorg-xclock

Xorg :0 -configure
cp /root/xorg.conf.new /etc/X11/xorg.conf
cp /etc/X11/xinit/xinitrc ~/.xinitrc

pacman -S --noconfirm alsa-utils alsa-plugins

pacman -S --noconfirm i3 slim
systemctl enable slim.service