#! /bin/bash

echo "Older clear.... "
mysql -uroot -proot -e "DROP DATABASE webdata"
echo ""
sleep 1
echo "New Databases Crate name WEBDATA.."
sudo mysql -uroot -proot  -e "CREATE DATABASE webdata"
echo ""
sleep 2
echo "New Backup Restore"
sudo  mysql -uroot -proot webdata < SQL/*.sql
echo ""
sleep 2
echo " Table upgrate"
sudo  mysql -uroot -proot  -e "UPDATE wp_options SET option_value = 'http://3.91.203.172/' WHERE option_id IN (1, 2)" webdata
echo ""

