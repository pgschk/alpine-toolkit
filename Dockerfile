ARG ALPINE_VERSION=3.22@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1
FROM alpine:${ALPINE_VERSION}

ARG BASE_PACKAGES="nano openssl netcat-openbsd inetutils-telnet curl tcpdump"
ARG EXTRA_PACKAGES=""

RUN apk add --update --no-cache ${BASE_PACKAGES} ${EXTRA_PACKAGES}

COPY toolkit-aliases.sh /etc/profile.d/toolkit-aliases.sh

ENTRYPOINT [ "/bin/ash", "-l" ]