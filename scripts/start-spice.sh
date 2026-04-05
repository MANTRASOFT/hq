#!/bin/bash

# 1. Variables
DISPLAY_NUM=":10"
SPICE_PORT="5900"
CONFIG="/etc/X11/spiceqxl.xorg.conf"

echo "--- Initializing SPICE Session ---"

# 2. Cleanup (Running as root via sudo later)
echo "Cleaning up processes..."
pkill -f Xspice
pkill -f mate-session
echo "Wiping X11 lock files..."
rm -f /tmp/.X${DISPLAY_NUM:1}-lock
rm -rf /tmp/.X11-unix/X${DISPLAY_NUM:1}

# 3. Start Engine
echo "Starting Xspice on $DISPLAY_NUM..."
Xspice $DISPLAY_NUM --port $SPICE_PORT --disable-ticketing --config $CONFIG &

# 4. Wait for X
sleep 3

# 5. Launch Desktop
echo "Launching MATE Desktop..."
export DISPLAY=$DISPLAY_NUM
mate-session &

echo "--- DONE ---"
