#!/usr/bin/with-contenv /bin/sh

sed -i "s@%CAKEBOX_USER%@${CAKEBOX_USER:-"nobody"}@g" /var/www/config/default.php
sed -i "s@%CAKEBOX_GROUP%@${CAKEBOX_GROUP:-"nogroup"}@g" /var/www/config/default.php
sed -i "s@%CAKEBOX_ROOT%@${CAKEBOX_ROOT:-"/var/www/"}@g" /var/www/config/default.php
sed -i "s@%CAKEBOX_ACCESS%@${CAKEBOX_ACCESS:-"/access/"}@g" /var/www/config/default.php
sed -i "s@%CAKEBOX_LANGUAGE%@${CAKEBOX_LANGUAGE:-"en"}@g" /var/www/config/default.php
sed -i "s@%DIRECTORY_IGNORE_DOTFILES%@${DIRECTORY_IGNORE_DOTFILES:-"TRUE"}@g" /var/www/config/default.php
sed -i "s@%DIRECTORY_IGNORE%@${DIRECTORY_IGNORE:-"//"}@g" /var/www/config/default.php
sed -i "s@%PLAYER_DEFAULT_TYPE%@${PLAYER_DEFAULT_TYPE:-"html5"}@g" /var/www/config/default.php
sed -i "s@%PLAYER_AUTO_PLAY%@${PLAYER_AUTO_PLAY:-"FALSE"}@g" /var/www/config/default.php
sed -i "s@%RIGHTS_CAN_PLAY_MEDIA%@${RIGHTS_CAN_PLAY_MEDIA:-"TRUE"}@g" /var/www/config/default.php
sed -i "s@%RIGHTS_CAN_DOWNLOAD_FILE%@${RIGHTS_CAN_DOWNLOAD_FILE:-"TRUE"}@g" /var/www/config/default.php
sed -i "s@%RIGHTS_CAN_ARCHIVE_DIRECTORY%@${RIGHTS_CAN_ARCHIVE_DIRECTORY:-"FALSE"}@g" /var/www/config/default.php
sed -i "s@%RIGHTS_CAN_DELETE%@${RIGHTS_CAN_DELETE:-"FALSE"}@g" /var/www/config/default.php
sed -i "s@%BS_LOGIN%@${BS_LOGIN:-""}@g" /var/www/config/default.php
sed -i "s@%BS_PASSWORD%@${BS_PASSWORD:-""}@g" /var/www/config/default.php
sed -i "s@%BS_API_KEY%@${BS_API_KEY:-""}@g" /var/www/config/default.php

exit 0
