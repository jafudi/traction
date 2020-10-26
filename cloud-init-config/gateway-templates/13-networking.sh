#!/bin/sh -eux

echo "Create netplan config for eth0"
cat <<EOF > /etc/netplan/01-netcfg.yaml;
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
EOF

# Disable Predictable Network Interface names and use eth0
sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub;
update-grub;

# Allow connections to non-standard localhost ports which are necessary for the 'nginx' and 'guac' containers
# which do have their own IP addresses within a virtualized Docker network while still running on the same VM
iptables -I INPUT 1 -p tcp --dport "${VNC_PORT}" -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # guac container to VNC
iptables -I INPUT 2 -p tcp --dport 4713 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # guac container to PulseAudio
iptables -I INPUT 3 -p tcp --dport 2222 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # guac via SSH to desktop
iptables -I INPUT 4 -p tcp --dport 667 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # nginx to DarkStat on gateway
iptables -I INPUT 5 -p tcp --dport 6667 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # nginx to DarkStat on desktop
netfilter-persistent save

cat <<EOF > /etc/darkstat/init.cfg
START_DARKSTAT=yes

# You must set this option, else darkstat may not listen to
# the interface you want
INTERFACE="-i eth0"

DIR="/var/lib/darkstat"
PORT="-p 667"
EOF
systemctl enable darkstat.service
systemctl start darkstat.service

