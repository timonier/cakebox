#!/usr/bin/with-contenv /bin/sh

sed -i "s@%CAKEBOX_USER%@${CAKEBOX_USER:-"nobody"}@g" /etc/php5/fpm/pool.d/www.conf
sed -i "s@%CAKEBOX_GROUP%@${CAKEBOX_GROUP:-"nogroup"}@g" /etc/php5/fpm/pool.d/www.conf

exit 0
