#!/usr/bin/env bash

DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends --upgrade \
2048-qt \
blockout2 \
kstars \
oneko \
frozen-bubble \
biniax2 \
fraqtive \
dossizola \
ksudoku \
blinken \
amoebax \
kmplot kalzium \
cgoban \
cutemaze \
lmemory \
ri-li \
monsterz monsterz-data \
kdegames

DEBIAN_FRONTEND="noninteractive" apt-get install -y --upgrade tuxmath tuxpaint
# https://wiki.ubuntuusers.de/Tux_Paint/
mkdir -p /etc/tuxpaint/
cat << EOF > /etc/tuxpaint/tuxpaint.conf
fullscreen=native
noshortcuts=yes
alllocalefonts=yes
noprint=yes
savedir=/home/ubuntu/Desktop/Uploads/
EOF
chown ubuntu -R /etc/tuxpaint/
