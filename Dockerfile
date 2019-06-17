FROM debian:9.2

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    debconf-utils && \
    echo mariadb-server mysql-server/root_password password vulnerables | debconf-set-selections && \
    echo mariadb-server mysql-server/root_password_again password vulnerables | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    mariadb-server \
    php \
    php-mysql \
    php-pgsql \
    php-pear \
    php-gd \
    && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*
