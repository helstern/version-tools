#!/usr/bin/env sh

# this is an example plugin for release-simple.sh command

VERSION="${1}"

if test -z "${VERSION}"; then
    echo "version is mandatory"
    exit 1
fi

echo "${VERSION}" > ${PWD}/VERSION
git add ${PWD}/VERSION