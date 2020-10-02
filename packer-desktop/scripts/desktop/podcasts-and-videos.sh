#!/usr/bin/env bash

echo "Running script podcasts-and-videos.sh..."
echo

# https://wiki.ubuntuusers.de/gPodder/
# https://gpodder.github.io/docs/user-manual.html

export PATH="$HOME/.local/bin:$PATH"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip3 install html5lib gpod eyeD3 youtube_dl

export DEBIAN_FRONTEND="noninteractive"
sudo -E apt-get install -y --upgrade gpodder

mkdir -p $HOME/.config/vlc
cat << EOF >> $HOME/.config/vlc/vlc-qt-interface.conf
[MainWindow]
AdvToolbar="12;11;14;13;"
FSCtoolbar="0-2;64;3;1;4;64;37;64;38;64;8;65;25;35-4;34;"
InputToolbar="5-1;33;6-1;"
MainToolbar1="64;38;65;"
MainToolbar2="16-6;0-6;17-6;43-4;65-6;5-6;42-6;6-6;65-4;32-6;9;37;36-6;"
QtStyle=System's default
ToolbarPos=false
adv-controls=0
bgSize=@Size(100 30)
pl-dock-status=true
playlist-visible=true
playlistSize=@Size(600 300)
status-bar-visible=false
EOF

cat << 'EOF' >> $HOME/.config/vlc/vlcrc
###
###  vlc 3.0.9.2
###

###
### lines beginning with a '#' character are comments
###

[dynamicoverlay] # Dynamic video overlay

# Input FIFO (string)
#overlay-input=

# Output FIFO (string)
#overlay-output=

[rss] # RSS and Atom feed display

# Feed URLs (string)
#rss-urls=

# X offset (integer)
#rss-x=0

# Y offset (integer)
#rss-y=0

# Text position (integer)
#rss-position=-1

# Opacity (integer)
#rss-opacity=255

# Color (integer)
#rss-color=16777215

# Font size, pixels (integer)
#rss-size=0

# Speed of feeds (integer)
#rss-speed=100000

# Max length (integer)
#rss-length=60

# Refresh time (integer)
#rss-ttl=1800

# Feed images (boolean)
#rss-images=1

# Title display mode (integer)
#rss-title=-1

[logo] # Logo sub source

# Logo filenames (string)
#logo-file=

# X coordinate (integer)
#logo-x=-1

# Y coordinate (integer)
#logo-y=-1

# Logo individual image time in ms (integer)
#logo-delay=1000

# Logo animation # of loops (integer)
#logo-repeat=-1

# Opacity of the logo (integer)
#logo-opacity=255

# Logo position (integer)
#logo-position=-1

[audiobargraph_v] # Audio Bar Graph Video sub source

# X coordinate (integer)
#audiobargraph_v-x=0

# Y coordinate (integer)
#audiobargraph_v-y=0

# Transparency of the bargraph (integer)
#audiobargraph_v-transparency=255

# Bargraph position (integer)
#audiobargraph_v-position=-1

# Bar width in pixel (integer)
#audiobargraph_v-barWidth=10

# Bar Height in pixel (integer)
#audiobargraph_v-barHeight=400

[remoteosd] # Remote-OSD over VNC

# VNC Host (string)
#rmtosd-host=myvdr

# VNC Port (integer)
#rmtosd-port=20001

# VNC Password (string)
#rmtosd-password=

# VNC poll interval (integer)
#rmtosd-update=1000

# VNC polling (boolean)
#rmtosd-vnc-polling=0

# Mouse events (boolean)
#rmtosd-mouse-events=0

# Key events (boolean)
#rmtosd-key-events=0

# Alpha transparency value (default 255) (integer)
#rmtosd-alpha=255

[subsdelay] # Subtitle delay

# Delay calculation mode (integer)
#subsdelay-mode=1

# Calculation factor (float)
#subsdelay-factor=2.000000

# Maximum overlapping subtitles (integer)
#subsdelay-overlap=3

# Minimum alpha value (integer)
#subsdelay-min-alpha=70

# Interval between two disappearances (integer)
#subsdelay-min-stops=1000

# Interval between appearance and disappearance (integer)
#subsdelay-min-start-stop=1000

# Interval between disappearance and appearance (integer)
#subsdelay-min-stop-start=1000

[marq] # Marquee display

# Text (string)
#marq-marquee=VLC

# Text file (string)
#marq-file=

# X offset (integer)
#marq-x=0

# Y offset (integer)
#marq-y=0

# Marquee position (integer)
#marq-position=-1

# Opacity (integer)
#marq-opacity=255

# Color (integer)
#marq-color=16777215

# Font size, pixels (integer)
#marq-size=0

# Timeout (integer)
#marq-timeout=0

# Refresh period in ms (integer)
#marq-refresh=1000

[mosaic] # Mosaic video sub source

# Transparency (integer)
#mosaic-alpha=255

# Height (integer)
#mosaic-height=100

# Width (integer)
#mosaic-width=100

# Mosaic alignment (integer)
#mosaic-align=5

# Top left corner X coordinate (integer)
#mosaic-xoffset=0

# Top left corner Y coordinate (integer)
#mosaic-yoffset=0

# Border width (integer)
#mosaic-borderw=0

# Border height (integer)
#mosaic-borderh=0

# Positioning method (integer)
#mosaic-position=0

# Number of rows (integer)
#mosaic-rows=2

# Number of columns (integer)
#mosaic-cols=2

# Keep aspect ratio (boolean)
#mosaic-keep-aspect-ratio=0

# Keep original size (boolean)
#mosaic-keep-picture=0

# Elements order (string)
#mosaic-order=

# Offsets in order (string)
#mosaic-offsets=

# Delay (integer)
#mosaic-delay=0

[folder] # Folder meta data

# Album art filename (string)
#album-art-filename=

[lua] # Lua interpreter

# Lua interface (string)
#lua-intf=dummy

# Lua interface configuration (string)
#lua-config=

# Password (string)
#http-password=

# Source directory (string)
#http-src=

# Directory index (boolean)
#http-index=0

# TCP command input (string)
#rc-host=

# CLI input (string)
#cli-host=

# Host (string)
#telnet-host=localhost

# Port (integer)
#telnet-port=4212

# Password (string)
#telnet-password=

[oldrc] # Remote control interface

# Show stream position (boolean)
#rc-show-pos=0

# Fake TTY (boolean)
#rc-fake-tty=0

# UNIX socket command input (string)
#rc-unix=

# TCP command input (string)
#rc-host=

[gestures] # Mouse gestures control interface

# Motion threshold (10-100) (integer)
#gestures-threshold=30

# Trigger button (string)
#gestures-button=left

[lirc] # Infrared remote control interface

# Change the lirc configuration file (string)
#lirc-file=

[netsync] # Network synchronization

# Network master clock (boolean)
#netsync-master=0

# Master server IP address (string)
#netsync-master-ip=

# UDP timeout (in ms) (integer)
#netsync-timeout=500

[motion] # motion control interface

[rtsp] # Legacy RTSP VoD server

# MUX for RAW RTSP transport (string)
#rtsp-raw-mux=ts

# Maximum number of connections (integer)
#rtsp-throttle-users=0

# Sets the timeout option in the RTSP session string (integer)
#rtsp-session-timeout=5

[audioscrobbler] # Submission of played songs to last.fm

# Username (string)
#lastfm-username=

# Password (string)
#lastfm-password=

# Scrobbler URL (string)
#scrobbler-url=post.audioscrobbler.com

[gnutls] # GNU TLS transport layer security

# Use system trust database (boolean)
#gnutls-system-trust=1

# Trust directory (string)
#gnutls-dir-trust=

# TLS cipher priorities (string)
#gnutls-priorities=NORMAL

[logger] # File logging

[xcb_screen] # Screen capture (with X11/XCB)

# Frame rate (float)
#screen-fps=2.000000

# Region left column (integer)
#screen-left=0

# Region top row (integer)
#screen-top=0

# Capture region width (integer)
#screen-width=0

# Capture region height (integer)
#screen-height=0

# Follow the mouse (boolean)
#screen-follow-mouse=0

[imem] # Memory input

# ID (integer)
#imem-id=-1

# Group (integer)
#imem-group=0

# Category (integer)
#imem-cat=0

# Codec (string)
#imem-codec=

# Language (string)
#imem-language=

# Sample rate (integer)
#imem-samplerate=0

# Channels count (integer)
#imem-channels=0

# Width (integer)
#imem-width=0

# Height (integer)
#imem-height=0

# Display aspect ratio (string)
#imem-dar=

# Frame rate (string)
#imem-fps=

# Size (integer)
#imem-size=0

[dtv] # Digital Television and Radio

# DVB adapter (integer)
#dvb-adapter=0

# DVB device (integer)
#dvb-device=0

# Do not demultiplex (boolean)
#dvb-budget-mode=0

# Frequency (Hz) (integer)
#dvb-frequency=0

# Spectrum inversion (integer)
#dvb-inversion=-1

# Bandwidth (MHz) (integer)
#dvb-bandwidth=0

# Transmission mode (integer)
#dvb-transmission=0

# Guard interval (string)
#dvb-guard=

# High-priority code rate (string)
#dvb-code-rate-hp=

# Low-priority code rate (string)
#dvb-code-rate-lp=

# Hierarchy mode (integer)
#dvb-hierarchy=-1

# DVB-T2 Physical Layer Pipe (integer)
#dvb-plp-id=0

# Layer A modulation (string)
#dvb-a-modulation=

# Layer A code rate (string)
#dvb-a-fec=

# Layer A segments count (integer)
#dvb-a-count=0

# Layer A time interleaving (integer)
#dvb-a-interleaving=0

# Layer B modulation (string)
#dvb-b-modulation=

# Layer B code rate (string)
#dvb-b-fec=

# Layer B segments count (integer)
#dvb-b-count=0

# Layer B time interleaving (integer)
#dvb-b-interleaving=0

# Layer C modulation (string)
#dvb-c-modulation=

# Layer C code rate (string)
#dvb-c-fec=

# Layer C segments count (integer)
#dvb-c-count=0

# Layer C time interleaving (integer)
#dvb-c-interleaving=0

# Modulation / Constellation (string)
#dvb-modulation=

# Symbol rate (bauds) (integer)
#dvb-srate=0

# FEC code rate (string)
#dvb-fec=

# Stream identifier (integer)
#dvb-stream=0

# Pilot (integer)
#dvb-pilot=-1

# Roll-off factor (integer)
#dvb-rolloff=-1

# Transport stream ID (integer)
#dvb-ts-id=0

# Polarization (Voltage) (string)
#dvb-polarization=

#  (integer)
#dvb-voltage=13

# High LNB voltage (boolean)
#dvb-high-voltage=0

# Local oscillator low frequency (kHz) (integer)
#dvb-lnb-low=0

# Local oscillator high frequency (kHz) (integer)
#dvb-lnb-high=0

# Universal LNB switch frequency (kHz) (integer)
#dvb-lnb-switch=11700000

# DiSEqC LNB number (integer)
#dvb-satno=0

# Uncommitted DiSEqC LNB number (integer)
#dvb-uncommitted=0

# Continuous 22kHz tone (integer)
#dvb-tone=-1

[dvdnav] # DVDnav Input

# DVD angle (integer)
#dvdnav-angle=1

# Start directly in menu (boolean)
#dvdnav-menu=1

[dvdread] # DVDRead Input (no menu support)

# DVD angle (integer)
#dvdread-angle=1

[linsys_sdi] # SDI Input

# Link # (integer)
#linsys-sdi-link=0

# Video ID (integer)
#linsys-sdi-id-video=0

# Aspect ratio (string)
#linsys-sdi-aspect-ratio=

# Audio configuration (string)
#linsys-sdi-audio=0=1,1

# Teletext configuration (string)
#linsys-sdi-telx=

# Teletext language (string)
#linsys-sdi-telx-lang=

[vnc] # VNC client access

# Username (string)
#rfb-user=

# Password (string)
#rfb-password=

# X.509 Certificate Authority (string)
#rfb-x509-ca=

# X.509 Certificate Revocation List (string)
#rfb-x509-crl=

# X.509 Client certificate (string)
#rfb-x509-client-cert=

# X.509 Client private key (string)
#rfb-x509-client-key=

# Frame rate (float)
#rfb-fps=5.000000

# Frame buffer depth (string)
#rfb-chroma=RV32

# Compression level (integer)
#rfb-compress-level=0

# Image quality (integer)
#rfb-quality-level=9

[dvb] # DVB input with v4l2 support

# Probe DVB card for capabilities (boolean)
#dvb-probe=1

# Satellite scanning config (string)
#dvb-satellite=

# Scan tuning list (string)
#dvb-scanlist=

# Use NIT for scanning services (boolean)
#dvb-scan-nit=1

[v4l2] # Video4Linux input

# Video capture device (string)
#v4l2-dev=/dev/video0

# VBI capture device (string)
#v4l2-vbidev=

# Standard (string)
#v4l2-standard=

# Video input chroma format (string)
#v4l2-chroma=

# Input (integer)
#v4l2-input=0

# Audio input (integer)
#v4l2-audio-input=-1

# Width (integer)
#v4l2-width=0

# Height (integer)
#v4l2-height=0

# Picture aspect-ratio n:m (string)
#v4l2-aspect-ratio=4:3

# Frame rate (string)
#v4l2-fps=60

# Radio device (string)
#v4l2-radio-dev=/dev/radio0

# Frequency (integer)
#v4l2-tuner-frequency=-1

# Audio mode (integer)
#v4l2-tuner-audio-mode=3

# Reset controls (boolean)
#v4l2-controls-reset=0

# Brightness (integer)
#v4l2-brightness=-1

# Automatic brightness (integer)
#v4l2-brightness-auto=-1

# Contrast (integer)
#v4l2-contrast=-1

# Saturation (integer)
#v4l2-saturation=-1

# Hue (integer)
#v4l2-hue=-1

# Automatic hue (integer)
#v4l2-hue-auto=-1

# White balance temperature (K) (integer)
#v4l2-white-balance-temperature=-1

# Automatic white balance (integer)
#v4l2-auto-white-balance=-1

# Red balance (integer)
#v4l2-red-balance=-1

# Blue balance (integer)
#v4l2-blue-balance=-1

# Gamma (integer)
#v4l2-gamma=-1

# Automatic gain (integer)
#v4l2-autogain=-1

# Gain (integer)
#v4l2-gain=-1

# Sharpness (integer)
#v4l2-sharpness=-1

# Chroma gain (integer)
#v4l2-chroma-gain=-1

# Automatic chroma gain (integer)
#v4l2-chroma-gain-auto=-1

# Power line frequency (integer)
#v4l2-power-line-frequency=-1

# Backlight compensation (integer)
#v4l2-backlight-compensation=-1

# Band-stop filter (integer)
#v4l2-band-stop-filter=-1

# Horizontal flip (boolean)
#v4l2-hflip=0

# Vertical flip (boolean)
#v4l2-vflip=0

# Rotate (degrees) (integer)
#v4l2-rotate=-1

# Color killer (integer)
#v4l2-color-killer=-1

# Color effect (integer)
#v4l2-color-effect=-1

# Audio volume (integer)
#v4l2-audio-volume=-1

# Audio balance (integer)
#v4l2-audio-balance=-1

# Mute (boolean)
#v4l2-audio-mute=0

# Bass level (integer)
#v4l2-audio-bass=-1

# Treble level (integer)
#v4l2-audio-treble=-1

# Loudness mode (boolean)
#v4l2-audio-loudness=0

# v4l2 driver controls (string)
#v4l2-set-ctrls=

[satip] # SAT>IP Receiver Plugin

# Receive buffer (integer)
#satip-buffer=4194304

# Request multicast stream (boolean)
#satip-multicast=0

# Host (string)
#satip-host=

[linsys_hdsdi] # HD-SDI Input

# Link # (integer)
#linsys-hdsdi-link=0

# Video ID (integer)
#linsys-hdsdi-id-video=0

# Aspect ratio (string)
#linsys-hdsdi-aspect-ratio=

# Audio configuration (string)
#linsys-hdsdi-audio=0=1,1

[access_srt] # SRT input

# SRT chunk size (bytes) (integer)
#chunk-size=1316

# Return poll wait after timeout milliseconds (-1 = infinite) (integer)
#poll-timeout=-1

# SRT latency (ms) (integer)
#latency=125

# Password for stream encryption (string)
#passphrase=

# Crypto key length in bytes (integer)
#key-length=16

[vdr] # VDR recordings

# Chapter offset in ms (integer)
#vdr-chapter-offset=0

# Frame rate (float)
#vdr-fps=25.000000

[concat] # Concatenated inputs

# Inputs list (string)
#concat-list=

[live555] # RTP/RTSP/SDP demuxer (using Live555)

# Use RTP over RTSP (TCP) (boolean)
#rtsp-tcp=0

# Client port (integer)
#rtp-client-port=-1

# Force multicast RTP via RTSP (boolean)
#rtsp-mcast=0

# Tunnel RTSP and RTP over HTTP (boolean)
#rtsp-http=0

# HTTP tunnel port (integer)
#rtsp-http-port=80

# Kasenna RTSP dialect (boolean)
#rtsp-kasenna=0

# WMServer RTSP dialect (boolean)
#rtsp-wmserver=0

# Username (string)
#rtsp-user=

# Password (string)
#rtsp-pwd=

# RTSP frame buffer size (integer)
#rtsp-frame-buffer-size=250000

[cdda] # Audio CD input

# Audio CD device (string)
#cd-audio=/dev/sr0

# CDDB Server (string)
#cddb-server=freedb.videolan.org

# CDDB port (integer)
#cddb-port=80

[access_mms] # Microsoft Media Server (MMS) input

# TCP/UDP timeout (ms) (integer)
#mms-timeout=5000

# Force selection of all streams (boolean)
#mms-all=0

# Maximum bitrate (integer)
#mms-maxbitrate=0

[ftp] # FTP input

# Username (string)
#ftp-user=

# Password (string)
#ftp-pwd=

# FTP account (string)
#ftp-account=anonymous

[sftp] # SFTP input

# SFTP port (integer)
#sftp-port=22

# Username (string)
#sftp-user=

# Password (string)
#sftp-pwd=

[http] # HTTP input

# Auto re-connect (boolean)
#http-reconnect=0

[udp] # UDP input

# UDP Source timeout (sec) (integer)
#udp-timeout=-1

[shm] # Shared memory framebuffer

# Frame rate (float)
#shm-fps=10.000000

# Frame buffer depth (integer)
#shm-depth=0

# Frame buffer width (integer)
#shm-width=800

# Frame buffer height (integer)
#shm-height=480

[filesystem] # File input

# List special files (boolean)
#list-special-files=0

[avio] # libavformat AVIO access

# Advanced options (string)
#avio-options=

# Advanced options (string)
#sout-avio-options=

[timecode] # Time code subpicture elementary stream generator

# Frame rate (string)
#timecode-fps=25/1

[rtp] # Real-Time Protocol (RTP) input

# RTCP (local) port (integer)
#rtcp-port=0

# SRTP key (hexadecimal) (string)
#srtp-key=

# SRTP salt (hexadecimal) (string)
#srtp-salt=

# Maximum RTP sources (integer)
#rtp-max-src=1

# RTP source timeout (sec) (integer)
#rtp-timeout=5

# Maximum RTP sequence number dropout (integer)
#rtp-max-dropout=3000

# Maximum RTP sequence number misordering (integer)
#rtp-max-misorder=100

# RTP payload format assumed for dynamic payloads (string)
#rtp-dynamic-pt=

[access] # HTTPS input

# Cookies forwarding (boolean)
#http-forward-cookies=1

# User agent (string)
#http-user-agent=

[nfs] # NFS input

# Set NFS uid/guid automatically (boolean)
#nfs-auto-guid=1

[smb] # SMB input

# Username (string)
#smb-user=

# Password (string)
#smb-pwd=

# SMB domain (string)
#smb-domain=

[libbluray] # Blu-ray Disc support (libbluray)

# Blu-ray menus (boolean)
#bluray-menu=1

# Region code (string)
#bluray-region=B

[access_alsa] # ALSA audio capture

# Stereo (boolean)
#alsa-stereo=1

# Sample rate (integer)
#alsa-samplerate=48000

[file] # Secrets are stored on a file without any encryption

# ? (string)
#keystore-file=

[qt] # Qt interface

# Start in minimal view (without menus) (boolean)
#qt-minimal-view=0

# Systray icon (boolean)
qt-system-tray=0

# Show notification popup on track change (integer)
#qt-notification=1

# Start VLC with only a systray icon (boolean)
#qt-start-minimized=0

# Pause the video playback when minimized (boolean)
#qt-pause-minimized=0

# Windows opacity between 0.1 and 1 (float)
#qt-opacity=1.000000

# Fullscreen controller opacity between 0.1 and 1 (float)
#qt-fs-opacity=0.800000

# Resize interface to the native video size (boolean)
#qt-video-autoresize=1

# Show playing item name in window title (boolean)
#qt-name-in-title=1

# Show a controller in fullscreen mode (boolean)
#qt-fs-controller=1

# Save the recently played items in the menu (boolean)
#qt-recentplay=1

# List of words separated by | to filter (string)
#qt-recentplay-filter=

# Continue playback? (integer)
#qt-continue=1

# Embed the file browser in open dialog (boolean)
#qt-embedded-open=0

# Show advanced preferences over simple ones (boolean)
#qt-advanced-pref=0

# Show unimportant error and warnings dialogs (boolean)
#qt-error-dialogs=1

# Define the colors of the volume slider (string)
#qt-slider-colours=153;210;153;20;210;20;255;199;15;245;39;29

# Ask for network policy at start (boolean)
qt-privacy-ask=0

# Define which screen fullscreen goes (integer)
#qt-fullscreen-screennumber=-1

# Load extensions on startup (boolean)
#qt-autoload-extensions=1

# Display background cone or art (boolean)
#qt-bgcone=1

# Expanding background cone or art (boolean)
#qt-bgcone-expands=0

# Allow automatic icon changes (boolean)
#qt-icon-change=1

# Maximum Volume displayed (integer)
#qt-max-volume=125

# Fullscreen controller mouse sensitivity (integer)
#qt-fs-sensitivity=3

# When to raise the interface (integer)
#qt-auto-raise=1

[skins2] # Skinnable Interface

# Skin to use (string)
#skins2-last=

# Config of last used skin (string)
#skins2-config=

# Enable transparency effects (boolean)
#skins2-transparency=0

# Use a skinned playlist (boolean)
#skinned-playlist=1

# Display video in a skinned window if any (boolean)
#skinned-video=1

[ncurses] # Ncurses interface

# Filebrowser starting point (string)
#browse-dir=

[sap] # Network streams (SAP)

# SAP multicast address (string)
#sap-addr=

# SAP timeout (seconds) (integer)
#sap-timeout=1800

# Try to parse the announce (boolean)
#sap-parse=1

# SAP Strict mode (boolean)
#sap-strict=0

[upnp] # Universal Plug'n'Play

# SAT>IP channel list (string)
#satip-channelist=auto

# Custom SAT>IP channel list URL (string)
#satip-channellist-url=

[podcast] # Podcasts

# Podcast URLs list (string)
#podcast-urls=

[afile] # File audio output

# Output file (string)
#audiofile-file=audiofile.wav

# Output format (string)
#audiofile-format=s16

# Number of output channels (integer)
#audiofile-channels=0

# Add WAVE header (boolean)
#audiofile-wav=1

[alsa] # ALSA audio output

# Audio output device (string)
#alsa-audio-device=default

# Audio output channels (integer)
#alsa-audio-channels=6

# Software gain (float)
#alsa-gain=1.000000

[amem] # Audio memory output

# Sample format (string)
#amem-format=S16N

# Sample rate (integer)
#amem-rate=44100

# Channels count (integer)
#amem-channels=2

[http] # HTTP stream output

# Username (string)
#sout-http-user=

# Password (string)
#sout-http-pwd=

# Mime (string)
#sout-http-mime=

# Metacube (boolean)
#sout-http-metacube=0

[access_output_srt] # SRT stream output

# SRT chunk size (bytes) (integer)
#chunk-size=1316

# Return poll wait after timeout milliseconds (-1 = infinite) (integer)
#poll-timeout=100

# SRT latency (ms) (integer)
#latency=125

# Password for stream encryption (string)
#passphrase=

# Crypto key length in bytes (integer)
#key-length=16

[access_output_livehttp] # HTTP Live streaming output

# Segment length (integer)
#sout-livehttp-seglen=10

# Number of segments (integer)
#sout-livehttp-numsegs=0

# Number of first segment (integer)
#sout-livehttp-initial-segment-number=1

# Split segments anywhere (boolean)
#sout-livehttp-splitanywhere=0

# Delete segments (boolean)
#sout-livehttp-delsegs=1

# Use muxers rate control mechanism (boolean)
#sout-livehttp-ratecontrol=0

# Allow cache (boolean)
#sout-livehttp-caching=0

# Use randomized IV for encryption (boolean)
#sout-livehttp-generate-iv=0

# Index file (string)
#sout-livehttp-index=

# Full URL to put in index file (string)
#sout-livehttp-index-url=

# AES key URI to place in playlist (string)
#sout-livehttp-key-uri=

# AES key file (string)
#sout-livehttp-key-file=

# File where vlc reads key-uri and keyfile-location (string)
#sout-livehttp-key-loadfile=

[access_output_shout] # IceCAST output

# Stream name (string)
#sout-shout-name=VLC media player - Live stream

# Stream description (string)
#sout-shout-description=Live stream from VLC media player

# Stream MP3 (boolean)
#sout-shout-mp3=0

# Genre description (string)
#sout-shout-genre=Alternative

# URL description (string)
#sout-shout-url=http://www.videolan.org/vlc

# Bitrate (string)
#sout-shout-bitrate=

# Samplerate (string)
#sout-shout-samplerate=

# Number of channels (string)
#sout-shout-channels=

# Ogg Vorbis Quality (string)
#sout-shout-quality=

# Stream public (boolean)
#sout-shout-public=0

[udp] # UDP stream output

# Caching value (ms) (integer)
#sout-udp-caching=300

# Group packets (integer)
#sout-udp-group=1

[file] # File stream output

# Overwrite existing file (boolean)
#sout-file-overwrite=1

# Append to file (boolean)
#sout-file-append=0

# Format time and date (boolean)
#sout-file-format=0

# Synchronous writing (boolean)
#sout-file-sync=0

[xcb_xv] # XVideo output (XCB)

# XVideo adaptor number (integer)
#xvideo-adaptor=-1

# XVideo format id (integer)
#xvideo-format-id=0

[flaschen] # Flaschen-Taschen video output

# Flaschen-Taschen display address (string)
#flaschen-display=

# Width (integer)
#flaschen-width=25

# Height (integer)
#flaschen-height=20

[gles2] # OpenGL for Embedded Systems 2 video output

# OpenGL ES 2 extension (string)
#gles2=

# Open GL/GLES hardware converter (string)
#glconv=

# Rendering intent for color conversion (integer)
#rendering-intent=1

# Display primaries (integer)
#target-prim=0

# Display gamma / transfer function (integer)
#target-trc=0

# Tone-mapping algorithm (integer)
#tone-mapping=3

# Tone-mapping parameter (float)
#tone-mapping-param=0.000000

# Highlight clipped pixels (boolean)
#tone-mapping-warn=0

# Dithering algorithm (integer)
#dither-algo=-1

# Dither depth override (0 = framebuffer depth) (integer)
#dither-depth=0

# Tone-mapping desaturation coefficient (float)
#tone-mapping-desat=0.500000

[fb] # GNU/Linux framebuffer video output

# Framebuffer device (string)
#fbdev=/dev/fb0

# Run fb on current tty (boolean)
#fb-tty=1

# Image format (default RGB) (string)
#fb-chroma=

# Framebuffer resolution to use (integer)
#fb-mode=4

# Framebuffer uses hw acceleration (boolean)
#fb-hw-accel=1

[xcb_x11] # X11 video output (XCB)

[xdg_shell] # XDG shell surface

# Wayland display (string)
#wl-display=

[vdummy] # Dummy video output

# Dummy image chroma format (string)
#dummy-chroma=

[xcb_window] # X11 video window (XCB)

# X11 display (string)
#x11-display=

[gl] # OpenGL video output

# OpenGL extension (string)
#gl=

# Open GL/GLES hardware converter (string)
#glconv=

# Rendering intent for color conversion (integer)
#rendering-intent=1

# Display primaries (integer)
#target-prim=0

# Display gamma / transfer function (integer)
#target-trc=0

# Tone-mapping algorithm (integer)
#tone-mapping=3

# Tone-mapping parameter (float)
#tone-mapping-param=0.000000

# Highlight clipped pixels (boolean)
#tone-mapping-warn=0

# Dithering algorithm (integer)
#dither-algo=-1

# Dither depth override (0 = framebuffer depth) (integer)
#dither-depth=0

# Tone-mapping desaturation coefficient (float)
#tone-mapping-desat=0.500000

[wl_shell] # Wayland shell surface

# Wayland display (string)
#wl-display=

[yuv] # YUV video output

# device, fifo or filename (string)
#yuv-file=stream.yuv

# Chroma used (string)
#yuv-chroma=

# Add a YUV4MPEG2 header (boolean)
#yuv-yuv4mpeg2=0

[vmem] # Video memory output

# Width (integer)
#vmem-width=320

# Height (integer)
#vmem-height=200

# Pitch (integer)
#vmem-pitch=640

# Chroma (string)
#vmem-chroma=RV16

[notify] # LibNotify Notification Plugin

# Timeout (ms) (integer)
#notify-timeout=4000

[setid] # Change the id of an elementary stream

# Elementary Stream ID (integer)
#sout-setid-id=0

# New ES ID (integer)
#sout-setid-new-id=0

# Elementary Stream ID (integer)
#sout-setlang-id=0

# Language (string)
#sout-setlang-lang=eng

[stream_out_chromecast] # Chromecast stream output

# ? (string)
#sout-chromecast-ip=

# ? (integer)
#sout-chromecast-port=8009

# ? (boolean)
#sout-chromecast-video=1

# HTTP port (integer)
#sout-chromecast-http-port=8010

# Performance warning (integer)
#sout-chromecast-show-perf-warning=1

# Enable Audio passthrough (boolean)
#sout-chromecast-audio-passthrough=0

# Conversion quality (integer)
#sout-chromecast-conversion-quality=1

[stream_out_rtp] # RTP stream output

# Destination (string)
#sout-rtp-dst=

# SDP (string)
#sout-rtp-sdp=

# Muxer (string)
#sout-rtp-mux=

# SAP announcing (boolean)
#sout-rtp-sap=0

# Session name (string)
#sout-rtp-name=

# Session category (string)
#sout-rtp-cat=

# Session description (string)
#sout-rtp-description=

# Session URL (string)
#sout-rtp-url=

# Session email (string)
#sout-rtp-email=

# Transport protocol (string)
#sout-rtp-proto=udp

# Port (integer)
#sout-rtp-port=5004

# Audio port (integer)
#sout-rtp-port-audio=0

# Video port (integer)
#sout-rtp-port-video=0

# Hop limit (TTL) (integer)
#sout-rtp-ttl=-1

# RTP/RTCP multiplexing (boolean)
#sout-rtp-rtcp-mux=0

# Caching value (ms) (integer)
#sout-rtp-caching=300

# SRTP key (hexadecimal) (string)
#sout-rtp-key=

# SRTP salt (hexadecimal) (string)
#sout-rtp-salt=

# MP4A LATM (boolean)
#sout-rtp-mp4a-latm=0

# RTSP session timeout (s) (integer)
#rtsp-timeout=60

# Username (string)
#sout-rtsp-user=

# Password (string)
#sout-rtsp-pwd=

[bridge] # Bridge stream output

# ID (integer)
#sout-bridge-out-id=0

# Destination bridge-in name (string)
#sout-bridge-out-in-name=default

# Delay (integer)
#sout-bridge-in-delay=0

# ID Offset (integer)
#sout-bridge-in-id-offset=8192

# Name of current instance (string)
#sout-bridge-in-name=default

# Fallback to placeholder stream when out of data (boolean)
#sout-bridge-in-placeholder=0

# Placeholder delay (integer)
#sout-bridge-in-placeholder-delay=200

# Wait for I frame before toggling placeholder (boolean)
#sout-bridge-in-placeholder-switch-on-iframe=1

[stream_out_standard] # Standard stream output

# Output access method (string)
#sout-standard-access=

# Output muxer (string)
#sout-standard-mux=

# Output destination (string)
#sout-standard-dst=

# Address to bind to (helper setting for dst) (string)
#sout-standard-bind=

# Filename for stream (helper setting for dst) (string)
#sout-standard-path=

# SAP announcing (boolean)
#sout-standard-sap=0

# Session name (string)
#sout-standard-name=

# Session description (string)
#sout-standard-description=

# Session URL (string)
#sout-standard-url=

# Session email (string)
#sout-standard-email=

[smem] # Stream output to memory buffer

# Time Synchronized output (boolean)
#sout-smem-time-sync=1

[mosaic_bridge] # Mosaic bridge stream output

# ID (string)
#sout-mosaic-bridge-id=Id

# Video width (integer)
#sout-mosaic-bridge-width=0

# Video height (integer)
#sout-mosaic-bridge-height=0

# Sample aspect ratio (string)
#sout-mosaic-bridge-sar=1:1

# Image chroma (string)
#sout-mosaic-bridge-chroma=

# Video filter (string)
#sout-mosaic-bridge-vfilter=

# Transparency (integer)
#sout-mosaic-bridge-alpha=255

# X offset (integer)
#sout-mosaic-bridge-x=-1

# Y offset (integer)
#sout-mosaic-bridge-y=-1

[delay] # Delay a stream

# Elementary Stream ID (integer)
#sout-delay-id=0

# Delay of the ES (ms) (integer)
#sout-delay-delay=0

[stream_out_chromaprint] # Chromaprint stream output

# Duration of the fingerprinting (integer)
#duration=90

[es] # Elementary stream output

# Output access method (string)
#sout-es-access=

# Output muxer (string)
#sout-es-mux=

# Output URL (string)
#sout-es-dst=

# Audio output access method (string)
#sout-es-access-audio=

# Audio output muxer (string)
#sout-es-mux-audio=

# Audio output URL (string)
#sout-es-dst-audio=

# Video output access method (string)
#sout-es-access-video=

# Video output muxer (string)
#sout-es-mux-video=

# Video output URL (string)
#sout-es-dst-video=

[stats] # Writes statistic info about stream

# Output file (string)
#sout-stats-output=

# Prefix to show on output line (string)
#sout-stats-prefix=stats

[stream_out_transcode] # Transcode stream output

# Video encoder (string)
#sout-transcode-venc=

# Destination video codec (string)
#sout-transcode-vcodec=

# Video bitrate (integer)
#sout-transcode-vb=0

# Video scaling (float)
#sout-transcode-scale=0.000000

# Video frame-rate (string)
#sout-transcode-fps=

# Deinterlace video (boolean)
#sout-transcode-deinterlace=0

# Deinterlace module (string)
#sout-transcode-deinterlace-module=deinterlace

# Video width (integer)
#sout-transcode-width=0

# Video height (integer)
#sout-transcode-height=0

# Maximum video width (integer)
#sout-transcode-maxwidth=0

# Maximum video height (integer)
#sout-transcode-maxheight=0

# Video filter (string)
#sout-transcode-vfilter=

# Audio encoder (string)
#sout-transcode-aenc=

# Destination audio codec (string)
#sout-transcode-acodec=

# Audio bitrate (integer)
#sout-transcode-ab=96

# Audio language (string)
#sout-transcode-alang=

# Audio channels (integer)
#sout-transcode-channels=0

# Audio sample rate (integer)
#sout-transcode-samplerate=0

# Audio filter (string)
#sout-transcode-afilter=

# Subtitle encoder (string)
#sout-transcode-senc=

# Destination subtitle codec (string)
#sout-transcode-scodec=

# Destination subtitle codec (boolean)
#sout-transcode-soverlay=0

# Overlays (string)
#sout-transcode-sfilter=

# Number of threads (integer)
#sout-transcode-threads=0

# Picture pool size (integer)
#sout-transcode-pool-size=10

# High priority (boolean)
#sout-transcode-high-priority=0

[display] # Display stream output

# Enable audio (boolean)
#sout-display-audio=1

# Enable video (boolean)
#sout-display-video=1

# Delay (ms) (integer)
#sout-display-delay=100

[record] # Record stream output

# Destination prefix (string)
#sout-record-dst-prefix=

[freetype] # Freetype2 font renderer

# Font (string)
#freetype-font=Serif Bold

# Monospace Font (string)
#freetype-monofont=Monospace

# Font size in pixels (integer)
#freetype-fontsize=0

# Relative font size (integer)
#freetype-rel-fontsize=0

# Text opacity (integer)
#freetype-opacity=255

# Text default color (integer)
#freetype-color=16777215

# Force bold (boolean)
#freetype-bold=0

# Background opacity (integer)
#freetype-background-opacity=0

# Background color (integer)
#freetype-background-color=0

# Outline opacity (integer)
#freetype-outline-opacity=255

# Outline color (integer)
#freetype-outline-color=0

# Outline thickness (integer)
#freetype-outline-thickness=4

# Shadow opacity (integer)
#freetype-shadow-opacity=128

# Shadow color (integer)
#freetype-shadow-color=0

# Shadow angle (float)
#freetype-shadow-angle=-45.000000

# Shadow distance (float)
#freetype-shadow-distance=0.060000

# Use YUVP renderer (boolean)
#freetype-yuvp=0

# Text direction (integer)
#freetype-text-direction=0

[svg] # svg

# SVG template file (string)
#svg-template-file=

[gradient] # Gradient video filter

# Distort mode (string)
#gradient-mode=gradient

# Gradient image type (integer)
#gradient-type=0

# Apply cartoon effect (boolean)
#gradient-cartoon=1

[ball] # Ball video filter

# Ball color (string)
#ball-color=red

# Ball speed (integer)
#ball-speed=4

# Ball size (integer)
#ball-size=10

# Gradient threshold (integer)
#ball-gradient-threshold=40

# Edge visible (boolean)
#ball-edge-visible=1

[croppadd] # Video cropping filter

# Pixels to crop from top (integer)
#croppadd-croptop=0

# Pixels to crop from bottom (integer)
#croppadd-cropbottom=0

# Pixels to crop from left (integer)
#croppadd-cropleft=0

# Pixels to crop from right (integer)
#croppadd-cropright=0

# Pixels to padd to top (integer)
#croppadd-paddtop=0

# Pixels to padd to bottom (integer)
#croppadd-paddbottom=0

# Pixels to padd to left (integer)
#croppadd-paddleft=0

# Pixels to padd to right (integer)
#croppadd-paddright=0

[deinterlace] # Deinterlacing video filter

# Streaming deinterlace mode (string)
#sout-deinterlace-mode=blend

# Phosphor chroma mode for 4:2:0 input (integer)
#sout-deinterlace-phosphor-chroma=2

# Phosphor old field dimmer strength (integer)
#sout-deinterlace-phosphor-dimmer=2

[sepia] # Sepia video filter

# Sepia intensity (integer)
#sepia-intensity=120

[alphamask] # Alpha mask video filter

# Transparency mask (string)
#alphamask-mask=

[gaussianblur] # Gaussian blur video filter

# Gaussian's std deviation (float)
#gaussianblur-sigma=2.000000

[extract] # Extract RGB component video filter

# RGB component to extract (integer)
#extract-component=16711680

[gradfun] # Gradfun video filter

# Radius (integer)
#gradfun-radius=16

# Strength (float)
#gradfun-strength=1.200000

[sharpen] # Sharpen video filter

# Sharpen strength (0-2) (float)
#sharpen-sigma=0.050000

[mirror] # Mirror video filter

# Mirror orientation (integer)
#mirror-split=0

# Direction (integer)
#mirror-direction=0

[anaglyph] # Convert 3D picture to anaglyph image video filter

# Color scheme (string)
#anaglyph-scheme=red-cyan

[fps] # FPS conversion video filter

# Frame rate (string)
#fps-fps=

[postproc] # Video post processing filter

# Post processing quality (integer)
#postproc-q=6

# FFmpeg post processing filter chains (string)
#postproc-name=default

[bluescreen] # Bluescreen video filter

# Bluescreen U value (integer)
#bluescreen-u=120

# Bluescreen V value (integer)
#bluescreen-v=90

# Bluescreen U tolerance (integer)
#bluescreen-ut=17

# Bluescreen V tolerance (integer)
#bluescreen-vt=17

[erase] # Erase video filter

# Image mask (string)
#erase-mask=

# X coordinate (integer)
#erase-x=0

# Y coordinate (integer)
#erase-y=0

[blendbench] # Blending benchmark filter

# Number of time to blend (integer)
#blendbench-loops=1000

# Alpha of the blended image (integer)
#blendbench-alpha=128

# Image to be blended onto (string)
#blendbench-base-image=

# Chroma for the base image (string)
#blendbench-base-chroma=I420

# Image which will be blended (string)
#blendbench-blend-image=

# Chroma for the blend image (string)
#blendbench-blend-chroma=YUVA

[colorthres] # Color threshold filter

# Color (integer)
#colorthres-color=16711680

# Saturation threshold (integer)
#colorthres-saturationthres=20

# Similarity threshold (integer)
#colorthres-similaritythres=15

[posterize] # Posterize video filter

# Posterize level (integer)
#posterize-level=6

[rotate] # Rotate video filter

# Angle in degrees (float)
#rotate-angle=30.000000

# Use motion sensors (boolean)
#rotate-use-motion=0

[transform] # Video transformation filter

# Transform type (string)
#transform-type=90

[grain] # Grain video filter

# Variance (float)
#grain-variance=2.000000

# Minimal period (integer)
#grain-period-min=1

# Maximal period (integer)
#grain-period-max=48

[canvas] # Canvas video filter

# Output width (integer)
#canvas-width=0

# Output height (integer)
#canvas-height=0

# Output picture aspect ratio (string)
#canvas-aspect=

# Pad video (boolean)
#canvas-padd=1

[puzzle] # Puzzle interactive game video filter

# Number of puzzle rows (integer)
#puzzle-rows=4

# Number of puzzle columns (integer)
#puzzle-cols=4

# Border (integer)
#puzzle-border=3

# Small preview (boolean)
#puzzle-preview=0

# Small preview size (integer)
#puzzle-preview-size=15

# Piece edge shape size (integer)
#puzzle-shape-size=90

# Auto shuffle (integer)
#puzzle-auto-shuffle=0

# Auto solve (integer)
#puzzle-auto-solve=0

# Rotation (integer)
#puzzle-rotation=0

# Game mode (integer)
#puzzle-mode=0

[motionblur] # Motion blur filter

# Blur factor (1-127) (integer)
#blur-factor=80

[hqdn3d] # High Quality 3D Denoiser filter

# Spatial luma strength (0-254) (float)
#hqdn3d-luma-spat=4.000000

# Spatial chroma strength (0-254) (float)
#hqdn3d-chroma-spat=3.000000

# Temporal luma strength (0-254) (float)
#hqdn3d-luma-temp=6.000000

# Temporal chroma strength (0-254) (float)
#hqdn3d-chroma-temp=4.500000

[adjust] # Image properties filter

# Image contrast (0-2) (float)
#contrast=1.000000

# Image brightness (0-2) (float)
#brightness=1.000000

# Image hue (-180..180) (float)
#hue=0.000000

# Image saturation (0-3) (float)
#saturation=1.000000

# Image gamma (0-10) (float)
#gamma=1.000000

# Brightness threshold (boolean)
#brightness-threshold=0

[antiflicker] # antiflicker video filter

# Window size (integer)
#antiflicker-window-size=10

# Softening value (integer)
#antiflicker-softening-size=10

[scene] # Scene video filter

# Image format (string)
#scene-format=png

# Image width (integer)
#scene-width=-1

# Image height (integer)
#scene-height=-1

# Filename prefix (string)
#scene-prefix=scene

# Directory path prefix (string)
#scene-path=

# Always write to the same file (boolean)
#scene-replace=0

# Recording ratio (integer)
#scene-ratio=50

[headphone] # Headphone virtual spatialization effect

# Characteristic dimension (integer)
#headphone-dim=10

# Compensate delay (boolean)
#headphone-compensate=0

# No decoding of Dolby Surround (boolean)
#headphone-dolby=0

[speex_resampler] # Speex resampler

# Resampling quality (integer)
#speex-resampler-quality=4

[spatialaudio] # Ambisonics renderer and binauralizer

# Headphones mode (binaural) (boolean)
#spatialaudio-headphones=0

# HRTF file for the binauralization (string)
#hrtf-file=

[samplerate] # Secret Rabbit Code (libsamplerate) resampler

# Sample rate converter type (integer)
#src-converter-type=2

[chorus_flanger] # Sound Delay

# Delay time (float)
#delay-time=20.000000

# Sweep Depth (float)
#sweep-depth=6.000000

# Sweep Rate (float)
#sweep-rate=6.000000

# Feedback gain (float)
#feedback-gain=0.500000

# Wet mix (float)
#wet-mix=0.400000

# Dry Mix (float)
#dry-mix=0.400000

[normvol] # Volume normalizer

# Number of audio buffers (integer)
#norm-buff-size=20

# Maximal volume level (float)
#norm-max-level=2.000000

[scaletempo_pitch] # Pitch Shifter

# Stride Length (integer)
#scaletempo-stride=30

# Overlap Length (float)
#scaletempo-overlap=0.200000

# Search Length (integer)
#scaletempo-search=14

# Pitch Shift (float)
#pitch-shift=0.000000

[compressor] # Dynamic range compressor

# RMS/peak (float)
#compressor-rms-peak=0.200000

# Attack time (float)
#compressor-attack=25.000000

# Release time (float)
#compressor-release=100.000000

# Threshold level (float)
#compressor-threshold=-11.000000

# Ratio (float)
#compressor-ratio=4.000000

# Knee radius (float)
#compressor-knee=5.000000

# Makeup gain (float)
#compressor-makeup-gain=7.000000

[mono] # Stereo to mono downmixer

# Use downmix algorithm (boolean)
#sout-mono-downmix=1

# Select channel to keep (integer)
#sout-mono-channel=-1

[param_eq] # Parametric Equalizer

# Low freq (Hz) (float)
#param-eq-lowf=100.000000

# Low freq gain (dB) (float)
#param-eq-lowgain=0.000000

# High freq (Hz) (float)
#param-eq-highf=10000.000000

# High freq gain (dB) (float)
#param-eq-highgain=0.000000

# Freq 1 (Hz) (float)
#param-eq-f1=300.000000

# Freq 1 gain (dB) (float)
#param-eq-gain1=0.000000

# Freq 1 Q (float)
#param-eq-q1=3.000000

# Freq 2 (Hz) (float)
#param-eq-f2=1000.000000

# Freq 2 gain (dB) (float)
#param-eq-gain2=0.000000

# Freq 2 Q (float)
#param-eq-q2=3.000000

# Freq 3 (Hz) (float)
#param-eq-f3=3000.000000

# Freq 3 gain (dB) (float)
#param-eq-gain3=0.000000

# Freq 3 Q (float)
#param-eq-q3=3.000000

[soxr] # soxr

# Resampling quality (integer)
#soxr-resampler-quality=2

[equalizer] # Equalizer with 10 bands

# Equalizer preset (string)
#equalizer-preset=flat

# Bands gain (string)
#equalizer-bands=

# Two pass (boolean)
#equalizer-2pass=0

# Use VLC frequency bands (boolean)
#equalizer-vlcfreqs=1

# Global gain (float)
#equalizer-preamp=12.000000

[spatializer] # Audio Spatializer

# Room size (float)
#spatializer-roomsize=0.850000

# Room width (float)
#spatializer-width=1.000000

# Wet (float)
#spatializer-wet=0.400000

# Dry (float)
#spatializer-dry=0.500000

# Damp (float)
#spatializer-damp=0.500000

[gain] # Gain control filter

# Gain multiplier (float)
#gain-value=1.000000

[scaletempo] # Audio tempo scaler synched with rate

# Stride Length (integer)
#scaletempo-stride=30

# Overlap Length (float)
#scaletempo-overlap=0.200000

# Search Length (integer)
#scaletempo-search=14

[stereo_widen] # Simple stereo widening effect

# Delay time (float)
#stereowiden-delay=20.000000

# Feedback gain (float)
#stereowiden-feedback=0.300000

# Crossfeed (float)
#stereowiden-crossfeed=0.300000

# Dry mix (float)
#stereowiden-dry-mix=0.800000

[audiobargraph_a] # Audio part of the BarGraph function

# Defines if BarGraph information should be sent (integer)
#audiobargraph_a-bargraph=1

# Sends the barGraph information every n audio packets (integer)
#audiobargraph_a-bargraph_repetition=4

# Defines if silence alarm information should be sent (integer)
#audiobargraph_a-silence=1

# Time window to use in ms (integer)
#audiobargraph_a-time_window=5000

# Minimum Audio level to raise the alarm (float)
#audiobargraph_a-alarm_threshold=0.020000

# Time between two alarm messages in ms (integer)
#audiobargraph_a-repetition_time=2000

[remap] # Audio channel remapper

# Left (integer)
#aout-remap-channel-left=0

# Center (integer)
#aout-remap-channel-center=1

# Right (integer)
#aout-remap-channel-right=2

# Rear left (integer)
#aout-remap-channel-rearleft=3

# Rear center (integer)
#aout-remap-channel-rearcenter=4

# Rear right (integer)
#aout-remap-channel-rearright=5

# Side left (integer)
#aout-remap-channel-middleleft=6

# Side right (integer)
#aout-remap-channel-middleright=7

# Low-frequency effects (integer)
#aout-remap-channel-lfe=8

# Normalize channels (boolean)
#aout-remap-normalize=1

[clone] # Clone video filter

# Number of clones (integer)
#clone-count=2

# Video output modules (string)
#clone-vout-list=

[panoramix] # Panoramix: wall with overlap video filter

# Number of columns (integer)
#panoramix-cols=-1

# Number of rows (integer)
#panoramix-rows=-1

# length of the overlapping area (in %) (integer)
#panoramix-bz-length=100

# height of the overlapping area (in %) (integer)
#panoramix-bz-height=100

# Attenuation (boolean)
#panoramix-attenuate=1

# Attenuation, begin (in %) (integer)
#panoramix-bz-begin=0

# Attenuation, middle (in %) (integer)
#panoramix-bz-middle=50

# Attenuation, end (in %) (integer)
#panoramix-bz-end=100

# middle position (in %) (integer)
#panoramix-bz-middle-pos=50

# Gamma (Red) correction (float)
#panoramix-bz-gamma-red=1.000000

# Gamma (Green) correction (float)
#panoramix-bz-gamma-green=1.000000

# Gamma (Blue) correction (float)
#panoramix-bz-gamma-blue=1.000000

# Black Crush for Red (integer)
#panoramix-bz-blackcrush-red=140

# Black Crush for Green (integer)
#panoramix-bz-blackcrush-green=140

# Black Crush for Blue (integer)
#panoramix-bz-blackcrush-blue=140

# White Crush for Red (integer)
#panoramix-bz-whitecrush-red=200

# White Crush for Green (integer)
#panoramix-bz-whitecrush-green=200

# White Crush for Blue (integer)
#panoramix-bz-whitecrush-blue=200

# Black Level for Red (integer)
#panoramix-bz-blacklevel-red=150

# Black Level for Green (integer)
#panoramix-bz-blacklevel-green=150

# Black Level for Blue (integer)
#panoramix-bz-blacklevel-blue=150

# White Level for Red (integer)
#panoramix-bz-whitelevel-red=0

# White Level for Green (integer)
#panoramix-bz-whitelevel-green=0

# White Level for Blue (integer)
#panoramix-bz-whitelevel-blue=0

# Active windows (string)
#panoramix-active=

[wall] # Wall video filter

# Number of columns (integer)
#wall-cols=3

# Number of rows (integer)
#wall-rows=3

# Active windows (string)
#wall-active=

# Element aspect ratio (string)
#wall-element-aspect=16:9

[console] # Console logger

[syslog] # System logger (syslog)

# System log (syslog) (boolean)
#syslog=0

# Debug messages (boolean)
#syslog-debug=0

# Identity (string)
#syslog-ident=vlc

# Facility (string)
#syslog-facility=user

[file] # File logger

# Log to file (boolean)
#file-logging=0

# Log filename (string)
#logfile=

# Log format (string)
#logmode=text

# Verbosity (integer)
#log-verbose=-1

[vaapi_filters] # Video Accelerated API filters

# Denoise strength (0-2) (float)
#denoise-sigma=1.000000

[ps] # PS muxer

# DTS delay (ms) (integer)
#sout-ps-dts-delay=200

# PES maximum size (integer)
#sout-ps-pes-max-size=65500

[avi] # AVI muxer

# Artist (string)
#sout-avi-artist=

# Date (string)
#sout-avi-date=

# Genre (string)
#sout-avi-genre=

# Copyright (string)
#sout-avi-copyright=

# Comment (string)
#sout-avi-comment=

# Name (string)
#sout-avi-name=

# Subject (string)
#sout-avi-subject=

# Encoder (string)
#sout-avi-encoder=VLC Media Player - 3.0.9.2 Vetinari

# Keywords (string)
#sout-avi-keywords=

[mux_ts] # TS muxer (libdvbpsi)

# Digital TV Standard (string)
#sout-ts-standard=dvb

# Video PID (integer)
#sout-ts-pid-video=100

# Audio PID (integer)
#sout-ts-pid-audio=200

# SPU PID (integer)
#sout-ts-pid-spu=300

# PMT PID (integer)
#sout-ts-pid-pmt=32

# TS ID (integer)
#sout-ts-tsid=0

# NET ID (integer)
#sout-ts-netid=0

# PMT Program numbers (string)
#sout-ts-program-pmt=

# Set PID to ID of ES (boolean)
#sout-ts-es-id-pid=0

# Mux PMT (requires --sout-ts-es-id-pid) (string)
#sout-ts-muxpmt=

# SDT Descriptors (requires --sout-ts-es-id-pid) (string)
#sout-ts-sdtdesc=

# Data alignment (boolean)
#sout-ts-alignment=1

# Shaping delay (ms) (integer)
#sout-ts-shaping=200

# Use keyframes (boolean)
#sout-ts-use-key-frames=0

# PCR interval (ms) (integer)
#sout-ts-pcr=70

# Minimum B (deprecated) (integer)
#sout-ts-bmin=0

# Maximum B (deprecated) (integer)
#sout-ts-bmax=0

# DTS delay (ms) (integer)
#sout-ts-dts-delay=400

# Crypt audio (boolean)
#sout-ts-crypt-audio=1

# Crypt video (boolean)
#sout-ts-crypt-video=1

# CSA Key (string)
#sout-ts-csa-ck=

# Second CSA Key (string)
#sout-ts-csa2-ck=

# CSA Key in use (string)
#sout-ts-csa-use=1

# Packet size in bytes to encrypt (integer)
#sout-ts-csa-pkt=188

[mp4] # MP4/MOV muxer

# Create "Fast Start" files (boolean)
#sout-mp4-faststart=1

[mux_ogg] # Ogg/OGM muxer

# Index interval (integer)
#sout-ogg-indexintvl=1000

# Index size ratio (float)
#sout-ogg-indexratio=1.000000

[asf] # ASF muxer

# Title (string)
#sout-asf-title=

# Author (string)
#sout-asf-author=

# Copyright (string)
#sout-asf-copyright=

# Comment (string)
#sout-asf-comment=

# Rating (string)
#sout-asf-rating=

# Packet Size (integer)
#sout-asf-packet-size=4096

# Bitrate override (integer)
#sout-asf-bitrate-override=0

[vdpau_chroma] # VDPAU surface conversions

# Deinterlace (integer)
#vdpau-deinterlace=1

# Inverse telecine (boolean)
#vdpau-ivtc=0

# Deinterlace chroma skip (boolean)
#vdpau-chroma-skip=0

# Noise reduction level (float)
#vdpau-noise-reduction=0.000000

# Scaling quality (integer)
#vdpau-scaling=0

[kate] # Kate overlay decoder

# Formatted Subtitles (boolean)
#kate-formatted=1

[svgdec] # SVG video decoder

# Image width (integer)
#svg-width=-1

# Image height (integer)
#svg-height=-1

# Scale factor (float)
#svg-scale=-1.000000

[ddummy] # Dummy decoder

# Save raw codec data (boolean)
#dummy-save-es=0

[subsdec] # Text subtitle decoder

# Subtitle justification (integer)
#subsdec-align=-1

# Subtitle text encoding (string)
#subsdec-encoding=

# UTF-8 subtitle autodetection (boolean)
#subsdec-autodetect-utf8=1

[aribsub] # ARIB subtitles decoder

# Ignore ruby (furigana) (boolean)
#aribsub-ignore-ruby=0

# Use Core Text renderer (boolean)
#aribsub-use-coretext=0

[subsusf] # USF subtitles decoder

# Formatted Subtitles (boolean)
#subsdec-formatted=1

[a52] # ATSC A/52 (AC-3) audio decoder

# A/52 dynamic range compression (boolean)
#a52-dynrng=1

[spudec] # DVD subtitles decoder

# Disable DVD subtitle transparency (boolean)
#dvdsub-transparency=0

[dvbsub] # DVB subtitles decoder

# Subpicture position (integer)
#dvbsub-position=8

# Decoding X coordinate (integer)
#dvbsub-x=-1

# Decoding Y coordinate (integer)
#dvbsub-y=-1

# Encoding X coordinate (integer)
#sout-dvbsub-x=-1

# Encoding Y coordinate (integer)
#sout-dvbsub-y=-1

[x264] # H.264/MPEG-4 Part 10/AVC encoder (x264)

# Maximum GOP size (integer)
#sout-x264-keyint=250

# Minimum GOP size (integer)
#sout-x264-min-keyint=25

# Use recovery points to close GOPs (boolean)
#sout-x264-opengop=0

# Enable compatibility hacks for Blu-ray support (boolean)
#sout-x264-bluray-compat=0

# Extra I-frames aggressivity (integer)
#sout-x264-scenecut=40

# B-frames between I and P (integer)
#sout-x264-bframes=3

# Adaptive B-frame decision (integer)
#sout-x264-b-adapt=1

# Influence (bias) B-frames usage (integer)
#sout-x264-b-bias=0

# Keep some B-frames as references (string)
#sout-x264-bpyramid=normal

# CABAC (boolean)
#sout-x264-cabac=1

# Use fullrange instead of TV colorrange (boolean)
#sout-x264-fullrange=0

# Number of reference frames (integer)
#sout-x264-ref=3

# Skip loop filter (boolean)
#sout-x264-nf=0

# Loop filter AlphaC0 and Beta parameters alpha:beta (string)
#sout-x264-deblock=0:0

# Strength of psychovisual optimization, default is "1.0:0.0" (string)
#sout-x264-psy-rd=1.0:0.0

# Use Psy-optimizations (boolean)
#sout-x264-psy=1

# H.264 level (string)
#sout-x264-level=0

# H.264 profile (string)
#sout-x264-profile=high

# Interlaced mode (boolean)
#sout-x264-interlaced=0

# Frame packing (integer)
#sout-x264-frame-packing=-1

# Force number of slices per frame (integer)
#sout-x264-slices=0

# Limit the size of each slice in bytes (integer)
#sout-x264-slice-max-size=0

# Limit the size of each slice in macroblocks (integer)
#sout-x264-slice-max-mbs=0

# HRD-timing information (string)
#sout-x264-hrd=none

# Set QP (integer)
#sout-x264-qp=-1

# Quality-based VBR (integer)
#sout-x264-crf=23

# Min QP (integer)
#sout-x264-qpmin=10

# Max QP (integer)
#sout-x264-qpmax=51

# Max QP step (integer)
#sout-x264-qpstep=4

# Average bitrate tolerance (float)
#sout-x264-ratetol=1.000000

# Max local bitrate (integer)
#sout-x264-vbv-maxrate=0

# VBV buffer (integer)
#sout-x264-vbv-bufsize=0

# Initial VBV buffer occupancy (float)
#sout-x264-vbv-init=0.900000

# QP factor between I and P (float)
#sout-x264-ipratio=1.400000

# QP factor between P and B (float)
#sout-x264-pbratio=1.300000

# QP difference between chroma and luma (integer)
#sout-x264-chroma-qp-offset=0

# Multipass ratecontrol (integer)
#sout-x264-pass=0

# QP curve compression (float)
#sout-x264-qcomp=0.600000

# Reduce fluctuations in QP (float)
#sout-x264-cplxblur=20.000000

# Reduce fluctuations in QP (float)
#sout-x264-qblur=0.500000

# How AQ distributes bits (integer)
#sout-x264-aq-mode=1

# Strength of AQ (float)
#sout-x264-aq-strength=1.000000

# Partitions to consider (string)
#sout-x264-partitions=normal

# Direct MV prediction mode (string)
#sout-x264-direct=spatial

# Direct prediction size (integer)
#sout-x264-direct-8x8=1

# Weighted prediction for B-frames (boolean)
#sout-x264-weightb=1

# Weighted prediction for P-frames (integer)
#sout-x264-weightp=2

# Integer pixel motion estimation method (string)
#sout-x264-me=hex

# Maximum motion vector search range (integer)
#sout-x264-merange=16

# Maximum motion vector length (integer)
#sout-x264-mvrange=-1

# Minimum buffer space between threads (integer)
#sout-x264-mvrange-thread=-1

# Subpixel motion estimation and partition decision quality (integer)
#sout-x264-subme=7

# Decide references on a per partition basis (boolean)
#sout-x264-mixed-refs=1

# Chroma in motion estimation (boolean)
#sout-x264-chroma-me=1

# Adaptive spatial transform size (boolean)
#sout-x264-8x8dct=1

# Trellis RD quantization (integer)
#sout-x264-trellis=1

# Framecount to use on frametype lookahead (integer)
#sout-x264-lookahead=40

# Use Periodic Intra Refresh (boolean)
#sout-x264-intra-refresh=0

# Use mb-tree ratecontrol (boolean)
#sout-x264-mbtree=1

# Early SKIP detection on P-frames (boolean)
#sout-x264-fast-pskip=1

# Coefficient thresholding on P-frames (boolean)
#sout-x264-dct-decimate=1

# Noise reduction (integer)
#sout-x264-nr=0

# Inter luma quantization deadzone (integer)
#sout-x264-deadzone-inter=21

# Intra luma quantization deadzone (integer)
#sout-x264-deadzone-intra=11

# Non-deterministic optimizations when threaded (boolean)
#sout-x264-non-deterministic=0

# CPU optimizations (boolean)
#sout-x264-asm=1

# PSNR computation (boolean)
#sout-x264-psnr=0

# SSIM computation (boolean)
#sout-x264-ssim=0

# Quiet mode (boolean)
#sout-x264-quiet=0

# SPS and PPS id numbers (integer)
#sout-x264-sps-id=0

# Access unit delimiters (boolean)
#sout-x264-aud=0

# Statistics (boolean)
#sout-x264-verbose=0

# Filename for 2 pass stats file (string)
#sout-x264-stats=x264_2pass.log

# Default preset setting used (string)
#sout-x264-preset=

# Default tune setting used (string)
#sout-x264-tune=

# x264 advanced options (string)
#sout-x264-options=

[ttml] # TTML subtitles decoder

# Subtitle justification (integer)
#ttml-align=0

[vorbis] # Vorbis audio decoder

# Encoding quality (integer)
#sout-vorbis-quality=0

# Maximum encoding bitrate (integer)
#sout-vorbis-max-bitrate=0

# Minimum encoding bitrate (integer)
#sout-vorbis-min-bitrate=0

# CBR encoding (boolean)
#sout-vorbis-cbr=0

[avcodec] # FFmpeg audio/video decoder

# Direct rendering (boolean)
#avcodec-dr=1

# Show corrupted frames (boolean)
#avcodec-corrupted=1

# Error resilience (integer)
#avcodec-error-resilience=1

# Workaround bugs (integer)
#avcodec-workaround-bugs=1

# Hurry up (boolean)
#avcodec-hurry-up=1

# Skip frame (default=0) (integer)
#avcodec-skip-frame=0

# Skip idct (default=0) (integer)
#avcodec-skip-idct=0

# Allow speed tricks (boolean)
#avcodec-fast=0

# Skip the loop filter for H.264 decoding (integer)
#avcodec-skiploopfilter=0

# Debug mask (integer)
#avcodec-debug=0

# Codec name (string)
#avcodec-codec=

# Hardware decoding (string)
#avcodec-hw=any

# Threads (integer)
#avcodec-threads=0

# Advanced options (string)
#avcodec-options=

# Codec name (string)
#sout-avcodec-codec=

# Quality level (string)
#sout-avcodec-hq=rd

# Ratio of key frames (integer)
#sout-avcodec-keyint=0

# Ratio of B frames (integer)
#sout-avcodec-bframes=0

# Hurry up (boolean)
#sout-avcodec-hurry-up=0

# Interlaced encoding (boolean)
#sout-avcodec-interlace=0

# Interlaced motion estimation (boolean)
#sout-avcodec-interlace-me=1

# Video bitrate tolerance (integer)
#sout-avcodec-vt=0

# Pre-motion estimation (boolean)
#sout-avcodec-pre-me=0

# Rate control buffer size (integer)
#sout-avcodec-rc-buffer-size=0

# Rate control buffer aggressiveness (float)
#sout-avcodec-rc-buffer-aggressivity=1.000000

# I quantization factor (float)
#sout-avcodec-i-quant-factor=0.000000

# Noise reduction (integer)
#sout-avcodec-noise-reduction=0

# MPEG4 quantization matrix (boolean)
#sout-avcodec-mpeg4-matrix=0

# Minimum video quantizer scale (integer)
#sout-avcodec-qmin=0

# Maximum video quantizer scale (integer)
#sout-avcodec-qmax=0

# Trellis quantization (boolean)
#sout-avcodec-trellis=0

# Fixed quantizer scale (float)
#sout-avcodec-qscale=3.000000

# Strict standard compliance (integer)
#sout-avcodec-strict=0

# Luminance masking (float)
#sout-avcodec-lumi-masking=0.000000

# Darkness masking (float)
#sout-avcodec-dark-masking=0.000000

# Motion masking (float)
#sout-avcodec-p-masking=0.000000

# Border masking (float)
#sout-avcodec-border-masking=0.000000

# Luminance elimination (integer)
#sout-avcodec-luma-elim-threshold=0

# Chrominance elimination (integer)
#sout-avcodec-chroma-elim-threshold=0

# Specify AAC audio profile to use (string)
#sout-avcodec-aac-profile=low

# Advanced options (string)
#sout-avcodec-options=

[x26410b] # H.264/MPEG-4 Part 10/AVC encoder (x264 10-bit)

# Maximum GOP size (integer)
#sout-x26410b-keyint=250

# Minimum GOP size (integer)
#sout-x26410b-min-keyint=25

# Use recovery points to close GOPs (boolean)
#sout-x26410b-opengop=0

# Enable compatibility hacks for Blu-ray support (boolean)
#sout-x26410b-bluray-compat=0

# Extra I-frames aggressivity (integer)
#sout-x26410b-scenecut=40

# B-frames between I and P (integer)
#sout-x26410b-bframes=3

# Adaptive B-frame decision (integer)
#sout-x26410b-b-adapt=1

# Influence (bias) B-frames usage (integer)
#sout-x26410b-b-bias=0

# Keep some B-frames as references (string)
#sout-x26410b-bpyramid=normal

# CABAC (boolean)
#sout-x26410b-cabac=1

# Use fullrange instead of TV colorrange (boolean)
#sout-x26410b-fullrange=0

# Number of reference frames (integer)
#sout-x26410b-ref=3

# Skip loop filter (boolean)
#sout-x26410b-nf=0

# Loop filter AlphaC0 and Beta parameters alpha:beta (string)
#sout-x26410b-deblock=0:0

# Strength of psychovisual optimization, default is "1.0:0.0" (string)
#sout-x26410b-psy-rd=1.0:0.0

# Use Psy-optimizations (boolean)
#sout-x26410b-psy=1

# H.264 level (string)
#sout-x26410b-level=0

# H.264 profile (string)
#sout-x26410b-profile=high

# Interlaced mode (boolean)
#sout-x26410b-interlaced=0

# Frame packing (integer)
#sout-x26410b-frame-packing=-1

# Force number of slices per frame (integer)
#sout-x26410b-slices=0

# Limit the size of each slice in bytes (integer)
#sout-x26410b-slice-max-size=0

# Limit the size of each slice in macroblocks (integer)
#sout-x26410b-slice-max-mbs=0

# HRD-timing information (string)
#sout-x26410b-hrd=none

# Set QP (integer)
#sout-x26410b-qp=-1

# Quality-based VBR (integer)
#sout-x26410b-crf=23

# Min QP (integer)
#sout-x26410b-qpmin=10

# Max QP (integer)
#sout-x26410b-qpmax=51

# Max QP step (integer)
#sout-x26410b-qpstep=4

# Average bitrate tolerance (float)
#sout-x26410b-ratetol=1.000000

# Max local bitrate (integer)
#sout-x26410b-vbv-maxrate=0

# VBV buffer (integer)
#sout-x26410b-vbv-bufsize=0

# Initial VBV buffer occupancy (float)
#sout-x26410b-vbv-init=0.900000

# QP factor between I and P (float)
#sout-x26410b-ipratio=1.400000

# QP factor between P and B (float)
#sout-x26410b-pbratio=1.300000

# QP difference between chroma and luma (integer)
#sout-x26410b-chroma-qp-offset=0

# Multipass ratecontrol (integer)
#sout-x26410b-pass=0

# QP curve compression (float)
#sout-x26410b-qcomp=0.600000

# Reduce fluctuations in QP (float)
#sout-x26410b-cplxblur=20.000000

# Reduce fluctuations in QP (float)
#sout-x26410b-qblur=0.500000

# How AQ distributes bits (integer)
#sout-x26410b-aq-mode=1

# Strength of AQ (float)
#sout-x26410b-aq-strength=1.000000

# Partitions to consider (string)
#sout-x26410b-partitions=normal

# Direct MV prediction mode (string)
#sout-x26410b-direct=spatial

# Direct prediction size (integer)
#sout-x26410b-direct-8x8=1

# Weighted prediction for B-frames (boolean)
#sout-x26410b-weightb=1

# Weighted prediction for P-frames (integer)
#sout-x26410b-weightp=2

# Integer pixel motion estimation method (string)
#sout-x26410b-me=hex

# Maximum motion vector search range (integer)
#sout-x26410b-merange=16

# Maximum motion vector length (integer)
#sout-x26410b-mvrange=-1

# Minimum buffer space between threads (integer)
#sout-x26410b-mvrange-thread=-1

# Subpixel motion estimation and partition decision quality (integer)
#sout-x26410b-subme=7

# Decide references on a per partition basis (boolean)
#sout-x26410b-mixed-refs=1

# Chroma in motion estimation (boolean)
#sout-x26410b-chroma-me=1

# Adaptive spatial transform size (boolean)
#sout-x26410b-8x8dct=1

# Trellis RD quantization (integer)
#sout-x26410b-trellis=1

# Framecount to use on frametype lookahead (integer)
#sout-x26410b-lookahead=40

# Use Periodic Intra Refresh (boolean)
#sout-x26410b-intra-refresh=0

# Use mb-tree ratecontrol (boolean)
#sout-x26410b-mbtree=1

# Early SKIP detection on P-frames (boolean)
#sout-x26410b-fast-pskip=1

# Coefficient thresholding on P-frames (boolean)
#sout-x26410b-dct-decimate=1

# Noise reduction (integer)
#sout-x26410b-nr=0

# Inter luma quantization deadzone (integer)
#sout-x26410b-deadzone-inter=21

# Intra luma quantization deadzone (integer)
#sout-x26410b-deadzone-intra=11

# Non-deterministic optimizations when threaded (boolean)
#sout-x26410b-non-deterministic=0

# CPU optimizations (boolean)
#sout-x26410b-asm=1

# PSNR computation (boolean)
#sout-x26410b-psnr=0

# SSIM computation (boolean)
#sout-x26410b-ssim=0

# Quiet mode (boolean)
#sout-x26410b-quiet=0

# SPS and PPS id numbers (integer)
#sout-x26410b-sps-id=0

# Access unit delimiters (boolean)
#sout-x26410b-aud=0

# Statistics (boolean)
#sout-x26410b-verbose=0

# Filename for 2 pass stats file (string)
#sout-x26410b-stats=x264_2pass.log

# Default preset setting used (string)
#sout-x26410b-preset=

# Default tune setting used (string)
#sout-x26410b-tune=

# x264 advanced options (string)
#sout-x26410b-options=

[jpeg] # JPEG image decoder

# Quality level (integer)
#sout-jpeg-quality=95

[dca] # DTS Coherent Acoustics audio decoder

# DTS dynamic range compression (boolean)
#dts-dynrng=1

[speex] # Speex audio decoder

# Mode (integer)
#sout-speex-mode=0

# Encoding complexity (integer)
#sout-speex-complexity=3

# CBR encoding (boolean)
#sout-speex-cbr=0

# Encoding quality (float)
#sout-speex-quality=8.000000

# Maximal bitrate (integer)
#sout-speex-max-bitrate=0

# Voice activity detection (boolean)
#sout-speex-vad=1

# Discontinuous Transmission (boolean)
#sout-speex-dtx=0

[svcdsub] # Philips OGT (SVCD subtitle) decoder

[theora] # Theora video decoder

# Post processing quality (integer)
#theora-postproc=-1

# Encoding quality (integer)
#sout-theora-quality=2

[cc] # Closed Captions decoder

# Opacity (boolean)
#cc-opaque=1

[zvbi] # VBI and Teletext decoder

# Teletext page (integer)
#vbi-page=100

# Opacity (boolean)
#vbi-opaque=0

# Teletext alignment (integer)
#vbi-position=8

# Teletext text subtitles (boolean)
#vbi-text=0

# Presentation Level (integer)
#vbi-level=3

[twolame] # Libtwolame audio encoder

# Encoding quality (float)
#sout-twolame-quality=0.000000

# Stereo mode (integer)
#sout-twolame-mode=0

# VBR mode (boolean)
#sout-twolame-vbr=0

# Psycho-acoustic model (integer)
#sout-twolame-psy=3

[swscale] # Video scaling filter

# Scaling mode (integer)
#swscale-mode=2

[prefetch] # Stream prefetch filter

# Buffer size (integer)
#prefetch-buffer-size=16384

# Read size (integer)
#prefetch-read-size=16777216

# Seek threshold (integer)
#prefetch-seek-threshold=16384

[visual] # Visualizer filter

# Effects list (string)
#effect-list=spectrum

# Video width (integer)
#effect-width=800

# Video height (integer)
#effect-height=500

# FFT window (string)
#effect-fft-window=flat

# Kaiser window parameter (float)
#effect-kaiser-param=3.000000

# Show 80 bands instead of 20 (boolean)
#visual-80-bands=1

# Draw peaks in the analyzer (boolean)
#visual-peaks=1

# Enable original graphic spectrum (boolean)
#spect-show-original=0

# Draw the base of the bands (boolean)
#spect-show-base=1

# Base pixel radius (integer)
#spect-radius=42

# Spectral sections (integer)
#spect-sections=3

# V-plane color (integer)
#spect-color=80

# Draw bands in the spectrometer (boolean)
#spect-show-bands=1

# Show 80 bands instead of 20 (boolean)
#spect-80-bands=1

# Number of blank pixels between bands. (integer)
#spect-separ=1

# Amplification (integer)
#spect-amp=8

# Draw peaks in the analyzer (boolean)
#spect-show-peaks=1

# Peak extra width (integer)
#spect-peak-width=61

# Peak height (integer)
#spect-peak-height=1

[glspectrum] # 3D OpenGL spectrum visualization

# Video width (integer)
#glspectrum-width=400

# Video height (integer)
#glspectrum-height=300

[mpegvideo] # MPEG-I/II video packetizer

# Sync on Intra Frame (boolean)
#packetizer-mpegvideo-sync-iframe=0

[subtitle] # Text subtitle parser

# Frames per Second (float)
#sub-fps=0.000000

# Subtitle delay (integer)
#sub-delay=0

# Subtitle format (string)
#sub-type=auto

# Subtitle description (string)
#sub-description=

[rawaud] # Raw audio demuxer

# Audio channels (integer)
#rawaud-channels=2

# Audio samplerate (Hz) (integer)
#rawaud-samplerate=48000

# FOURCC code of raw input format (string)
#rawaud-fourcc=s16l

# Forces the audio language (string)
#rawaud-lang=eng

[avformat] # Avformat demuxer

# Format name (string)
#avformat-format=

# Advanced options (string)
#avformat-options=

# Avformat mux (string)
#sout-avformat-mux=

# Advanced options (string)
#sout-avformat-options=

# Reset timestamps (boolean)
#sout-avformat-reset-ts=0

[diracsys] # Dirac video demuxer

# Value to adjust dts by (integer)
#dirac-dts-offset=0

[es] # MPEG-I/II/4 / A52 / DTS / MLP audio

# Frames per Second (float)
#es-fps=25.000000

[avi] # AVI demuxer

# Force interleaved method (boolean)
#avi-interleaved=0

# Force index creation (integer)
#avi-index=0

[adaptive] # Unified adaptive streaming for DASH/HLS

# Adaptive Logic (string)
#adaptive-logic=

# Maximum device width (integer)
#adaptive-maxwidth=0

# Maximum device height (integer)
#adaptive-maxheight=0

# Fixed Bandwidth in KiB/s (integer)
#adaptive-bw=250

# Use regular HTTP modules (boolean)
#adaptive-use-access=0

# Live Playback delay (ms) (integer)
#adaptive-livedelay=15000

# Max buffering (ms) (integer)
#adaptive-maxbuffer=30000

# Low latency (integer)
#adaptive-lowlatency=-1

[mjpeg] # M-JPEG camera demuxer

# Frames per Second (float)
#mjpeg-fps=0.000000

[mp4] # MP4 stream demuxer

# M4A audio only (boolean)
#mp4-m4a-audioonly=0

[mod] # MOD demuxer (libmodplug)

# Noise reduction (boolean)
#mod-noisereduction=1

# Reverb (boolean)
#mod-reverb=0

# Reverberation level (integer)
#mod-reverb-level=0

# Reverberation delay (integer)
#mod-reverb-delay=40

# Mega bass (boolean)
#mod-megabass=0

# Mega bass level (integer)
#mod-megabass-level=0

# Mega bass cutoff (integer)
#mod-megabass-range=10

# Surround (boolean)
#mod-surround=0

# Surround level (integer)
#mod-surround-level=0

# Surround delay (ms) (integer)
#mod-surround-delay=5

[image] # Image demuxer

# ES ID (integer)
#image-id=-1

# Group (integer)
#image-group=0

# Decode (boolean)
#image-decode=1

# Forced chroma (string)
#image-chroma=

# Duration in seconds (float)
#image-duration=10.000000

# Frame rate (string)
#image-fps=10/1

# Real-time (boolean)
#image-realtime=0

[rawdv] # DV (Digital Video) demuxer

# Hurry up (boolean)
#rawdv-hurry-up=0

[demuxdump] # File dumper

# Dump module (string)
#demuxdump-access=file

# Dump filename (string)
#demuxdump-file=stream-demux.dump

# Append to existing file (boolean)
#demuxdump-append=0

[playlist] # Playlist

# Skip ads (boolean)
#playlist-skip-ads=1

# Show shoutcast adult content (boolean)
#shoutcast-show-adult=0

[ts] # MPEG Transport Stream demuxer

# Digital TV Standard (string)
#ts-standard=auto

# Extra PMT (string)
#ts-extra-pmt=

# Trust in-stream PCR (boolean)
#ts-trust-pcr=1

# Set id of ES to PID (boolean)
#ts-es-id-pid=1

# CSA Key (string)
#ts-csa-ck=

# Second CSA Key (string)
#ts-csa2-ck=

# Packet size in bytes to decrypt (integer)
#ts-csa-pkt=188

# Separate sub-streams (boolean)
#ts-split-es=1

# Seek based on percent not time (boolean)
#ts-seek-percent=0

# Check packets continuity counter (boolean)
#ts-cc-check=1

# Only create ES on program sending data (boolean)
#ts-pmtfix-waitdata=1

# Try to generate PAT/PMT if missing (boolean)
#ts-patfix=1

# Try to fix too early PCR (or late DTS) (boolean)
#ts-pcr-offsetfix=1

[rawvid] # Raw video demuxer

# Frames per Second (string)
#rawvid-fps=

# Width (integer)
#rawvid-width=0

# Height (integer)
#rawvid-height=0

# Force chroma (Use carefully) (string)
#rawvid-chroma=

# Aspect ratio (string)
#rawvid-aspect-ratio=

[vc1] # VC1 video demuxer

# Frames per Second (float)
#vc1-fps=25.000000

[ps] # MPEG-PS demuxer

# Trust MPEG timestamps (boolean)
#ps-trust-timestamps=1

[h26x] # H264 video demuxer

# Frames per Second (float)
#h264-fps=0.000000

# Frames per Second (float)
#hevc-fps=0.000000

[mkv] # Matroska stream demuxer

# Respect ordered chapters (boolean)
#mkv-use-ordered-chapters=1

# Chapter codecs (boolean)
#mkv-use-chapter-codec=1

# Preload MKV files in the same directory (boolean)
#mkv-preload-local-dir=1

# Seek based on percent not time (boolean)
#mkv-seek-percent=0

# Dummy Elements (boolean)
#mkv-use-dummy=0

# Preload clusters (boolean)
#mkv-preload-clusters=0

[core] # core program

# Enable audio (boolean)
#audio=1

# Audio gain (float)
#gain=1.000000

# Audio output volume step (float)
#volume-step=12.800000

# Remember the audio volume (boolean)
volume-save=0

# Force S/PDIF support (boolean)
#spdif=0

# Force detection of Dolby Surround (integer)
#force-dolby-surround=0

# Stereo audio output mode (integer)
#stereo-mode=0

# Audio desynchronization compensation (integer)
#audio-desync=0

# Replay gain mode (string)
#audio-replay-gain-mode=none

# Replay preamp (float)
#audio-replay-gain-preamp=0.000000

# Default replay gain (float)
#audio-replay-gain-default=-7.000000

# Peak protection (boolean)
#audio-replay-gain-peak-protection=1

# Enable time stretching audio (boolean)
#audio-time-stretch=1

# Audio output module (string)
aout=pulse

# Media role (string)
role=production

# Audio filters (string)
#audio-filter=

# Audio visualizations (string)
#audio-visual=none

# Audio resampler (string)
audio-resampler=none

# Enable video (boolean)
#video=1

# Grayscale video output (boolean)
#grayscale=0

# Fullscreen video output (boolean)
#fullscreen=0

# Embedded video (boolean)
#embedded-video=1

#  (boolean)
#xlib=1

# Drop late frames (boolean)
#drop-late-frames=1

# Skip frames (boolean)
#skip-frames=1

# Quiet synchro (boolean)
quiet-synchro=1

# Key press events (boolean)
#keyboard-events=1

# Mouse events (boolean)
#mouse-events=1

# Always on top (boolean)
#video-on-top=0

# Enable wallpaper mode (boolean)
#video-wallpaper=0

# Disable screensaver (boolean)
#disable-screensaver=1

# Show media title on video (boolean)
#video-title-show=1

# Show video title for x milliseconds (integer)
#video-title-timeout=5000

# Position of video title (integer)
#video-title-position=8

# Hide cursor and fullscreen controller after x milliseconds (integer)
#mouse-hide-timeout=1000

# Video snapshot directory (or filename) (string)
#snapshot-path=

# Video snapshot file prefix (string)
#snapshot-prefix=vlcsnap-

# Video snapshot format (string)
#snapshot-format=png

# Display video snapshot preview (boolean)
#snapshot-preview=1

# Use sequential numbers instead of timestamps (boolean)
#snapshot-sequential=0

# Video snapshot width (integer)
#snapshot-width=-1

# Video snapshot height (integer)
#snapshot-height=-1

# Video width (integer)
#width=-1

# Video height (integer)
#height=-1

# Video X coordinate (integer)
#video-x=0

# Video Y coordinate (integer)
#video-y=0

# Video cropping (string)
#crop=

# Custom crop ratios list (string)
#custom-crop-ratios=

# Source aspect ratio (string)
#aspect-ratio=

# Video Auto Scaling (boolean)
#autoscale=1

# Monitor pixel aspect ratio (string)
#monitor-par=

# Custom aspect ratios list (string)
#custom-aspect-ratios=

# Fix HDTV height (boolean)
#hdtv-fix=1

# Window decorations (boolean)
#video-deco=1

# Video title (string)
#video-title=

# Video alignment (integer)
#align=0

# Zoom video (float)
zoom=0.500000

# Deinterlace (integer)
#deinterlace=-1

# Deinterlace mode (string)
#deinterlace-mode=auto

# Video output module (string)
#vout=

# Video filter module (string)
#video-filter=

# Video splitter module (string)
#video-splitter=

# Enable sub-pictures (boolean)
#spu=1

# On Screen Display (boolean)
#osd=1

# Text rendering module (string)
#text-renderer=

# Use subtitle file (string)
#sub-file=

# Autodetect subtitle files (boolean)
#sub-autodetect-file=1

# Subtitle autodetection fuzziness (integer)
#sub-autodetect-fuzzy=3

# Subtitle autodetection paths (string)
#sub-autodetect-path=./Subtitles, ./subtitles, ./Subs, ./subs

# Force subtitle position (integer)
#sub-margin=0

# Subpictures source module (string)
#sub-source=

# Subpictures filter module (string)
#sub-filter=

# Program (integer)
#program=0

# Programs (string)
#programs=

# Audio track (integer)
#audio-track=-1

# Subtitle track (integer)
#sub-track=-1

# Audio language (string)
#audio-language=

# Subtitle language (string)
#sub-language=

# Menu language (string)
#menu-language=

# Audio track ID (integer)
#audio-track-id=-1

# Subtitle track ID (integer)
#sub-track-id=-1

# Preferred Closed Captions decoder (integer)
#captions=608

# Preferred video resolution (integer)
#preferred-resolution=-1

# Input repetitions (integer)
#input-repeat=0

# Start time (float)
#start-time=0.000000

# Stop time (float)
#stop-time=0.000000

# Run time (float)
#run-time=0.000000

# Fast seek (boolean)
#input-fast-seek=0

# Playback speed (float)
#rate=1.000000

# Input list (string)
#input-list=

# Input slave (experimental) (string)
#input-slave=

# Bookmarks list for a stream (string)
#bookmarks=

# DVD device (string)
#dvd=/dev/sr0

# VCD device (string)
#vcd=/dev/sr0

# MTU of the network interface (integer)
#mtu=1400

# TCP connection timeout (integer)
#ipv4-timeout=5000

# HTTP server address (string)
#http-host=

# HTTP server port (integer)
#http-port=8080

# HTTPS server port (integer)
#https-port=8443

# RTSP server address (string)
#rtsp-host=

# RTSP server port (integer)
#rtsp-port=554

# HTTP/TLS server certificate (string)
#http-cert=

# HTTP/TLS server private key (string)
#http-key=

# SOCKS server (string)
#socks=

# SOCKS user name (string)
#socks-user=

# SOCKS password (string)
#socks-pwd=

# Title metadata (string)
#meta-title=

# Author metadata (string)
#meta-author=

# Artist metadata (string)
#meta-artist=

# Genre metadata (string)
#meta-genre=

# Copyright metadata (string)
#meta-copyright=

# Description metadata (string)
#meta-description=

# Date metadata (string)
#meta-date=

# URL metadata (string)
#meta-url=

# File caching (ms) (integer)
#file-caching=1000

# Live capture caching (ms) (integer)
#live-caching=300

# Disc caching (ms) (integer)
#disc-caching=300

# Network caching (ms) (integer)
#network-caching=1000

# Clock reference average counter (integer)
#cr-average=40

# Clock synchronisation (integer)
#clock-synchro=-1

# Clock jitter (integer)
#clock-jitter=5000

# Network synchronisation (boolean)
#network-synchronisation=0

# Record directory (string)
#input-record-path=

# Prefer native stream recording (boolean)
#input-record-native=1

# Timeshift directory (string)
#input-timeshift-path=

# Timeshift granularity (integer)
#input-timeshift-granularity=-1

# Change title according to current media (string)
#input-title-format=$Z

# Disable all lua plugins (boolean)
#lua=1

# Preferred decoders list (string)
#codec=

# Preferred encoders list (string)
#encoder=

# Access module (string)
access=any

# Demux module (string)
#demux=any

# Stream filter module (string)
#stream-filter=

# Demux filter module (string)
#demux-filter=

# Default stream output chain (string)
#sout=

# Display while streaming (boolean)
#sout-display=0

# Keep stream output open (boolean)
#sout-keep=0

# Enable streaming of all ES (boolean)
#sout-all=1

# Enable audio stream output (boolean)
#sout-audio=1

# Enable video stream output (boolean)
#sout-video=1

# Enable SPU stream output (boolean)
#sout-spu=1

# Stream output muxer caching (ms) (integer)
#sout-mux-caching=1500

# VLM configuration file (string)
#vlm-conf=

# SAP announcement interval (integer)
#sap-interval=5

# Mux module (string)
#mux=

# Access output module (string)
access_output=any

# Hop limit (TTL) (integer)
#ttl=-1

# Multicast output interface (string)
#miface=

# DiffServ Code Point (integer)
#dscp=0

# Preferred packetizer list (string)
#packetizer=

# VoD server module (string)
vod-server=any

# Use a plugins cache (boolean)
#plugins-cache=1

# Scan for new plugins (boolean)
plugins-scan=0

# Preferred keystore list (string)
#keystore=

# Allow real-time priority (boolean)
rt-priority=1

# Adjust VLC priority (integer)
#rt-offset=0

# Play files randomly forever (boolean)
#random=0

# Repeat all (boolean)
#loop=0

# Repeat current item (boolean)
#repeat=0

# Play and exit (boolean)
play-and-exit=1

# Play and stop (boolean)
#play-and-stop=0

# Play and pause (boolean)
#play-and-pause=0

# Start paused (boolean)
#start-paused=0

# Auto start (boolean)
#playlist-autostart=1

# Pause on audio communication (boolean)
playlist-cork=0

# Allow only one running instance (boolean)
one-instance=1

# Use only one instance when started from file manager (boolean)
#one-instance-when-started-from-file=1

# Enqueue items into playlist in one instance mode (boolean)
#playlist-enqueue=0

# Expose media player via D-Bus (boolean)
#dbus=0

# Use media library (boolean)
#media-library=0

# Display playlist tree (boolean)
playlist-tree=1

# Default stream (string)
#open=

# Automatically preparse items (boolean)
#auto-preparse=1

# Preparsing timeout (integer)
#preparse-timeout=5000

# Allow metadata network access (boolean)
metadata-network-access=1

# Subdirectory behavior (string)
#recursive=collapse

# Ignored extensions (string)
#ignore-filetypes=m3u,db,nfo,ini,jpg,jpeg,ljpg,gif,png,pgm,pgmyuv,pbm,pam,tga,bmp,pnm,xpm,xcf,pcx,tif,tiff,lbm,sfv,txt,sub,idx,srt,cue,ssa

# Show hidden files (boolean)
#show-hiddenfiles=0

# Services discovery modules (string)
#services-discovery=

# Run as daemon process (boolean)
#daemon=0

# Write process id to file (string)
#pidfile=

# Show advanced options (boolean)
#advanced=0

# Interface interaction (boolean)
#interact=1

# Locally collect statistics (boolean)
#stats=1

# Interface module (string)
#intf=

# Extra interface modules (string)
#extraintf=

# Control interfaces (string)
#control=

# Mouse wheel vertical axis control (integer)
#hotkeys-y-wheel-mode=0

# Mouse wheel horizontal axis control (integer)
#hotkeys-x-wheel-mode=2

# Fullscreen (string)
#global-key-toggle-fullscreen=

# Fullscreen (string)
#key-toggle-fullscreen=f

# Exit fullscreen (string)
#global-key-leave-fullscreen=

# Exit fullscreen (string)
#key-leave-fullscreen=Esc

# Play/Pause (string)
#global-key-play-pause=

# Play/Pause (string)
#key-play-pause=Space	Media Play Pause

# Pause only (string)
#global-key-pause=

# Pause only (string)
#key-pause=Browser Stop

# Play only (string)
#global-key-play=

# Play only (string)
#key-play=Browser Refresh

# Faster (string)
#global-key-faster=

# Faster (string)
#key-faster=+

# Slower (string)
#global-key-slower=

# Slower (string)
#key-slower=-

# Normal rate (string)
#global-key-rate-normal=

# Normal rate (string)
#key-rate-normal==

# Faster (fine) (string)
#global-key-rate-faster-fine=

# Faster (fine) (string)
#key-rate-faster-fine=]

# Slower (fine) (string)
#global-key-rate-slower-fine=

# Slower (fine) (string)
#key-rate-slower-fine=[

# Next (string)
#global-key-next=

# Next (string)
#key-next=n	Media Next Track

# Previous (string)
#global-key-prev=

# Previous (string)
#key-prev=p	Media Prev Track

# Stop (string)
#global-key-stop=

# Stop (string)
#key-stop=s	Media Stop

# Position (string)
#global-key-position=

# Position (string)
#key-position=t

# Very short backwards jump (string)
#global-key-jump-extrashort=

# Very short backwards jump (string)
#key-jump-extrashort=Shift+Left

# Very short forward jump (string)
#global-key-jump+extrashort=

# Very short forward jump (string)
#key-jump+extrashort=Shift+Right

# Short backwards jump (string)
#global-key-jump-short=

# Short backwards jump (string)
#key-jump-short=Alt+Left

# Short forward jump (string)
#global-key-jump+short=

# Short forward jump (string)
#key-jump+short=Alt+Right

# Medium backwards jump (string)
#global-key-jump-medium=

# Medium backwards jump (string)
#key-jump-medium=Ctrl+Left

# Medium forward jump (string)
#global-key-jump+medium=

# Medium forward jump (string)
#key-jump+medium=Ctrl+Right

# Long backwards jump (string)
#global-key-jump-long=

# Long backwards jump (string)
#key-jump-long=Ctrl+Alt+Left

# Long forward jump (string)
#global-key-jump+long=

# Long forward jump (string)
#key-jump+long=Ctrl+Alt+Right

# Next frame (string)
#global-key-frame-next=

# Next frame (string)
#key-frame-next=e	Browser Next

# Activate (string)
#global-key-nav-activate=

# Activate (string)
#key-nav-activate=Enter

# Navigate up (string)
#global-key-nav-up=

# Navigate up (string)
#key-nav-up=Up

# Navigate down (string)
#global-key-nav-down=

# Navigate down (string)
#key-nav-down=Down

# Navigate left (string)
#global-key-nav-left=

# Navigate left (string)
#key-nav-left=Left

# Navigate right (string)
#global-key-nav-right=

# Navigate right (string)
#key-nav-right=Right

# Go to the DVD menu (string)
#global-key-disc-menu=

# Go to the DVD menu (string)
#key-disc-menu=Shift+m

# Select previous DVD title (string)
#global-key-title-prev=

# Select previous DVD title (string)
#key-title-prev=Shift+o

# Select next DVD title (string)
#global-key-title-next=

# Select next DVD title (string)
#key-title-next=Shift+b

# Select prev DVD chapter (string)
#global-key-chapter-prev=

# Select prev DVD chapter (string)
#key-chapter-prev=Shift+p

# Select next DVD chapter (string)
#global-key-chapter-next=

# Select next DVD chapter (string)
#key-chapter-next=Shift+n

# Quit (string)
#global-key-quit=

# Quit (string)
#key-quit=Ctrl+q

# Volume up (string)
#global-key-vol-up=

# Volume up (string)
#key-vol-up=Ctrl+Up	Volume Up

# Volume down (string)
#global-key-vol-down=

# Volume down (string)
#key-vol-down=Ctrl+Down	Volume Down

# Mute (string)
#global-key-vol-mute=

# Mute (string)
#key-vol-mute=m	Volume Mute

# Subtitle delay up (string)
#global-key-subdelay-up=

# Subtitle delay up (string)
#key-subdelay-up=h

# Subtitle delay down (string)
#global-key-subdelay-down=

# Subtitle delay down (string)
#key-subdelay-down=g

# Subtitle sync / bookmark audio timestamp (string)
#global-key-subsync-markaudio=

# Subtitle sync / bookmark audio timestamp (string)
#key-subsync-markaudio=Shift+h

# Subtitle sync / bookmark subtitle timestamp (string)
#global-key-subsync-marksub=

# Subtitle sync / bookmark subtitle timestamp (string)
#key-subsync-marksub=Shift+j

# Subtitle sync / synchronize audio & subtitle timestamps (string)
#global-key-subsync-apply=

# Subtitle sync / synchronize audio & subtitle timestamps (string)
#key-subsync-apply=Shift+k

# Subtitle sync / reset audio & subtitle synchronization (string)
#global-key-subsync-reset=

# Subtitle sync / reset audio & subtitle synchronization (string)
#key-subsync-reset=Ctrl+Shift+k

# Subtitle position up (string)
#global-key-subpos-up=

# Subtitle position up (string)
#key-subpos-up=

# Subtitle position down (string)
#global-key-subpos-down=

# Subtitle position down (string)
#key-subpos-down=

# Audio delay up (string)
#global-key-audiodelay-up=

# Audio delay up (string)
#key-audiodelay-up=k

# Audio delay down (string)
#global-key-audiodelay-down=

# Audio delay down (string)
#key-audiodelay-down=j

# Cycle audio track (string)
#global-key-audio-track=

# Cycle audio track (string)
#key-audio-track=b

# Cycle through audio devices (string)
#global-key-audiodevice-cycle=

# Cycle through audio devices (string)
#key-audiodevice-cycle=Shift+a

# Cycle subtitle track in reverse order (string)
#global-key-subtitle-revtrack=

# Cycle subtitle track in reverse order (string)
#key-subtitle-revtrack=Alt+v

# Cycle subtitle track (string)
#global-key-subtitle-track=

# Cycle subtitle track (string)
#key-subtitle-track=v

# Toggle subtitles (string)
#global-key-subtitle-toggle=

# Toggle subtitles (string)
#key-subtitle-toggle=Shift+v

# Cycle next program Service ID (string)
#global-key-program-sid-next=

# Cycle next program Service ID (string)
#key-program-sid-next=x

# Cycle previous program Service ID (string)
#global-key-program-sid-prev=

# Cycle previous program Service ID (string)
#key-program-sid-prev=Shift+x

# Cycle source aspect ratio (string)
#global-key-aspect-ratio=

# Cycle source aspect ratio (string)
#key-aspect-ratio=a

# Cycle video crop (string)
#global-key-crop=

# Cycle video crop (string)
#key-crop=c

# Toggle autoscaling (string)
#global-key-toggle-autoscale=

# Toggle autoscaling (string)
#key-toggle-autoscale=o

# Increase scale factor (string)
#global-key-incr-scalefactor=

# Increase scale factor (string)
#key-incr-scalefactor=Alt+o

# Decrease scale factor (string)
#global-key-decr-scalefactor=

# Decrease scale factor (string)
#key-decr-scalefactor=Alt+Shift+o

# Toggle deinterlacing (string)
#global-key-deinterlace=

# Toggle deinterlacing (string)
#key-deinterlace=d

# Cycle deinterlace modes (string)
#global-key-deinterlace-mode=

# Cycle deinterlace modes (string)
#key-deinterlace-mode=Shift+d

# Show controller in fullscreen (string)
#global-key-intf-show=

# Show controller in fullscreen (string)
#key-intf-show=i

# Boss key (string)
#global-key-intf-boss=

# Boss key (string)
#key-intf-boss=

# Context menu (string)
#global-key-intf-popup-menu=

# Context menu (string)
#key-intf-popup-menu=Menu

# Take video snapshot (string)
#global-key-snapshot=

# Take video snapshot (string)
#key-snapshot=Shift+s

# Record (string)
#global-key-record=

# Record (string)
#key-record=Shift+r

# Zoom (string)
#global-key-zoom=

# Zoom (string)
#key-zoom=z

# Un-Zoom (string)
#global-key-unzoom=

# Un-Zoom (string)
#key-unzoom=Shift+z

# Toggle wallpaper mode in video output (string)
#global-key-wallpaper=

# Toggle wallpaper mode in video output (string)
#key-wallpaper=w

# Crop one pixel from the top of the video (string)
#global-key-crop-top=

# Crop one pixel from the top of the video (string)
#key-crop-top=Alt+r

# Uncrop one pixel from the top of the video (string)
#global-key-uncrop-top=

# Uncrop one pixel from the top of the video (string)
#key-uncrop-top=Alt+Shift+r

# Crop one pixel from the left of the video (string)
#global-key-crop-left=

# Crop one pixel from the left of the video (string)
#key-crop-left=Alt+d

# Uncrop one pixel from the left of the video (string)
#global-key-uncrop-left=

# Uncrop one pixel from the left of the video (string)
#key-uncrop-left=Alt+Shift+d

# Crop one pixel from the bottom of the video (string)
#global-key-crop-bottom=

# Crop one pixel from the bottom of the video (string)
#key-crop-bottom=Alt+c

# Uncrop one pixel from the bottom of the video (string)
#global-key-uncrop-bottom=

# Uncrop one pixel from the bottom of the video (string)
#key-uncrop-bottom=Alt+Shift+c

# Crop one pixel from the right of the video (string)
#global-key-crop-right=

# Crop one pixel from the right of the video (string)
#key-crop-right=Alt+f

# Uncrop one pixel from the right of the video (string)
#global-key-uncrop-right=

# Uncrop one pixel from the right of the video (string)
#key-uncrop-right=Alt+Shift+f

# Random (string)
#global-key-random=

# Random (string)
#key-random=r

# Normal/Loop/Repeat (string)
#global-key-loop=

# Normal/Loop/Repeat (string)
#key-loop=l

# Shrink the viewpoint field of view (360°) (string)
#global-key-viewpoint-fov-in=

# Shrink the viewpoint field of view (360°) (string)
#key-viewpoint-fov-in=Page Up

# Expand the viewpoint field of view (360°) (string)
#global-key-viewpoint-fov-out=

# Expand the viewpoint field of view (360°) (string)
#key-viewpoint-fov-out=Page Down

# Roll the viewpoint clockwise (360°) (string)
#global-key-viewpoint-roll-clock=

# Roll the viewpoint clockwise (360°) (string)
#key-viewpoint-roll-clock=

# Roll the viewpoint anti-clockwise (360°) (string)
#global-key-viewpoint-roll-anticlock=

# Roll the viewpoint anti-clockwise (360°) (string)
#key-viewpoint-roll-anticlock=

# 1:4 Quarter (string)
#global-key-zoom-quarter=

# 1:4 Quarter (string)
#key-zoom-quarter=Alt+1

# 1:2 Half (string)
#global-key-zoom-half=

# 1:2 Half (string)
#key-zoom-half=Alt+2

# 1:1 Original (string)
#global-key-zoom-original=

# 1:1 Original (string)
#key-zoom-original=Alt+3

# 2:1 Double (string)
#global-key-zoom-double=

# 2:1 Double (string)
#key-zoom-double=Alt+4

# Very short jump length (integer)
#extrashort-jump-size=3

# Short jump length (integer)
#short-jump-size=10

# Medium jump length (integer)
#medium-jump-size=60

# Long jump length (integer)
#long-jump-size=300

# Set playlist bookmark 1 (string)
#global-key-set-bookmark1=

# Set playlist bookmark 1 (string)
#key-set-bookmark1=Ctrl+F1

# Set playlist bookmark 2 (string)
#global-key-set-bookmark2=

# Set playlist bookmark 2 (string)
#key-set-bookmark2=Ctrl+F2

# Set playlist bookmark 3 (string)
#global-key-set-bookmark3=

# Set playlist bookmark 3 (string)
#key-set-bookmark3=Ctrl+F3

# Set playlist bookmark 4 (string)
#global-key-set-bookmark4=

# Set playlist bookmark 4 (string)
#key-set-bookmark4=Ctrl+F4

# Set playlist bookmark 5 (string)
#global-key-set-bookmark5=

# Set playlist bookmark 5 (string)
#key-set-bookmark5=Ctrl+F5

# Set playlist bookmark 6 (string)
#global-key-set-bookmark6=

# Set playlist bookmark 6 (string)
#key-set-bookmark6=Ctrl+F6

# Set playlist bookmark 7 (string)
#global-key-set-bookmark7=

# Set playlist bookmark 7 (string)
#key-set-bookmark7=Ctrl+F7

# Set playlist bookmark 8 (string)
#global-key-set-bookmark8=

# Set playlist bookmark 8 (string)
#key-set-bookmark8=Ctrl+F8

# Set playlist bookmark 9 (string)
#global-key-set-bookmark9=

# Set playlist bookmark 9 (string)
#key-set-bookmark9=Ctrl+F9

# Set playlist bookmark 10 (string)
#global-key-set-bookmark10=

# Set playlist bookmark 10 (string)
#key-set-bookmark10=Ctrl+F10

# Play playlist bookmark 1 (string)
#global-key-play-bookmark1=

# Play playlist bookmark 1 (string)
#key-play-bookmark1=F1

# Play playlist bookmark 2 (string)
#global-key-play-bookmark2=

# Play playlist bookmark 2 (string)
#key-play-bookmark2=F2

# Play playlist bookmark 3 (string)
#global-key-play-bookmark3=

# Play playlist bookmark 3 (string)
#key-play-bookmark3=F3

# Play playlist bookmark 4 (string)
#global-key-play-bookmark4=

# Play playlist bookmark 4 (string)
#key-play-bookmark4=F4

# Play playlist bookmark 5 (string)
#global-key-play-bookmark5=

# Play playlist bookmark 5 (string)
#key-play-bookmark5=F5

# Play playlist bookmark 6 (string)
#global-key-play-bookmark6=

# Play playlist bookmark 6 (string)
#key-play-bookmark6=F6

# Play playlist bookmark 7 (string)
#global-key-play-bookmark7=

# Play playlist bookmark 7 (string)
#key-play-bookmark7=F7

# Play playlist bookmark 8 (string)
#global-key-play-bookmark8=

# Play playlist bookmark 8 (string)
#key-play-bookmark8=F8

# Play playlist bookmark 9 (string)
#global-key-play-bookmark9=

# Play playlist bookmark 9 (string)
#key-play-bookmark9=F9

# Play playlist bookmark 10 (string)
#global-key-play-bookmark10=

# Play playlist bookmark 10 (string)
#key-play-bookmark10=F10

# Clear the playlist (string)
#global-key-clear-playlist=

# Clear the playlist (string)
#key-clear-playlist=Ctrl+w

# Reset subtitles text scale (string)
#global-key-subtitle-text-scale-normal=

# Reset subtitles text scale (string)
#key-subtitle-text-scale-normal=Ctrl+0

# Scale down subtitles text (string)
#global-key-subtitle-text-scale-up=

# Scale down subtitles text (string)
#key-subtitle-text-scale-up=Ctrl+Mouse Wheel Up

# Scale up subtitles text (string)
#global-key-subtitle-text-scale-down=

# Scale up subtitles text (string)
#key-subtitle-text-scale-down=Ctrl+Mouse Wheel Down

# Playlist bookmark 1 (string)
#bookmark1=

# Playlist bookmark 2 (string)
#bookmark2=

# Playlist bookmark 3 (string)
#bookmark3=

# Playlist bookmark 4 (string)
#bookmark4=

# Playlist bookmark 5 (string)
#bookmark5=

# Playlist bookmark 6 (string)
#bookmark6=

# Playlist bookmark 7 (string)
#bookmark7=

# Playlist bookmark 8 (string)
#bookmark8=

# Playlist bookmark 9 (string)
#bookmark9=

# Playlist bookmark 10 (string)
#bookmark10=
EOF
chown ubuntu -R $HOME/.config/vlc


mkdir -p $HOME/gPodder
cat << EOF > $HOME/gPodder/Settings.json
{
  "auto": {
    "cleanup": {
      "days": 1,
      "played": true,
      "unfinished": true,
      "unplayed": false
    },
    "retries": 3,
    "update": {
      "enabled": true,
      "frequency": 20
    }
  },
  "device_sync": {
    "after_sync": {
      "delete_episodes": false,
      "mark_episodes_played": false,
      "sync_disks": false
    },
    "custom_sync_name": "{episode.sortdate}_{episode.title}",
    "custom_sync_name_enabled": false,
    "delete_played_episodes": false,
    "device_folder": "/media",
    "device_type": "none",
    "max_filename_length": 120,
    "one_folder_per_podcast": true,
    "playlists": {
      "create": true,
      "folder": "Playlists",
      "two_way_sync": false,
      "use_absolute_path": true
    },
    "skip_played_episodes": true
  },
  "downloads": {
    "chronological_order": true
  },
  "extensions": {
    "enabled": [
      "gtk_statusicon",
      "enqueue_in_mediaplayer",
      "youtube-dl",
      "rename_download"
    ],
    "enqueue_in_mediaplayer": {
      "default_player": "",
      "enqueue_after_download": false
    },
    "gtk_statusicon": {
      "download_progress_bar": false
    },
    "rename_download": {
      "add_podcast_title": false,
      "add_sortdate": false
    },
    "youtube-dl": {
      "manage_channel": true,
      "manage_downloads": true
    }
  },
  "limit": {
    "bandwidth": {
      "enabled": false,
      "kbps": 500.0
    },
    "downloads": {
      "concurrent": 5,
      "concurrent_max": 16,
      "enabled": true
    },
    "episodes": 10
  },
  "mygpo": {
    "device": {
      "caption": "gPodder on desktop-1594200344",
      "type": "desktop",
      "uid": "desktop-1594200344"
    },
    "enabled": true,
    "password": "vopqem-sabwuj-Qosga8",
    "server": "gpodder.net",
    "username": "Jafudi"
  },
  "player": {
    "audio": "/usr/bin/vlc --started-from-file %U",
    "video": "/usr/bin/vlc --started-from-file %U"
  },
  "software_update": {
    "check_on_startup": false,
    "interval": 5,
    "last_check": 0
  },
  "ui": {
    "cli": {
      "colors": true
    },
    "gtk": {
      "download_list": {
        "remove_finished": true
      },
      "episode_list": {
        "columns": 6,
        "descriptions": true,
        "view_mode": 1
      },
      "html_shownotes": true,
      "live_search_delay": 200,
      "new_episodes": "show",
      "podcast_list": {
        "all_episodes": true,
        "hide_empty": false,
        "sections": true,
        "view_mode": 1
      },
      "state": {
        "config_editor": {
          "height": -1,
          "maximized": false,
          "width": -1,
          "x": -1,
          "y": -1
        },
        "episode_selector": {
          "height": 400,
          "maximized": false,
          "width": 600,
          "x": 508,
          "y": 326
        },
        "episode_window": {
          "height": 400,
          "maximized": false,
          "width": 500,
          "x": -1,
          "y": -1
        },
        "export_to_local_folder": {
          "height": 400,
          "maximized": false,
          "width": 500,
          "x": -1,
          "y": -1
        },
        "main_window": {
          "episode_column_order": [],
          "episode_column_sort_id": 12,
          "episode_column_sort_order": false,
          "episode_list_size": 200,
          "height": 500,
          "maximized": false,
          "paned_position": 200,
          "width": 700,
          "x": 452,
          "y": 207
        },
        "preferences": {
          "height": -1,
          "maximized": false,
          "width": -1,
          "x": -1,
          "y": -1
        }
      },
      "toolbar": false
    }
  },
  "vimeo": {
    "fileformat": "720p"
  },
  "youtube": {
    "preferred_fmt_id": 18,
    "preferred_fmt_ids": []
  }
}
'EOF'
