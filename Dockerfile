ARG ALPINE_VERSION=3.19@sha256:13b7e62e8df80264dbb747995705a986aa530415763a6c58f84a3ca8af9a5bcd
FROM alpine:${ALPINE_VERSION}

ARG BASE_PACKAGES="netcat-openbsd inetutils-telnet curl tcpdump"
ARG EXTRA_PACKAGES=""

RUN apk add --update --no-cache ${BASE_PACKAGES} ${EXTRA_PACKAGES}

COPY toolkit-aliases.sh /etc/profile.d/toolkit-aliases.sh

ENTRYPOINT [ "/bin/ash", "-l" ]