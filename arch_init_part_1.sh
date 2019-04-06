#!/bin/bash

# Made Ivn for Ivn
# tools for work, wifi-menu, mkfs, cfdisk
# wifi-menu && ls /etc/netctl, netctl start profile
# mkfs -t ext2 -L Lable /dev/sda*

#Setup mirrorlist
echo -e "$(grep ".*.ru.*" /etc/pacman.d/mirrorlist)\n$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist

mkfs.ext4 /dev/sda2
mkfs.cflat /dev/sda1
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

#install arch
pacstrap /mnt base-devel base

#install driver for filesistem
genfstab -U /mnt >> /mnt/etc/fstab

#copy part 2 script into root
mv arch_init_part_2.sh /mnt

mv arch_configure.sh /mnt

#start part 2
arch-chroot /mnt bash arch_init_part_2.sh

#
cp -R /etc/netctl/ /mnt/etc/netctl

#finish
#umount -R /mnt && reboot