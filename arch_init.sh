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

#copy part 2 script into root
mv arch_init_part_2.sh /mnt

#start part 2
arch-chroot /mnt bash arch_init_part_2.sh