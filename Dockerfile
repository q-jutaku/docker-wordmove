#
# Wordmove Dockerfile
#

# Pull base image.
FROM ruby:2.6-slim

LABEL maintainers.1="Simon Bland <simon.bland@bluewin.ch>"
LABEL maintainers.2="Alessandro Fazzi <alessandro.fazzi@welaika.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV WORDMOVE_WORKDIR /html

RUN apt-get update && apt-get install -y \
  openssh-server \
  curl \
  rsync \
  php \
  php-mysql \
  mysql-client

RUN gem install wordmove
RUN curl -o /usr/local/bin/wp -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp

WORKDIR ${WORDMOVE_WORKDIR}
CMD ["/bin/bash"]
