Docker image to run [Wordmove](https://wptools.it/wordmove/).

[![Docker Build Status](https://img.shields.io/docker/automated/welaika/wordmove.svg)](https://hub.docker.com/r/welaika/wordmove/)
[![Slack channel](https://img.shields.io/badge/Slack-WP--Hub-blue.svg)](https://wphub-auto-invitation.herokuapp.com/)

## What's inside

* Debian "stretch"
* openssh-server
* curl
* rsync
* wordmove
* mysql-client-5.5
* php7.0
* wp-cli

## How to use

### To run this image

`docker run -it --rm -v ~/.ssh:/root/.ssh:ro welaika/wordmove`

This starts a shell, with `wordmove` available on the command-line.

### To run this image in a full Docker-based WordPress environment

See [Wordpress development made easy using Docker](
https://medium.com/cluetip/wordpress-development-made-easy-440b564185f2)

This tutorial explains how to set up a WordPress environment, using Docker
Compose, with the following four interconnected containers:

* database
* wordpress
* phpmyadmin
* wordmove

Don't forget to replace `image: mfuezesi/wordmove` with `image:
welaika/wordmove` to get the latest version of Wordmove.

## Known limitations

* If `sql_adapter` is set to `wpcli`, then the movefile must be in the same
  directory as the WordPress directory

## TODO

- [ ] Release the Alpine version of this image (see: https://github.com/welaika/docker-wordmove/issues/3)
- [x] Configure Webhooks to build this image on Docker Hub when a new version of
  the `wordmove` gem is available

## Credits 🙏🏻

Based on [mfuezesi/docker-wordmove](
https://github.com/mfuezesi/docker-wordmove), with WP-CLI support added.

## Maintainers

@simonbland and @welaika dev team 😎
