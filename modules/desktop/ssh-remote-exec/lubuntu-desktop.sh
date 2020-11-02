#!/bin/bash -eux

echo "Running script lubuntu-desktop.sh..."
echo

export DEBIAN_FRONTEND="noninteractive"

sudo apt-get -qq clean
sudo apt-get -qq update --fix-missing

sudo -E apt-get -qq install \
lubuntu-desktop \
gdm3- \
avahi-daemon- \
firefox- \
fwupd- fwupd-signed- \
hplip- \
k3b- \
laptop-detect- \
libnss-mdns- \
memtest86+- \
noblenote- \
partitionmanager- \
pastebinit- \
pcmciautils- \
plasma-discover- \
skanlite- \
libreoffice-base- libreoffice-draw- \
kdeconnect- \
snapd- \
acpi-support- \
screengrab- \
qps- \
qlipper-

sudo -E apt-get -qq install --no-install-recommends  \
lightdm \
lightdm-gtk-greeter \
lightdm-gtk-greeter-settings \
accountsservice \
policykit-1 policykit-desktop-privileges

sudo mkdir -p /etc/lightdm
cat << EOF | sudo tee /etc/lightdm/lightdm.conf
[SeatDefaults]
user-session=lxqt
greeter-session=lightdm-gtk-greeter
EOF
sudo systemctl enable lightdm.service
sudo usermod -aG nopasswdlogin ubuntu

# lubuntu-desktop depends on (for installation)
sudo apt-get -qq purge \
anacron- \
bluedevil- bluez- bluez-cups- pulseaudio-module-bluetooth- \
genisoimage- \
lxqt-powermanagement- \
mobile-broadband-provider-info- \
modemmanager- \
openprinting-ppds- \
printer.*- \
rfkill- \
sddm.*- \
ubuntu-release-upgrader-qt- \
usb.*- \
whoopsie- apport- \
wireless-tools- wpasupplicant- \
xscreensaver.*-

sudo apt-get -qq autoremove
