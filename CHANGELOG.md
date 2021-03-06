# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
## [v0.4.4] - 2020-10-25
### Changed
- use kacl v0.3.1 from github.com/helstern/kacl

## [v0.4.3] - 2020-04-05
### Removed
- docker is no longer part of the container, instead the user and group have been normalized to match the values from ubuntu


## [v0.4.2] - 2020-04-05
### Added
- curl and jq, required by tuol are now part of the container


## [v0.4.1] - 2020-01-26
### Fixed
- remove group `ping` and use group id `999` for docker


## [v0.4.0] - 2020-01-26
### Added
- add `docker` cli to docker image

## [v0.3.0] - 2020-01-26
### Added
- add `coreutils` to docker image

## [v0.2.0] - 2020-01-26
### Added
- add `bash` to docker images
- release and publish targets

### Changed
- better readme
- use fork `https://github.com/helstern/kacl` instead of original

### Fixes
- problems with parsing version numbers


## [v0.1.1] - 2019-10-12
### Added
- Add the commands `tagit` and `bumpit` to manage the version tag
- Add command `kacl` to manage the CHANGELOG
- Add simple release command `release-simple.sh` to manage a source code release

### Changed
- Fixed release script

## [v0.1.0] - 2019-10-12
### Added
- initial release

[Unreleased]: https://github.com/helstern/version-tools/compare/v0.4.4...HEAD
[v0.4.4]: https://github.com/helstern/version-tools/compare/v0.4.3...v0.4.4
[v0.4.3]: https://github.com/helstern/version-tools/compare/v0.4.2...v0.4.3
[v0.4.2]: https://github.com/helstern/version-tools/compare/v0.4.1...v0.4.2
[v0.4.1]: https://github.com/helstern/version-tools/compare/v0.4.0...v0.4.1
[v0.4.0]: https://github.com/helstern/version-tools/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/helstern/version-tools/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/helstern/version-tools/compare/v0.1.1...v0.2.0
[v0.1.1]: https://github.com/helstern/version-tools/compare/v0.1.0...v0.1.1
[v0.1.0]: https://github.com/helstern/version-tools/compare/d036db0...v0.1.0
