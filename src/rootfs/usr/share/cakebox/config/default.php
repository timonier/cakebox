<?php

$app['cakebox.root'] = '%CAKEBOX_ROOT%';
$app['cakebox.access'] = '%CAKEBOX_ACCESS%';
$app['cakebox.language'] = '%CAKEBOX_LANGUAGE%';

$app['directory.ignoreDotFiles'] = filter_var('%DIRECTORY_IGNORE_DOTFILES%', FILTER_VALIDATE_BOOLEAN);
$app['directory.ignore'] = '%DIRECTORY_IGNORE%';

$app['player.default_type'] = '%PLAYER_DEFAULT_TYPE%';
$app['player.auto_play'] = '%PLAYER_AUTO_PLAY%';

$app['rights.canPlayMedia'] = filter_var('%RIGHTS_CAN_PLAY_MEDIA%', FILTER_VALIDATE_BOOLEAN);
$app['rights.canDownloadFile'] = filter_var('%RIGHTS_CAN_DOWNLOAD_FILE%', FILTER_VALIDATE_BOOLEAN);
$app['rights.canArchiveDirectory'] = filter_var('%RIGHTS_CAN_ARCHIVE_DIRECTORY%', FILTER_VALIDATE_BOOLEAN);
$app['rights.canDelete'] = filter_var('%RIGHTS_CAN_DELETE%', FILTER_VALIDATE_BOOLEAN);
$app["rights.canCreate"] = filter_var('%RIGHTS_CAN_CREATE%', FILTER_VALIDATE_BOOLEAN);
$app['rights.canRename'] = filter_var('%RIGHTS_CAN_RENAME%', FILTER_VALIDATE_BOOLEAN);
$app["rights.canUpload"] = filter_var('%RIGHTS_CAN_UPLOAD%', FILTER_VALIDATE_BOOLEAN);

$app['bs.login'] = '%BS_LOGIN%';
$app['bs.passwd'] =  '%BS_PASSWORD%';
$app['bs.apikey'] = '%BS_API_KEY%';
