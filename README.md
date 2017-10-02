# README

Browse, watch, manage and share your files

## Usage

Run the application via `docker run`. It is possible to change the [cakebox options](https://github.com/cakebox/cakebox/blob/master/config/default.php.dist) via the environment variables:

```sh
docker run \
    --env "CAKEBOX_USER=${USER}" \
    --env "CAKEBOX_ROOT=${PWD}" \
    --env RIGHTS_CAN_DELETE=TRUE \
    --publish 80:80 \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume "${PWD}:${PWD}" \
    timonier/cakebox
# Go to "http://localhost/"
```

## Contributing

1. Fork it.
2. Create your branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Submit a pull request.

__Note__: Use the script `bin/build` to test your modifications locally.

## Links

* [cakebox/cakebox](https://github.com/cakebox/cakebox)
* [command "docker run"](https://docs.docker.com/reference/run/)
* [image "timonier/cakebox"](https://hub.docker.com/r/timonier/cakebox/)
* [timonier/dumb-entrypoint](https://github.com/timonier/dumb-entrypoint)
* [timonier/version-lister](https://github.com/timonier/version-lister)
