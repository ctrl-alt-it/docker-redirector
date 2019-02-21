#!/bin/sh
/bin/sed -i "s,REDIRECT_URL,$REDIRECT_URL," /etc/nginx/nginx.conf
/usr/sbin/nginx