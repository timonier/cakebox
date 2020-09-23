# README

Browse, watch, manage and share your files

⚠️ This project is no longer maintained. ⚠️

## Usage

Run the application via `docker run`. It is possible to change the [cakebox options](https://github.com/cakebox/cakebox/blob/master/config/default.php.dist) via the environment variables:

```sh
docker run \
    --env "CAKEBOX_ROOT=${PWD}" \
    --env "GROUP=$(id --group)" \
    --env RIGHTS_CAN_DELETE=TRUE \
    --env "USER=$(id --user)" \
    --publish 80:80 \
    --volume "${PWD}:${PWD}" \
    timonier/cakebox
# Go to "http://localhost/"
```

## Links

* [cakebox/cakebox](https://github.com/cakebox/cakebox)
* [command "docker run"](https://docs.docker.com/reference/run/)
* [image "timonier/cakebox"](https://hub.docker.com/r/timonier/cakebox/)
* [timonier/dumb-entrypoint](https://github.com/timonier/dumb-entrypoint)
* [timonier/version-lister](https://github.com/timonier/version-lister)
