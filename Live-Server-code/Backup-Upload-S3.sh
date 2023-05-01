#! /bin/bash

echo "Upload to s3 bucket....."
aws s3 sync backup s3://bmj-wp-lamp-server/
echo "Upload S3 Backup........OK"
