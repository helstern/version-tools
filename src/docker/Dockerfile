FROM smartystreets/version-tools:latest as version-tools
MAINTAINER Radu Helstern <radu.helstern@gmail.com>

ARG VERSION

# bumpit and taggit
FROM alpine:3.10.2
COPY --from=version-tools / /usr/bin
RUN chmod 0755 /usr/bin/tagit && \
    chmod 0755 /usr/bin/bumpit && \
    rm /usr/bin/bumpit_test

# Packages
RUN apk --update add git less openssh su-exec sudo bash coreutils docker curl jq && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

# Downloads
ARG KACL_VERSION=v0.2.1
ARG KACL_ARCH=linux_amd64

RUN \
    # KACL - keep a changelog utility
    wget https://github.com/helstern/kacl/releases/download/${KACL_VERSION}/kacl-${KACL_VERSION}-${KACL_ARCH}.tar.gz -O /tmp/kacl-${KACL_VERSION}-${KACL_ARCH}.tar.gz && \
    tar -zx  -C /usr/bin -f /tmp/kacl-${KACL_VERSION}-${KACL_ARCH}.tar.gz && \
    rm /tmp/kacl-${KACL_VERSION}-${KACL_ARCH}.tar.gz

# Locals
ADD target/cmd /usr/bin/

# Users
RUN \
    apk add shadow --virtual .user-deps && \
    # the principal user with passwordless sudo capabilities
    addgroup -g 1000 -S version-tools && \
    adduser -u 1000 -S versioneer -G version-tools && \
    sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers && \
    addgroup versioneer wheel && \
    addgroup versioneer docker && \
    # seems docker, at least on ubuntu, gets gid 999
    delgroup ping && groupmod -g 999 docker && \
    apk del .user-deps

# Environment
ARG VERSION
ENV VERSION_TOOLS_VERSION ${VERSION}

WORKDIR home/versioneer

