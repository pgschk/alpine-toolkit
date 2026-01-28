ARG ALPINE_VERSION=3.22.3@sha256:55ae5d250caebc548793f321534bc6a8ef1d116f334f18f4ada1b2daad3251b2
FROM alpine:${ALPINE_VERSION}

ARG BASE_PACKAGES="nano openssl netcat-openbsd inetutils-telnet curl tcpdump"
ARG EXTRA_PACKAGES=""

RUN apk add --update --no-cache ${BASE_PACKAGES} ${EXTRA_PACKAGES}

COPY toolkit-aliases.sh /etc/profile.d/toolkit-aliases.sh

ENTRYPOINT [ "/bin/ash", "-l" ]