# README

## Installation

Pull the image `timonier/cakebox`:

```sh
# Get the latest image
docker pull timonier/cakebox

# Or get a specific version

# Get the version 1.8.3
docker pull timonier/cakebox:1.8.3
```

## Usage

Run the application via `docker run`. It is possible to change the [cakebox options](https://github.com/Cakebox/cakebox/blob/master/config/default.php.dist) via the environment variables:

```sh
docker run \
    -e CAKEBOX_USER=$USER \
    -e CAKEBOX_ROOT=$PWD \
    -e RIGHTS_CAN_DELETE=TRUE \
    -p 80:80 \
    -v /etc/passwd:/etc/passwd:ro \
    -v $PWD:$PWD \
    timonier/cakebox:1.8.3

# Go to the URL "localhost"
```

## Contributing

1. Fork it.
2. Create your branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Submit a pull request.

__Note__: Use the script `bin/build` to test your modifications locally.

## Links

* [cakebox](https://github.com/Cakebox/cakebox)
* [cakebox options](https://github.com/Cakebox/cakebox/blob/master/config/default.php.dist)
* [command "docker pull"](https://docs.docker.com/reference/commandline/pull/)
* [command "docker run"](https://docs.docker.com/reference/run/)
* [image "timonier/cakebox"](https://hub.docker.com/r/timonier/cakebox/)
* [s6-overlay](https://github.com/just-containers/s6-overlay)
* [syslog-stdout](https://github.com/timonier/syslog-stdout)
