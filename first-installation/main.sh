#!/bin/bash

if [ "$EUID" -ne 0 ]
then
  echo "[script] : Please run as root. Abort installation"
  exit
fi

echo "[script] : Running the installation script"

bash ./node-installation.sh
bash ./nginx-installation.sh
bash ./mongo-installation.sh
bash ./redis-installation.sh
bash ./docker-installation.sh
