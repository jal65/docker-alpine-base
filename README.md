# docker-alpine-base

[![](https://badge.imagelayers.io/robwdux/docker-alpine-base:latest.svg)](https://imagelayers.io/?images=robwdux/docker-alpine-base:latest 'Get your own badge on imagelayers.io')

## ...start your Dockerfile

```shell
FROM robwdux/alpine-base
```

+ Provides Bash shell (available, but not as the default sh), cURL, root ca-certificates and full featured sed

+ [Package mirrors deliverd by Fastly CDN courtesy of Gliderlabs](http://gliderlabs.com/blog/2015/09/23/fastly-cdn-speeds-up-alpine-package-installs/)

## Test Drive, Iterate for a new image

*Interactively test commands and such then record in a Dockerfile for a new project*

### Build or run with docker-compose
```shell
# add short alias for docker-compose
echo "alias dc='docker-compose '" >> ~/.bashrc && source ~/.bashrc

# the repo
git clone https://github.com/robwdux/docker-alpine-base.git

cd docker-alpine-base/

# build and run (image doesn't exist locally)
dc run --rm -ti base bash

# build explicitly
dc build

# build with meta data via build args for git info
sudo ./build.sh

# view meta data
$ docker inspect --format '{{ json .Config.Labels }}' robwdux/alpine-base:3.4 | jq
{
  "GIT_COMMIT": "e8511e87d67a72128b2631ee5ef45bf7f64dc82a",
  "GIT_COMMIT_AUTHOR": "rob dux robwdux@gmail.com",
  "GIT_COMMIT_DATE": "2016-07-04T20:08:24-05:00",
  "GIT_REPO_URL": "https://github.com/robwdux/docker-alpine-base.git"
}
```

### shell in interactively
```shell
sudo docker run --rm -it \
                --name base \
                robwdux/alpine-base \
                bash
```
### search for and install packages, build from source

#### Reference [APKBUILDs](https://github.com/alpinelinux/aports) for source builds if official ones do not already exist in [Docker Library](https://github.com/docker-library)

[for example: offical alpine ruby image](https://github.com/docker-library/ruby/blob/master/2.3/alpine/Dockerfile)

```shell
$ apk update && apk search rabbit*
rabbitmq-c-dev-0.8.0-r0
py-rabbit-1.1.0-r0
rabbitmq-c-doc-0.8.0-r0
rabbitmq-c-0.8.0-r0
rabbitmq-c-utils-0.8.0-r0

$ apk info rabbitmq-c
rabbitmq-c-0.8.0-r0 description:
RabbitMQ C client

rabbitmq-c-0.8.0-r0 webpage:
https://github.com/alanxz/rabbitmq-c

rabbitmq-c-0.8.0-r0 installed size:
126976
```

### Take advantage of repo pinning support added
#### Target edge branch and the associated repositories
```shell
# keep it tidy, no apk cache left behind. install any package from current release, any repo (main,community, testing)
apk add --no-cache
# install from particular edge repos
apk add --no-cache \
        # edge branch, main repository
        redis@edge \
        # edge branch, community repository
        bmon@community \
        # edge branch, testing repository
        rabbitmq-c@testing
```

### Handling Build Dependencies
#### Purge the bloat after they have served the purpose
```shell
# tag a group of apks installed, simplifies removal at a later time, e.g. build dependencies
apk add --no-cache --virtual .buildDeps \
        make \
        autoconf \
        gcc \
        linux-headers \
        libc-dev ...
# make && make install
# remove
apk del .buildDeps && rm -rf /usr/src
```

### example: shell into a daemonized running container
```shell
sudo docker run -d \
                --name base \
                robwdux/alpine-base \
                ping 8.8.8.8 && \
sudo docker exec -it base bash
```


## [Alpine Linux](http://alpinelinux.org/)

**security, simplicity and resource efficiency**

### Working with Alpine Linux

+ [Alpine Linux Docker Image](http://gliderlabs.viewdocs.io/docker-alpine/)

+ [Caveats](http://gliderlabs.viewdocs.io/docker-alpine/caveats/)

+ [Packages](https://pkgs.alpinelinux.org/packages)

+ [Package Management](http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)

+ [Search the mail archives for help](http://lists.alpinelinux.org/)

#### [userland commands provided by busybox](http://www.busybox.net/downloads/BusyBox.html)

[command reference](http://www.busybox.net/downloads/BusyBox.html)

#### [default shell - Almquist (ash)](http://www.in-ulm.de/~mascheck/various/ash/#busybox)

+ command substituion **$( ... )**, pipefail, substring and replacement parameter expansion

+ redirect stderr to stdout **&>**

+ no brace expansion **file{1..2}**, arrays, aliases, or jobcontrol

+ [busybox shell readme](http://git.busybox.net/busybox/tree/shell/README)

#### [libc - musl](http://www.musl-libc.org/)

[Differences from glibc](http://wiki.musl-libc.org/wiki/Functional_differences_from_glibc)
