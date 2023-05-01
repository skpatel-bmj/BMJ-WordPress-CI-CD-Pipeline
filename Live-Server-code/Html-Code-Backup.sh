#! /bin/bash

echo "HTML Backup Creation....."
sudo mkdir backup/Live-Server/HTML/Liv-html$(date +"%Y%m%d-%H%M%S")
sudo cp -r /var/www/html/* backup/Live-Server/HTML/Liv-html$(date +"%Y%m%d-%H%M%S")
echo ""
echo "HTML Backup Creation..........OK"
