#!/bin/bash

#Set timezone
ln -sf /usr/share/Europe/Moscow /etc/localtime
hwclock --systohc --localtime

#Setup locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
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
passwd ikar 
sed -i 's/^# *\(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers

#Setup load
pacman -S --noconfirm refind-efi 
refind-install
mkrlconf

#Setup packages
pacman -S --noconfirm git dialog wpa_supplicant vim bash-completion

#Setup network
cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/ethernet-dhcp
sed -i 's/Interface=eth0/Interface=enp0s3/g' /etc/netctl/ethernet-dhcp
netctl enable ethernet-dhcp

#sh arch_configure.sh

#finish
exit