sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ubuntu-desktop

setxkbmap -layout 'ch(de)'

sudo grub-install /dev/sda
sudo update-grub

sudo reboot