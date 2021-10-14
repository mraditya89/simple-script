#!/bin/bash

echo "[script] : Install nginx"
if ! command -v nginx &> /dev/null
then 
  echo "[script] : Start install nginx"
  apt update
  apt install nginx
  echo "[script] : Activate firewall"
  ufw allow 'Nginx HTTP'
  ufw enable
  ufw allow ssh
  ufw status
  systemctl status nginx
else 
  echo "[script] : Nginx already installed, skip installation"
fi

