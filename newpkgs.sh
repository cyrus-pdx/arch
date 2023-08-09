#!/bin/bash

# desired packages(pkgs)
NEWPKGS=(
age alacritty alsa-utils amd-ucode apparmor arch-audit arch-install-scripts arch-wiki-docs archinstall b43-fwcutter base base-devel bind broadcom-wl brltty btrfs-progs bumblebee cairo cliphist cloud-init cmake clamav clamtk clonezilla cryptsetup cuda cuda-tools cudnn cryptsetup darkhttpd ddrescue dhclient dhcpcd diffutils dmidecode dmraid dnsmasq dosfstools e2fsprogs edk2-shell efibootmgr efitools egl-wayland emacs-wayland espeakup ethtool exfatprogs exploitdb fail2ban f2fs-tools fatresize foot-terminfo fsarchiver gdb glib gnu-netcat gpart gpm gptfdisk grim grml-zsh-config grub gcc hdparm hyprland hyprpaper hyperv imv intel-ucode irssi iw iwd jfsutils kitty-terminfo less lftp libfido2 libisoburn libusb-compat libxcb libx11 libxcomposite libxfixes libinput libliftoff libdisplay-info libxkbcommon libxrender linux linux-atm linux-firmware linux-firmware-marvell linux-headers livecd-sounds lsscsi lib32-primus_vk libvdpau lvm2 lynx man-db man-pages mc mdadm meson memtest86+ memtest86+-efi mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils modemmanager mtools nano nbd nccl ndisc6 networkmanager networkmanager-openvpn nfs-utils nilfs-utils ninja nmap nccl nss ntp nvidia nvidia-cg-toolkit nvidia-dkms nvidia-settings nvidia-utils nvme-cli nvtop ntfs-3g nmap open-iscsi open-vm-tools openconnect openssh openssl openvpn oath-toolkit pam_mount pam-u2f partclone parted partimage pcsclite ppp pptpclient pv qemu-guest-agent refind reflector reiserfsprogs rkhunter rp-pppoe rsync rxvt-unicode-terminfo sbctl sbsigntools screen sdparm sg3_utils shim smartmontools sof-firmware squashfs-tools sssd sudo swappy syslinux systemd-swap systemd-resolvconf tcpdump terminus-font testdisk tmux tpm2-tools tpm2-tss udftools usb_modeswitch usbmuxd usbutils vim virtualbox-guest-utils-nox vpnc waybar wezterm-terminfo wireless-regdb wireless_tools wayland wayland-docs wayland-protocols wayland-utils waylock wpa_supplicant wvdial xfsprogs xl2tpd xdg-desktop-portal-hyprland xcb-proto xcb-util xcb-util-keysyms xorg-xinput xorg-xwayland zsh zram-generator syslog-ng sshfs yubikey-full-disk-encryption yubikey-manager yubikey-manager-qt yubikey-personalization yubikey-personalization-gui yubikey-touch-detector yubico-c yubico-pam
)

# error handling 
TMP_ERR=$(mktemp)

# sync refresh update pkgs and redirect stderr to the temporary file
sudo pacman -Syu --needed "${NEWPKGS[@]}" 2> "$TMP_ERR"

# error check
if [ $? -eq 0 ]; then
    echo "All packages successfully installed"
else
    echo "There was an error installing some packages. Details below:"
    cat "$TMP_ERR"
fi

# removing temp file
rm -f "$TMP_ERR"
