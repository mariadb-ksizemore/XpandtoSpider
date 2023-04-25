#!/bin/bash

if [ "$(hostname)" == "xpd1" ]; then
    mariadb -e "SET GLOBAL sql_mode = '';"
    mariadb -e "GRANT ALL ON *.* TO 'importuser'@'%' IDENTIFIED BY 'importuserpasswd';"
    mariadb -e "CREATE DATABASE bts;"
    wget -q --show-progress https://sample-columnstore-data.s3.us-west-2.amazonaws.com/flights.sql
    /opt/clustrix/bin/clustrix_import -u importuser -p importuserpasswd -D bts -i flights.sql
    if [ $? -eq 0 ]; then
        printf "Installing Sample Xpand Tables... done\n"
    else
        echo "Installing Sample Xpand Tables... fail\n"
        exit 1
    fi
else
    echo "This must be run on xpd1!"
    exit 1
fi
