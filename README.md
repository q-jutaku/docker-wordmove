Docker image to run [Wordmove](https://wptools.it/wordmove/).

[![Docker Build Status](https://img.shields.io/docker/automated/welaika/wordmove.svg)](https://hub.docker.com/r/welaika/wordmove/)
[![Docker Build Status](https://img.shields.io/docker/build/welaika/wordmove.svg)](https://hub.docker.com/r/welaika/wordmove/)
[![Slack channel](https://img.shields.io/badge/Slack-WP--Hub-blue.svg)](https://wphub-auto-invitation.herokuapp.com/)

## What's inside

* openssh-server
* curl
* rsync
* mysql-client
* php
* wordmove
* wp-cli

### TAG specific

We ship 3 flavours of this container:

* php7
* alpine
* php5 (deprecated and unmaintained)

`php7` and `php5` tags are based upon Debian stretch
`alpine` tag is - really - based upon Alpine Linux 3.9

`php5` also ships with:

* sshpass
* ENV RUBYOPT="-KU -E utf-8:utf-8" (Fix for some mysql sync issues when using old
  db adapter)

## Notable changes

Since the first version of this container, which is now tagged as `php5`, we got some
potentially breaking changes.

* There is no `wordmove` user anymore. Now Wordmove supports to be invoked from root user,
  so we've removed some complexity from the container build.
  See https://github.com/welaika/wordmove/releases/tag/v2.5.1
* `sshpass` has been removed. It's use is discouraged and deprecated by Wordmove, so it
  is in this container. We warmly recommend to use safer approaches.
* `RUBYOPT` is no more exported. It was solving a problem disappeared since using wp-cli
  by default, so we've removed complexity from the build.

## How to use

### To run this image

`docker run -it --rm -v ~/.ssh:/root/.ssh:ro welaika/wordmove`

This starts a shell, with `wordmove` available on the command-line.

### ENV

A `WORDMOVE_WORKDIR` environment variable is exported inside the container; since this is the
container's `WORKDIR` path, you could use `<%= ENV['WORDMOVE_WORKDIR'] %>` inside a `movefile.yml`
in order to solidly know the `pwd`.

For example running

```
docker run --rm -v ~/.ssh:/root/.ssh:ro -v ~/dev/wp-site/:/html welaika/wordmove wordmove pull -d
```

you could configure `movefile.yml` like

```yaml
local:
  wordpress_path: "<%= ENV['WORDMOVE_WORKDIR'] %>"
  # [...]
```

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
  directory as the WordPress directory. See https://github.com/welaika/wordmove/issues/506

## TODO

- [x] Release the Alpine version of this image (see: https://github.com/welaika/docker-wordmove/issues/3)
- [x] Configure Webhooks to build this image on Docker Hub when a new version of
  the `wordmove` gem is available

🎉

## Credits 🙏🏻

Based on [mfuezesi/docker-wordmove](
https://github.com/mfuezesi/docker-wordmove), with WP-CLI support added.

## Maintainers

@simonbland and @welaika dev team 😎
