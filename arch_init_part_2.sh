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
echo 'Root password'
passwd

#Setup user
useradd -m -g users -G wheel -s /bin/bash ikar
echo 'Root user'
passwd ikar 
sed -i 's/^# *\(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers

#Setup load
pacman -S --noconfirm refind-efi 
refind-install
mkrlconf
sed -i '1d;2d' /boot/refind_linux.conf

#Setup packages
pacman -S --noconfirm git dialog wpa_supplicant vim bash-completion

#Setup network
cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/ethernet-dhcp
sed -i 's/Interface=eth0/Interface=enp0s3/g' /etc/netctl/ethernet-dhcp
netctl enable ethernet-dhcp

#cd -r /arch_installer_scripts/dots
#sudo -u ikar sh install.sh
#sudo -u ikar sh /arch_installer_scripts/arch_configure.sh

#finish
exit