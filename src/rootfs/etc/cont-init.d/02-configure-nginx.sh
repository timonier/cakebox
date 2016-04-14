#!/usr/bin/with-contenv /bin/sh

sed -i "s@%CAKEBOX_USER%@${CAKEBOX_USER:-"nobody"}@g" /etc/nginx/nginx.conf
sed -i "s@%CAKEBOX_GROUP%@${CAKEBOX_GROUP:-"nogroup"}@g" /etc/nginx/nginx.conf
sed -i "s@%CAKEBOX_ROOT%@${CAKEBOX_ROOT:-"/var/www/"}@g" /etc/nginx/nginx.conf

sed -i "s@%CAKEBOX_USER%@${CAKEBOX_USER:-"nobody"}@g" /etc/nginx/conf.d/www.conf
sed -i "s@%CAKEBOX_GROUP%@${CAKEBOX_GROUP:-"nogroup"}@g" /etc/nginx/conf.d/www.conf
sed -i "s@%CAKEBOX_ROOT%@${CAKEBOX_ROOT:-"/var/www/"}@g" /etc/nginx/conf.d/www.conf

exit 0
