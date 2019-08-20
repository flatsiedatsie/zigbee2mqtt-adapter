#!/bin/bash

set -e -x

# Clean up
rm -rf node_modules
rm -f SHA256SUMS

# Gather dependencies
npm install --production

# Download the latest version of the zigbee2mqtt project and gather its
# dependencies
git submodule update --remote --merge
cd zigbee2mqtt
git reset --hard
git clean -Xdf
npm install --production
cd -

# Generate checksums
sha256sum package.json *.js LICENSE > SHA256SUMS
find node_modules -type f -exec sha256sum {} \; >> SHA256SUMS
find zigbee2mqtt -type f -exec sha256sum {} \; >> SHA256SUMS

# Package everything up
TARFILE=$(npm pack)
tar xzf ${TARFILE}
cp -r node_modules ./package
cp -r zigbee2mqtt ./package
tar czf ${TARFILE} package
rm -rf package

echo "Created ${TARFILE}"
