#!/bin/sh
set -e

configure_application() {
    sed -i "s@%$1%@$2@g" /etc/nginx/nginx.conf
    sed -i "s@%$1%@$2@g" /etc/nginx/conf.d/cakebox.conf
    sed -i "s@%$1%@$2@g" /etc/php5/fpm/pool.d/www.conf
    sed -i "s@%$1%@$2@g" /var/www/cakebox/config/default.php
}

configure_application CAKEBOX_USER ${CAKEBOX_USER:-"nobody"}
configure_application CAKEBOX_GROUP ${CAKEBOX_GROUP:-"nogroup"}
configure_application CAKEBOX_ROOT ${CAKEBOX_ROOT:-"/var/www/"}
configure_application CAKEBOX_ACCESS ${CAKEBOX_ACCESS:-"/access/"}
configure_application CAKEBOX_LANGUAGE ${CAKEBOX_LANGUAGE:-"en"}
configure_application DIRECTORY_IGNORE_DOTFILES ${DIRECTORY_IGNORE_DOTFILES:-"TRUE"}
configure_application DIRECTORY_IGNORE ${DIRECTORY_IGNORE:-"//"}
configure_application PLAYER_DEFAULT_TYPE ${PLAYER_DEFAULT_TYPE:-"html5"}
configure_application PLAYER_AUTO_PLAY ${PLAYER_AUTO_PLAY:-"FALSE"}
configure_application RIGHTS_CAN_PLAY_MEDIA ${RIGHTS_CAN_PLAY_MEDIA:-"TRUE"}
configure_application RIGHTS_CAN_DOWNLOAD_FILE ${RIGHTS_CAN_DOWNLOAD_FILE:-"TRUE"}
configure_application RIGHTS_CAN_ARCHIVE_DIRECTORY ${RIGHTS_CAN_ARCHIVE_DIRECTORY:-"FALSE"}
configure_application RIGHTS_CAN_DELETE ${RIGHTS_CAN_DELETE:-"FALSE"}
configure_application BS_LOGIN ${BS_LOGIN:-""}
configure_application BS_PASSWORD ${BS_PASSWORD:-""}
configure_application BS_API_KEY ${BS_API_KEY:-""}

/usr/sbin/php5-fpm -D -R

/usr/sbin/nginx -g "daemon off;"
