#! /bin/bash

echo "SQl Backup Creation...."
mysqldump -uroot -proot webdata > backup/Live-Server/SQL/Liv-dbserver-$(date +%Y-%m-%d-%H%M%S).sql
echo "SQL Backup Creation ...................Done"
