mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir_path := $(shell dirname $(mkfile_path))

QUIET_FLAG = $(or ${VERBOSE}, 0)
QUIET = $(if $(filter 1,${VERBOSE}),,@)

DOCKER_IMAGE := helstern/version-tools

CMD_SOURCES := $(wildcard src/cmd/*.sh)
CMD_TARGETS := $(CMD_SOURCES:src/cmd/%.sh=target/cmd/%.sh)

VERSION=$(shell ./bin/versions.sh gitversion)

target/cmd/%.sh: src/cmd/%.sh
	${QUIET} install -D --mode 0755 $< $@

build: $(CMD_TARGETS)
	${QUIET} docker build --build-arg VERSION=${VERSION} -t ${DOCKER_IMAGE}:latest --file src/docker/Dockerfile .

release:
	${QUIET} docker tag ${DOCKER_IMAGE}:latest ${DOCKER_IMAGE}:${VERSION}
	${QUIET} docker push ${DOCKER_IMAGE}:latest
	${QUIET} docker push ${DOCKER_IMAGE}:${VERSION}

run: mkfile_dir := $(shell basename ${mkfile_dir_path})
run:
	${QUIET} docker run --user 1000  \
		--volume ~/.gitconfig:/home/versioneer/.gitconfig \
		--volume ${mkfile_dir_path}:/home/versioneer/${mkfile_dir} \
		--workdir /home/versioneer/${mkfile_dir} \
		-it ${DOCKER_IMAGE} \
		/bin/sh