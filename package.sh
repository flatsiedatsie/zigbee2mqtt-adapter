#!/bin/bash

# Download the latest version of the zigbee2mqtt project
#if [ -d zigbee2mqtt ]
#then
#    rm -rf zigbee2mqtt
#    echo "Removed old zigbee2mqtt project"
#fi

#echo "Downloading the latest version of zigbee2mqtt to sub directory"
#git clone https://github.com/Koenkk/zigbee2mqtt.git

# Install everything
#echo "Getting all the dependencies for the add-on and for zigbee2mqtt"
#npm install

rm -f SHA256SUMS
sha256sum -- package.json *.js build.sh LICENSE > SHA256SUMS

echo "Packing..."
npm pack
echo "DONE"
