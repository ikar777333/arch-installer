#!/bin/bash

#Set timezone
ln -sf /usr/share/Europe/Moscow /etc/localtime
hwclock --systohc --localtime

#Setup locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

#Setup name of pc
echo "deus" > /etc/hostname
sed -i '1i 127.0.0.1 deus.localdomain deus \n' /etc/hosts

#Setup initcpio
mkinitcpio -p linux

#Setup superuser
passwd

#Setup user
useradd -m -g users -G wheel -s /bin/bash ikar
passwd 
sed -i 's/^# *\(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers

#Setup load
pacman -S --noconfirm refind-efi 
refind-install
mkrlconf

#Setup packages
pacman -S --noconfirm git dialog wpa_supplicant vim bash-completion

sh arch_configure.sh

#finish
exit