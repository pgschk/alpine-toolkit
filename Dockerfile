ARG ALPINE_VERSION=3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
FROM alpine:${ALPINE_VERSION}

ARG BASE_PACKAGES="nano openssl netcat-openbsd inetutils-telnet curl tcpdump"
ARG EXTRA_PACKAGES=""

RUN apk upgrade --no-cache && \
    apk add --no-cache ${BASE_PACKAGES} ${EXTRA_PACKAGES}

COPY toolkit-aliases.sh /etc/profile.d/toolkit-aliases.sh

ENTRYPOINT [ "/bin/ash", "-l" ]