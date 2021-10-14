#!/bin/bash

echo "[script] : Install postgre"
if ! command -v psql &> /dev/null
then 
  echo "[script] : Start install postgresql"
  apt update
  apt install postgresql postgresql-contrib
  sudo systemctl restart postgresql
  sudo systemctl status postgresql
else 
  echo "[script] : Postgresql already installed, skip installation"
fi
