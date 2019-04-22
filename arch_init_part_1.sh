#!/bin/bash

# Made Ivn for Ivn
# tools for work, wifi-menu, mkfs, cfdisk
# wifi-menu && ls /etc/netctl, netctl start profile
# mkfs -t ext2 -L Lable /dev/sda*

#Setup mirrorlist
echo -e "$(grep ".*.ru.*" /etc/pacman.d/mirrorlist)\n$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist

mkfs.ext4 /dev/sda2
mkfs.vfat /dev/sda1
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

#install arch
pacstrap /mnt base-devel base

#install driver for filesistem
genfstab -U /mnt >> /mnt/etc/fstab

#move scripts and configs into root
mkdir /mnt/arch_installer_scripts
mv arch_init_part_2.sh /mnt/arch_installer_scripts
mv arch_configure.sh /mnt/arch_installer_scripts
mv configs /mnt/arch_installer_scripts
wget -O /mnt/arch_installer_scripts/oh-my-zsh.sh https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
wget -O /mnt/arch_installer_scripts/refind-theme-regular.sh https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh
git clone https://github.com/denysdovhan/spaceship-prompt /mnt/arch_installer_scripts/spaceship-prompt
git clone https://github.com/zsh-users/zsh-autosuggestions /mnt/arch_installer_scripts/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting /mnt/arch_installer_scripts/zsh-syntax-highlighting

#start part 2
arch-chroot /mnt bash /arch_installer_scripts/arch_init_part_2.sh

#finish
umount -R /mnt && reboot