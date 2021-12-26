#
# Wordmove Dockerfile
#

# Pull base image.
FROM ruby:2.7-slim

LABEL maintainers.1="Simon Bland <simon.bland@bluewin.ch>"
LABEL maintainers.2="Alessandro Fazzi <alessandro.fazzi@welaika.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV WORDMOVE_WORKDIR /html

COPY mount-ssh.sh /bin/mount-ssh.sh
RUN chmod +x /bin/mount-ssh.sh

RUN apt-get update && apt-get install -y --no-install-recommends \
  openssh-server \
  curl \
  rsync \
  mariadb-client \
  lftp \
  lsb-release \
  apt-transport-https \
  ca-certificates \
  wget \
  git \
  ruby-dev \
  build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
  && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
  && apt update && apt -y install php7.4-cli php7.4-mysql \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


RUN gem install wordmove --version 5.2.2

RUN curl -o /usr/local/bin/wp -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp

WORKDIR ${WORDMOVE_WORKDIR}

ENTRYPOINT ["/bin/mount-ssh.sh"]

CMD ["/bin/bash", "-l"]
