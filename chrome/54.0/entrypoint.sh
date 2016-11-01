#!/bin/bash

NODE_PORT=${NODE_PORT:-4444}
CHROMEDRIVER_PATH="/usr/bin/chromedriver "
CHROMEDRIVER_ARGS="--port=$NODE_PORT --whitelisted-ips="" --verbose"

echo -e "Re-mounting shm and tmp\n\n"
sudo umount -l /dev/shm
sudo umount -l /tmp
sudo mount -t tmpfs -o size=1280m tmpfs /dev/shm
sudo mount -t tmpfs -o size=768m tmpfs /tmp
echo -e "\n\n"
cat /proc/mounts
echo -e "\n\n"
df -h

echo "Starting Chromedriver on port $NODE_PORT..."
xvfb-run -a -s '-screen 0 1280x1600x24 -noreset' $CHROMEDRIVER_PATH $CHROMEDRIVER_ARGS