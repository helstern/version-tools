#!/usr/bin/env sh

set -e

FILENAME="$(basename ${0})"

usage() {
    echo "usage: ${FILENAME} -[M][m][p]"
    echo "if the current folder has a bin/${FILENAME} executable script"
    echo "it will be called with the version as an argument before comiting"
}

CURRENT_VERSION="$(versions.sh gitrelease)"
VERSION=$(bumpit "$@" "${CURRENT_VERSION}")

plugin="${PWD}/bin/${FILENAME}"
if test -x "${plugin}"; then
    "${plugin}" "${VERSION}"
fi

kacl release "${VERSION}"
git add CHANGELOG.md
git commit -m "tag release: ${VERSION}"
git tag -a ${VERSION} -m ""

echo "tagged for release ${VERSION}"
