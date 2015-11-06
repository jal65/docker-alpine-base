# docker-alpine-base

## ...start your Dockerfile

```shell
FROM robwdux/alpine-base
```

+ Provides cURL and Bash

+ [Leverages fast CDN backed package mirrors provided by fastly](http://gliderlabs.com/blog/2015/09/23/fastly-cdn-speeds-up-alpine-package-installs/)

## Test Drive

### shell in interactively
```shell
sudo docker run --rm -it \
                   --name base \
                   robwdux/alpine-base \
                   bash
```
### shell into a daemonized running container
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

#### [userland commands provided by busybox](http://www.busybox.net/downloads/BusyBox.html)

[command reference](http://www.busybox.net/downloads/BusyBox.html)

#### [default shell - Almquist (ash)](http://www.in-ulm.de/~mascheck/various/ash/#busybox)

+ command substituion **$( ... )**, pipefail, substring and replacement parameter expansion

+ redirect stderr to stdout **&>**

+ no brace expansion **file{1..2}**, arrays, aliases, or jobcontrol

+ [busybox shell readme](http://git.busybox.net/busybox/tree/shell/README)

#### [musl - libc](http://www.musl-libc.org/)
