#!/usr/bin/env sh

set -e

function gitversion() {
    local HEAD="$(git rev-parse HEAD)"
    local TAG="$(git rev-list --tags --max-count=1)"

    if test -n "${TAG}" && test "${HEAD}" = "${TAG}" ; then
        VERSION="$(git describe --tags ${TAG})"
    else
        VERSION="${HEAD}"
    fi

    echo "$VERSION"
}

function gitrelease() {
    local TAG_COMMIT="$(git rev-list --tags --max-count=1)"
    local VERSION="v0.0.0"
    if test -n "${TAG_COMMIT}"; then
        VERSION="$(git describe --tags ${TAG_COMMIT})"
    fi

    echo "$VERSION"
}

"$@"