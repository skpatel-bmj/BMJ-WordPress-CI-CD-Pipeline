#! /bin/bash

echo "Upload to s3 bucket....."
sudo cp -r backup/Stg-Server/* backup/update/
aws s3 sync backup s3://bmj-wp-lamp-server/
echo "Upload S3 Backup........OK"
