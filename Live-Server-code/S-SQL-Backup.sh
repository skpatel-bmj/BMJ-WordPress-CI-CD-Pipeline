#! /bin/bash

echo "SQl Backup Creation...."
mysqldump -uroot -proot webdata > backup/Stg-Server/SQL/Stg-dbserver-$(date +%Y-%m-%d-%H%M%S).sql
echo "SQL Backup Creation ...................Done"
