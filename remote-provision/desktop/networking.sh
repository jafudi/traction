#!/bin/sh -eux

echo "Running script networking.sh..."
echo

export DEBIAN_FRONTEND="noninteractive"
sudo -E apt-get -qq install --no-install-recommends \
mtr net-tools \
darkstat

echo "Create netplan config for eth0"
cat <<EOF | sudo tee /etc/netplan/01-netcfg.yaml;
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
EOF

# Disable Predictable Network Interface names and use eth0
sudo sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub;
sudo update-grub;

cat <<EOF | sudo tee /etc/darkstat/init.cfg
START_DARKSTAT=yes

# You must set this option, else darkstat may not listen to
# the interface you want
INTERFACE="-i eth0"

DIR="/var/lib/darkstat"
PORT="-p 667"
EOF
sudo systemctl enable darkstat.service
sudo systemctl start darkstat.service

