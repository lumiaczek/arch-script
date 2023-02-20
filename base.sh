#!/bin/bash

# Konfiguracja strefy czasowej i systemu

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc

# Odkomentuj pl_PL.UTF-8 i en_US.UTF-8

echo "Odkomentuj pl_PL.UTF-8 i en_US.UTF-8"
echi "Następnie wpisz locale-gen"

# Ustawianie języka i polskich znaków

echo "LANG=pl_PL.UTF-8" >> /etc/locale.conf
echo "KEYMAP=pl" >> /etc/vconsole.conf
echo "FONT=Lat2-Terminus16" >> /etc/vconsole.conf
echo "FONT_MAP=8859-2" >> /etc/vconsole.conf

# Ustawiwanie hostname i pliku hosts

echo "archLaptop" >> /etc/hostname
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1           localhost" >> /etc/hosts
echo "127.0.1.1     archLaptop.localdomain  archLaptop" >> /etc/hosts

# Zmień hasło dla roota

echo "Zmień hasło dla roota"

pacman -Syy

pacman -S efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol zsh openssh rsync reflector acpi acpi_call tlp edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat ipset firewalld sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font refind

refind-install

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S firefox thunderbird insomnia-bin discord teams obsidian onlyoffice-bin pamac-aur termius visual-studio-code-bin mongodb-bin mongodb-compass mysql-workbench virtualbox docker inkscape gimp vlc figma-linux-bin spotify etcher-bin xmind cockpit ulauncher

systemctl --user enable --now ulauncher
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systmectl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

useradd -mG wheel lumiaczek

echo "Zmień hasło dla użytkownika lumiaczek / passwd"

EDITOR=nano visudo

echo "Ukończono! Wpisz umount -a i reboot"