#!/bin/bash

pacman -S --noconfirm xf86-video-fbdev
pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa
pacman -S --noconfirm xorg-twm xterm xorg-xclock

Xorg :0 -configure
cp /root/xorg.conf.new /etc/X11/xorg.conf

pacman -S --noconfirm alsa-utils alsa-plugins