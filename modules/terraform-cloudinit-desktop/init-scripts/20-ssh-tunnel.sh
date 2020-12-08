#!/bin/bash -eux

# Obtain instance parameters / degrees of freedom ###################

function get_info() {
  curl --silent \
       -H "Authorization: Bearer Oracle" \
       "http://169.254.169.254/opc/v2/instance/$1"
}
export -f get_info

# Configure connection between desktop and gateway #################

cat << EOF > /etc/systemd/system/ssh-tunnel.service
[Unit]
Description=Reverse SSH connection
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/ssh -vvv -g -N -T \
-o ServerAliveInterval=10 \
-o ExitOnForwardFailure=yes \
-o StrictHostKeyChecking=no \
-i /home/${DESKTOP_USERNAME}/.ssh/vm_key \
-R  5900:localhost:5900 \
-R  4713:localhost:4713 \
-R  6667:localhost:667 \
-R  2222:localhost:22 \
-L 143:localhost:143 \
-L 993:localhost:993 \
${GATEWAY_USERNAME}@${SSL_DOMAIN}
Restart=always
RestartSec=5s
StartLimitIntervalSec=0

[Install]
WantedBy=default.target
EOF
systemctl enable ssh-tunnel.service
systemctl start ssh-tunnel.service