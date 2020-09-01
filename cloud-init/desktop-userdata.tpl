Content-Type: multipart/mixed; boundary="====Part=Boundary================================================="
MIME-Version: 1.0

--====Part=Boundary=================================================
Content-Type: text/cloud-config; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.yaml"

#cloud-config

bootcmd:
  - mkdir -p /home/ubuntu/uploads
  - mkdir -p /home/ubuntu/Desktop/Uploads
  - chown ubuntu -R /home/ubuntu

users:
  - default

# Set the system timezone
timezone: Europe/Berlin

locale: de_DE.UTF-8

mounts:
  - ["ubuntu@${SSL_DOMAIN}:/home/ubuntu/uploads", "/home/ubuntu/Desktop/Uploads"]

mount_default_fields:
  - "none"
  - "none"
  - "fuse.sshfs"
  - "nofail,noauto,_netdev,IdentityFile=/var/tmp/ssh/vm_key,x-systemd.automount,x-systemd.requires=cloud-init.service,allow_other,users,idmap=user"
  - "0"
  - "0"

# https://blog.luukhendriks.eu/2019/01/25/sshfs-too-many-levels-of-symbolic-links.html
runcmd:
    - "touch /home/ubuntu/Desktop/Uploads/can_write_as_root || echo  SSHFS mount not working yet. Try again later..."

--====Part=Boundary=================================================
Content-Type: text/x-shellscript; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="lubuntu-user-script.sh"

#!/usr/bin/env bash

# Check whether required packages are installed to proceed #########

packages=("docker.io" "kdialog" "mumble")

for pkg in ${packages[@]}; do
    is_pkg_installed=$(dpkg-query -W --showformat='${Status}\n' ${pkg} | grep "install ok installed")

    if [ "${is_pkg_installed}" == "install ok installed" ]; then
        echo ${pkg} is installed.
    else
        echo Missing package ${pkg}! Skip further execution.
        exit 0
    fi
done

# Obtain instance parameters / degrees of freedom ###################

function get_info() {
  curl --silent \
       -H "Authorization: Bearer Oracle" \
       "http://169.254.169.254/opc/v2/instance/$1"
}
export -f get_info
GATEWAY_DOMAIN=${SSL_DOMAIN}
GITLAB_RUNNER_TOKEN=`get_info metadata/gitlab-runner-token`

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
-i /var/tmp/ssh/vm_key \
-R 5900:localhost:5900 \
-R 6667:localhost:667 \
-R 2222:localhost:22 \
-R 4713:localhost:4713 \
-R 8000:localhost:8000 \
-L ${MURMUR_PORT}:${GATEWAY_DOMAIN}:${MURMUR_PORT} \
ubuntu@${GATEWAY_DOMAIN}
Restart=always
RestartSec=5s

[Install]
WantedBy=default.target
EOF
systemctl enable ssh-tunnel.service
systemctl start ssh-tunnel.service

# Configure Mumble #################################################

iptables -I INPUT 3 -p tcp --dport ${MURMUR_PORT} -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # Mumble incoming
iptables -I INPUT 4 -p udp --dport ${MURMUR_PORT} -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT # Mumble incoming
netfilter-persistent save

# https://wiki.ubuntuusers.de/Mumble/
# https://wiki.natenom.de/mumble/benutzerhandbuch/mumble/variablen_mumble.ini

mkdir -p /home/ubuntu/.config/Mumble
cat << EOF > /home/ubuntu/.config/Mumble/Mumble.conf
[audio]
echomulti=false
headphone=true
input=PulseAudio
noisesupress=0
output=PulseAudio
outputdelay=10
quality=96000
vadmax=@Variant(\0\0\0\x87\x38\0\x1\0)
vadmin=@Variant(\0\0\0\x87\x38\0\x1\0)
voicehold=250

[codec]
opus/encoder/music=true

[net]
autoconnect=true
framesperpacket=6
jitterbuffer=5

[pulseaudio]
output=MumbleNullSink

[jack]
autoconnect=false
startserver=false

[ui]
developermenu=true
WindowLayout=2
server=${GATEWAY_DOMAIN}
username=YourDesktopInTheCloud
showcontextmenuinmenubar=true
themestyle=Dark
stateintray=true
disablepubliclist=true
disableconnectdialogediting=false
EOF
chown ubuntu -R /home/ubuntu/.config

cat << EOF > /usr/share/applications/mumble.desktop
[Desktop Entry]
Name=Mumble
GenericName=Voice Chat
GenericName[de]=Sprachkonferenz
GenericName[fr]=Chat vocal
Comment=A low-latency, high quality voice chat program for gaming
Comment[de]=Ein Sprachkonferenzprogramm mit niedriger Latenz und hoher Qualitaet fuer Spiele
Comment[fr]=Un logiciel de chat vocal de haute qualite et de faible latence pour les jeux
Exec=mumble mumble://Desktop:${MURMUR_PASSWORD}@${GATEWAY_DOMAIN}:${MURMUR_PORT}
Icon=mumble
Terminal=false
Type=Application
StartupNotify=false
MimeType=x-scheme-handler/mumble;
Categories=Network;Chat;Qt;
Keywords=VoIP;Messaging;Voice Chat;Secure Communication;
Version=1.0
EOF

cat << EOF > /home/ubuntu/.config/autostart/mumble.desktop
[Desktop Entry]
Name=Mumble
Exec=mumble mumble://Desktop:${MURMUR_PASSWORD}@${GATEWAY_DOMAIN}:${MURMUR_PORT}
Terminal=false
Type=Application
StartupNotify=false
EOF
chown ubuntu /home/ubuntu/.config/autostart/mumble.desktop

# Configure mail account ###########################################

# https://wiki.ubuntuusers.de/Trojita/

DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends --upgrade trojita

MAILCONF=/home/ubuntu/.config/flaska.net
mkdir -p $MAILCONF
cat << EOF > ${MAILCONF}/trojita.conf
[General]
app.updates.checkEnabled=false
imap.auth.pass=${IMAP_PASSWORD}
imap.auth.user=${EMAIL_ADDRESS}
imap.capabilities.blacklist=
imap.host=${IMAP_HOST}
imap.method=TCP
imap.needsNetwork=true
imap.numberRefreshInterval=300
imap.port=143
imap.proxy.system=true
imap.startmode=ONLINE
imap.starttls=true
imapIdleRenewal=29
msa.method=SMTP
msa.smtp.auth=true
msa.smtp.auth.reuseImapCredentials=true
msa.smtp.auth.user=
msa.smtp.burl=false
msa.smtp.host=${IMAP_HOST}
msa.smtp.port=587
msa.smtp.starttls=true
offline.cache=days
offline.cache.numDays=30

[autoMarkRead]
enabled=true
seconds=0

[composer]
imapSentName=Sent Messages
saveToImapEnabled=true

[gui]
expandedMailboxes=INBOX
mailboxList.showOnlySubscribed=false
mainWindow.layout=compact
preferPlaintextRendering=false
showSystray=false
startMinimized=false

[identities]
1\address=${EMAIL_ADDRESS}
1\organisation=
1\realName=${SUB_DOMAIN_PREFIX}
1\signature=
size=1

[interoperability]
revealVersions=true

[plugin]
addressbook=abookaddressbook
password=cleartextpassword
EOF
chown ubuntu ${MAILCONF}/trojita.conf

# Deploy DevOps application ########################################

#DESKTOP=/home/ubuntu/Desktop
#mkdir -p $DESKTOP
#cat << EOF | sudo tee $DESKTOP/ideops.desktop
#[Desktop Entry]
#Type=Application
#Exec=qterminal --execute /var/tmp/run_app.sh
#Icon=QMPlay2
#Name=Hier klicken
#EOF
#sudo chmod +x $DESKTOP/ideops.desktop
#sudo chmod +x /var/tmp/run_app.sh
#
#docker pull --quiet jafudi/idea-extractor:latest &

# Is there an alternative to removing the user password ? ###########

sudo passwd -d ubuntu # for direct SSH access from guacd_container

# Install GitLab runner ############################################

#echo "\n\nInstall Python packages required for testing on guest OS..."
#DEBIAN_FRONTEND=noninteractive apt-get install --upgrade -y --no-install-recommends python3-pip
#pip3 install setuptools
#pip3 install behave invoke jsonschema
#
#echo "\n\nInstall Gitlab Runnner for uploading artifacts from guest VM..."
#curl --silent -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
#apt-get install --upgrade -y gitlab-runner traceroute
#
#echo 'gitlab-runner ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#usermod -aG docker gitlab-runner
#
#cd /home/gitlab-runner
#mkdir -p builds
#chmod --recursive 777 builds
#rm -f .bash_logout
#
## Register GitLab runner ###########################################
#
#sudo gitlab-runner unregister --all-runners
#sudo rm -f /etc/gitlab-runner/config.toml
#
#DESCRIPTION="Shell executor on $(uname -s)"
#
#HOST_TAGS="$( \
#    hostnamectl \
#    | sed -E -e 's/^[ ]*//;s/[^a-zA-Z0-9\.]+/-/g;s/(.*)/\L\1/;' \
#    | tr '\n' ',' \
#)"
#
#ROUTE_TAGS="$( \
#    traceroute --max-hops=3 8.8.8.8 \
#    | sed -E -e '1d;s/^[ ]+[0-9][ ]+([a-zA-Z]+?).*/\1/;/^$/d;s/^/gateway-/' \
#    | tr '\n' ',' \
#)"
#
#sudo gitlab-runner register \
#--non-interactive \
#--url="https://gitlab.com/" \
#--registration-token="${GITLAB_RUNNER_TOKEN}" \
#--executor="shell" \
#--description="${DESCRIPTION}" \
#--tag-list="${HOST_TAGS},${ROUTE_TAGS}"
#
#sudo gitlab-runner restart
#sudo gitlab-runner status

chown ubuntu -R /home/ubuntu

--====Part=Boundary=================================================--
