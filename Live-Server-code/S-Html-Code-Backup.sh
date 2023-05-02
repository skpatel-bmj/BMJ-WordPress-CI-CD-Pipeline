#! /bin/bash

echo "HTML Backup Creation....."
sudo mkdir backup/Stg-Server/HTML/Stg-html$(date +"%Y%m%d-%H%M%S")
sudo cp -r /var/www/html/* backup/Stg-Server/HTML/Stg-html$(date +"%Y%m%d-%H%M%S")
echo ""
echo "HTML Backup Creation..........OK"
