#!/bin/bash

if [ "$(hostname)" == "xpd1" ]; then
    mariadb -e "SET GLOBAL sql_mode = '';"
    mariadb -e "GRANT ALL ON *.* TO 'importuser'@'%' IDENTIFIED BY 'importuserpasswd';"
    mariadb -e "CREATE DATABASE IF NOT EXISTS bts;"
    printf "Downloading data from S3...\n"
    curl -O --progress-bar https://sample-columnstore-data.s3.us-west-2.amazonaws.com/bts.sql
    printf "Inserting into Xpand...\n"
    /opt/clustrix/bin/clustrix_import --scan-for-newlines=0 -u importuser -p importuserpasswd -i bts.sql 
    if [ $? -eq 0 ]; then
        printf "Installing Sample Xpand Tables... done\n"
    else
        printf "Installing Sample Xpand Tables... fail\n"
        exit 1
    fi
else
    echo "This must be run on xpd1!"
    exit 1
fi
