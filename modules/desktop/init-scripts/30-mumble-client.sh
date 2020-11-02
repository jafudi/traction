#!/usr/bin/env bash

if [ ! -f /etc/.terraform-complete ]; then
    echo "Terraform provisioning not yet complete, exiting"
    exit 0
fi

# Configure Mumble #################################################

# https://wiki.ubuntuusers.de/Mumble/
# https://wiki.natenom.de/mumble/benutzerhandbuch/mumble/variablen_mumble.ini

mkdir -p /home/ubuntu/.config/Mumble
cat << EOF > /home/ubuntu/.config/Mumble/Mumble.conf
[audio]
echomulti=false
headphone=true
input=PulseAudio
loudness=20000
noisesupress=0
output=PulseAudio
outputdelay=10
quality=96000
vadmax=@Variant(\0\0\0\x87\x38\0\x1\0)
vadmin=@Variant(\0\0\0\x87\x38\0\x1\0)
attenuateothers=false
voicehold=250
positional=false

[recording]
path=/home/ubuntu/Desktop/Uploads

[shortcuts]
size=0

[messages]
1\log=5
11\log=5
13\log=5
16\log=5
24\log=5
4\log=5
7\log=5
8\log=5
size=29

[messagesounds]
size=29

[codec]
opus/encoder/music=true

[net]
autoconnect=true
framesperpacket=6
jitterbuffer=5
tcponly=true

[pulseaudio]
output=AudioConference

[jack]
autoconnect=false
startserver=false

[privacy]
hideos=true

[ui]
developermenu=true
WindowLayout=2
server=${SSL_DOMAIN}
showcontextmenuinmenubar=true
themestyle=Dark
stateintray=true
usage=false
disablepubliclist=true
disableconnectdialogediting=false
EOF
chown -R ubuntu /home/ubuntu/.config

cat << EOF > /usr/share/applications/mumble.desktop
[Desktop Entry]
Name=Mumble
GenericName=Voice Chat
GenericName[de]=Sprachkonferenz
GenericName[fr]=Chat vocal
Comment=A low-latency, high quality voice chat program for gaming
Comment[de]=Ein Sprachkonferenzprogramm mit niedriger Latenz und hoher Qualitaet fuer Spiele
Comment[fr]=Un logiciel de chat vocal de haute qualite et de faible latence pour les jeux
Exec=mumble mumble://Desktop:${MURMUR_PASSWORD}@${SSL_DOMAIN}:${MURMUR_PORT}
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
Exec=mumble mumble://Desktop:${MURMUR_PASSWORD}@${SSL_DOMAIN}:${MURMUR_PORT}
Terminal=false
Type=Application
StartupNotify=false
EOF
chown ubuntu /home/ubuntu/.config/autostart/mumble.desktop