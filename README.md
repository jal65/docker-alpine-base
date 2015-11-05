# docker-alpine-base

## ...to be used in FROM directive of Dockerfile

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
