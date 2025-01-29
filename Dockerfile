ARG ALPINE_VERSION=3.21@sha256:56fa17d2a7e7f168a043a2712e63aed1f8543aeafdcee47c58dcffe38ed51099
FROM alpine:${ALPINE_VERSION}

ARG BASE_PACKAGES="nano openssl netcat-openbsd inetutils-telnet curl tcpdump"
ARG EXTRA_PACKAGES=""

RUN apk add --update --no-cache ${BASE_PACKAGES} ${EXTRA_PACKAGES}

COPY toolkit-aliases.sh /etc/profile.d/toolkit-aliases.sh

ENTRYPOINT [ "/bin/ash", "-l" ]