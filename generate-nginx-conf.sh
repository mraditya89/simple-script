#!/bin/bash
# The script is used for generating a simple nginx configuration 
# for a static website and enabled it
# Prerequisite : 
# - Nginx
# - Allow Nginx HTTP

# setup parameter
PROJECT_NAME="respinos" # fill it using 
WORK_PATH="/home/aditya/Documents/aditya" #path for static website
SERVER_IP="192.168.2.8" # Domain name / IP
PORT="8080" # Published port

# create nginx configuration file
echo "[SCRIPT] : Creating NGINX Configuration File ..."

CONF_FILE="/etc/nginx/sites-available/$PROJECT_NAME"
sudo touch $CONF_FILE

sudo cat << EOF > $CONF_FILE
server {
    listen $PORT;
    server_name $SERVER_IP;
    
    root $WORK_PATH;
    index index.html index.htm;

    location / {
        try_files \$uri /index.html;
    }
}
EOF

# Enable configuration file
sudo echo "[SCRIPT] : Enable NGINX Configuration ..."
ENABLED_PATH="/etc/nginx/sites-enabled"
sudo rm "$ENABLED_PATH/$PROJECT_NAME"
sleep 2
sudo ln -s $CONF_FILE "$ENABLED_PATH/$PROJECT_NAME"
sudo nginx -t
sudo systemctl restart nginx

echo "[SCRIPT] : Done"
