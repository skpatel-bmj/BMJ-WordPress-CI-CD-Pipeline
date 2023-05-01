#! /bin/bash

echo "clear old sql and html backup"
aws s3 rm s3://bmj-wp-lamp-server/update --recursive
