#!/bin/bash

# the script is used for backup multiple mongo databases
# please change databases name on the databases variable
# run : ./multiple-backup-mongo.sh <username> <password>

databases=(iotPlatformDb respinosDb demoDb)

execute()
{
  $1
}

username=$1
password=$2

folderName="dump"
execute "sudo rm -r ${folderName}"
execute "mkdir ${folderName}"

for index in ${!databases[*]}
do
    dbName="${databases[$index]}"
    execute "mongodump -u ${username} -p ${password} --authenticationDatabase admin --db ${dbName} --out ./${folderName}/${dbName}.bak"
done
