#!/bin/bash

echo "[script] : Install docker"
if ! command -v docker &> /dev/null
then 
  echo "[script] : Start install docker"
  apt update
  apt install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  apt update
  apt-cache policy docker-ce
  apt install docker-ce
  systemctl start docker
  systemctl status docker
else 
  echo "[script] : Docker already installed, skip installation"
fi

