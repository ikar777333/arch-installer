#!/bin/bash

# Made Ivn for Ivn
# tools for work, wifi-menu, mkfs, cfdisk
# wifi-menu && ls /etc/netctl, netctl start profile
# mkfs -t ext2 -L Lable /dev/sda*

#Set link for download
link = $(grep ".ru" /etc/pacmad.d/mirrorlist)
sed -i '1i $link\n' /etc/pacmad.d/mirrorlist

#install arch
pacstrap /mnt base-devel base

#install driver for filesistem
genfstab -U /mnt >> /mnt/etc/fstab

#login in
arch-chroot /mnt

#Set timezone
ln -sf /usr/share/Europe/Moscow /etc/localtime
hwclock --systohc --localtime

#set locale
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && sed -i 's/^# *\(ru_RU.UTF-8\)/\1/' /etc/locale.gen && locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

#set font
sed -i '1i FONT=UniCyr_8x16\n' /etc/vconsole.conf

#set name of pc
echo "deus" > /etc/hostname
sed -i '1i 127.0.0.1 deus.localdomain deus n/' /etc/hosts

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
exit && umount -R /mnt && reboot