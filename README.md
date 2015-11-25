### Installation

Pull the image `mauchede/cakebox`:

```bash
# Get the latest image
docker pull mauchede/cakebox

# Or get a specific version

# Get the version 1.8.3
docker pull mauchede/cakebox:1.8.3
```

### Usage

It is possible to change the [cakebox options](https://github.com/Cakebox/cakebox/blob/master/config/default.php.dist) via the environment variables:

```bash
docker run \
    -e CAKEBOX_USER=$USER \
    -e CAKEBOX_ROOT=$PWD \
    -e RIGHTS_CAN_DELETE=TRUE \
    -p 80:80 \
    -v /etc/passwd:/etc/passwd:ro \
    -v $PWD:$PWD \
    mauchede/cakebox

# Go to the URL "localhost"
```

### Contributing

1. Fork it.
2. Create your branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Submit a pull request.

__Note__: Use the script `bin/build` to test your modifications locally.

### Links

* [cakebox](https://github.com/Cakebox/cakebox)
* [cakebox options](https://github.com/Cakebox/cakebox/blob/master/config/default.php.dist)
* [command "docker pull"](https://docs.docker.com/reference/commandline/pull/)
* [command "docker run"](https://docs.docker.com/reference/run/)
* [image "mauchede/cakebox"](https://hub.docker.com/r/mauchede/cakebox/)