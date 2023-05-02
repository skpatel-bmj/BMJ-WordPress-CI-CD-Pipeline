#! /bin/bash

sudo mysql -uroot -proot  -e "UPDATE wp_options SET option_value = 'http://54.92.172.141/' WHERE option_id IN (1, 2)" webdata
