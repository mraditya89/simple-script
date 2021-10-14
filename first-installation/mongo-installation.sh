#!/bin/bash

echo "[script] : Install mongodb"
if ! command -v mongo &> /dev/null
then 
  echo "[script] : Start installing mongodb"
  curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
  apt-key list
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
  apt update
  apt install mongodb-org
  systemctl start mongod
  systemctl enable mongod
else 
  echo "[script] : Mongodb already installed, skip installation"
fi


#mongo
#> show dbs
#> use admin
#> db.createUser({user: "root", pwd: passwordPrompt(), roles: [role: "userAdminAnyDatabase", db:"admin", "readWriteAnyDatabase"]})
#> exit

