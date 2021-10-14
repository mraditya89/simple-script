#!/bin/bash

echo "[script] : Install nodejs"
if ! command -v node &> /dev/null
then 
  cd ~
  curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
  bash nodesource_setup.sh
  apt install nodejs
  npm install -g yarn
else 
  echo "[script] : Nodejs already installed, skip installation"
fi

