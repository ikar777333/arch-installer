#!/bin/bash

#Set timezone
ln -sf /usr/share/Europe/Moscow /etc/localtime
hwclock --systohc --localtime

#set locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

#set font
sed -i '1i FONT=UniCyr_8x16 \n' /etc/vconsole.conf

#set name of pc
echo "deus" > /etc/hostname
sed -i '1i 127.0.0.1 deus.localdomain deus \n' /etc/hosts

#set initcpio
mkinitcpio -p linux

#set superuser
passwd

#set user
useradd -m -g users -G wheel -s /bin/bash ikar
passwd 
sed -i 's/^# *\(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers

#set load
pacman -Sy os-prober grub efibootmgr
mkdir /boot/efi
mkdir /boot/grub
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

#finish
exit