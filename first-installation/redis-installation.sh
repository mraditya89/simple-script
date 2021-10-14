#!/bin/bash

echo "[script] : Install redis"
if ! command -v redis &> /dev/null
then 
  echo "[script] : Start install redis"
  apt update
  apt install redis-server
  systemctl start redis
  systemctl status redis
else 
  echo "[script] : Nginx already installed, skip installation"
fi

