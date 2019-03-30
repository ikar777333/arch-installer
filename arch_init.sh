#!/bin/bash

# Made Ivn for Ivn
# tools for work, wifi-menu, mkfs, cfdisk
# wifi-menu && ls /etc/netctl, netctl start profile
# mkfs -t ext2 -L Lable /dev/sda*

#Set link for download
link = $(grep ".ru" /etc/pacman.d/mirrorlist)
sed -i '1i $link\n' /etc/pacman.d/mirrorlist

#install arch
pacstrap /mnt base-devel base

#install driver for filesistem
genfstab -U /mnt >> /mnt/etc/fstab

#login in
arch-chroot /mnt