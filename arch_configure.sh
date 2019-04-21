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
sudo systemctl enable slim.service

#Yey install
cd /home/ikar/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#Polybar install
yay -S polybar

#Vim setup
yay -S --noconfirm neovim-plug
mkdir /home/ikar/.config/nvim
sudo cp /arch_installer_scripts/configs/nvim/init.vim /home/ikar/.config/nvim/

yay -S --noconfirm visual-studio-code-bin
yay -S --noconfirm jdk8
yay -S --noconfirm ttf-dejavu-sans-mono-powerline-git
yay -S --noconfirm urxvt-font-size-git
yay -S --noconfirm i3lock-color

#copy configs files
sudo chown -R ikar:users /arch_installer_scripts/configs
mkdir /home/ikar/.config
cp /arch_installer_scripts/configs/.xinitrc /home/ikar/
mkdir /home/ikar/.config/rofi
cp /arch_installer_scripts/configs/rofi/config /home/ikar/.config/rofi/
mkdir /home/ikar/.config/polybar
cp /arch_installer_scripts/configs/polybar/config /home/ikar/.config/polybar/
mkdir /home/ikar/.config/i3
cp -i /arch_installer_scripts/configs/i3/config /home/ikar/.config/i3/
mkdir /home/ikar/.config/termite
cp /arch_installer_scripts/configs/termite/config /home/ikar/.config/termite
cp -i -R /arch_installer_scripts/configs/ranger /home/ikar/.config/
cp -R /arch_installer_scripts/configs/walls /home/ikar/.config/walls

zsh refind-theme-regular.sh

#Zsh install
sudo pacman -S --noconfirm zsh
sudo chsh -s /bin/zsh ikar
sudo chsh -s /bin/zsh root
sh /arch_installer_scripts/oh-my-zsh.sh
cp -i /arch_installer_scripts/configs/.zshrc /home/ikar/
cp /arch_installer_scripts/spaceship-prompt /home/ikar/.oh-my-zsh/themes
cp /arch_installer_scripts/zsh-autosuggestions /home/ikar/.oh-my-zsh/plugins
cp /arch_installer_scripts/zsh-syntax-highlighting /home/ikar/.oh-my-zsh/plugins