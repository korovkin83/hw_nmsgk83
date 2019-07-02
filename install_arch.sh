#!/usr/bin/env bash

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" > /etc/locale.conf
echo -e "KEYMAP=ru\nFONT=cyr-sun16" > /etc/vconsole.conf
echo -e "MODULES=(btrfs nvme nvidia)\nHOOKS=(autodetect systemd)\nCOMPRESSION=\"cat\"" > /etc/mkinitcpio.conf
mkinitcpio -p linux # Создание образа ранней загрузки
echo "korovkin" > /etc/hostname # Задаём имя компьютера
ln -sf /usr/share/zoneinfo/Europe/Kaliningrad /etc/localtime
hwclock --systohc --localtime # hwclock --systohc --utc (для установки одной системы)
efibootmgr -d /dev/nvme0n1 -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/nvme0n1p2 rw quiet rootflags=subvol=@root initrd=/intel-ucode.img initrd=/initramfs-linux.img"
sh -c "sed -i '/\[multilib\]/,/Include/s/^[ ]*#//' /etc/pacman.conf"
echo "root:00" | chpasswd # Пароль для суперпользователя
useradd -m -g users -G wheel -s /bin/bash mauladen # Создание нового пользователя
echo "mauladen:00" | chpasswd # Пароль для пользователя
sh -c "sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers"
pacman -Syu xorg xorg-drivers --noconfirm --noprogressbar --quiet # Установка X.Org
pacman -S nvidia nvidia-settings nvidia-utils opencl-nvidia opencl-headers lib32-nvidia-utils lib32-opencl-nvidia --noconfirm --noprogressbar --quiet # Установка драйверов Nvidia
pacman -S pulseaudio pulseaudio-alsa pavucontrol alsa-lib alsa-utils --noconfirm --noprogressbar --quiet # Установка Alsa
