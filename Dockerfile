FROM gliderlabs/alpine

MAINTAINER rob dux <robwdux@gmail.com>

RUN set -o nounset -o errexit -o xtrace -o verbose && \
    # update index and install packages
    apk add --update \
    curl bash && \
    # remove package index
    rm -rf /var/cache/apk/*
