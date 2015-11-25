FROM gliderlabs/alpine

MAINTAINER rob dux <robwdux@gmail.com>

RUN set -o nounset -o errexit -o xtrace -o verbose && \
    # update index and install packages
    apk add --update-cache \
      curl ca-certificates bash && \
    # remove package index
    rm -rf /var/cache/apk/*
