#! /bin/bash

echo "inside S3 Bucket new changes download.. "
aws s3 cp s3://bmj-wp-lamp-server/update/ .  --recursive 
