#!/usr/bin/env bash

VERSION=12

if [ `uname -m | grep armv6l` ]
then
  sudo apt-get install -y curl xz-utils

  NODENAME=`curl -sL https://nodejs.org/dist/latest-v${VERSION}.x/SHASUMS256.txt | grep "node-v${VERSION}.*linux-armv6l.tar.xz" -o`
  NODEFOLDERNAME=${NODENAME:0:-7}

  echo -e "\nDownloading and Installing Node.js ${NODENAME:5:-20} for armv6l...\n"

  curl -sL "https://nodejs.org/dist/latest-v${VERSION}.x/${NODENAME}" > "/tmp/${NODENAME}"
  mkdir /tmp/node
  tar -xf "/tmp/${NODENAME}" -C /tmp/node
  cp -Rf "/tmp/node/${NODEFOLDERNAME}/bin" "/tmp/node/${NODEFOLDERNAME}/lib" "/tmp/node/${NODEFOLDERNAME}/share" /usr/local

  echo "Clearing temporary files..."
  rm "/tmp/${NODENAME}"
  rm -rf /tmp/node
else
  sudo apt-get install -y curl

  curl -sL "https://deb.nodesource.com/setup_${VERSION}.x" | sudo -E bash -
  sudo apt-get install -y nodejs
fi

echo "NodeJS installed."
