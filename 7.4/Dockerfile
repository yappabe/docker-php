FROM debian:bullseye

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  lsb-release \
  ca-certificates \
  git \
  gnupg2

RUN apt-key adv --fetch-keys 'https://packages.sury.org/php/apt.gpg' && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN \
  apt-get update && \
  apt-get install -y \
  vim \
  locales \
  php7.4-fpm \
  php7.4-mysql \
  php7.4-gd \
  php7.4-imagick \
  php7.4-dev \
  php7.4-curl \
  php7.4-opcache \
  php7.4-cli \
  php7.4-sqlite \
  php7.4-intl \
  php7.4-tidy \
  php7.4-imap \
  php7.4-json \
  php7.4-pspell \
  php7.4-common \
  php7.4-sybase \
  php7.4-sqlite3 \
  php7.4-bz2 \
  php7.4-common \
  php7.4-apcu-bc \
  php7.4-memcached \
  php7.4-redis \
  php7.4-xml \
  php7.4-shmop \
  php7.4-mbstring \
  php7.4-zip \
  php7.4-bcmath \
  php7.4-soap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN echo 'de_DE ISO-8859-1\n\
de_DE.UTF-8 UTF-8\n\
de_DE@euro ISO-8859-15\n\
en_GB ISO-8859-1\n\
en_GB.ISO-8859-15 ISO-8859-15\n\
en_US ISO-8859-1\n\
en_US.ISO-8859-15 ISO-8859-15\n\
en_US.UTF-8 UTF-8\n\
fr_FR ISO-8859-1\n\
fr_FR.UTF-8 UTF-8\n\
fr_FR@euro ISO-8859-15\n\
nl_BE ISO-8859-1\n\
nl_BE.UTF-8 UTF-8\n\
nl_BE@euro ISO-8859-15\n\
nl_NL ISO-8859-1\n\
nl_NL.UTF-8 UTF-8\n\
nl_NL@euro ISO-8859-15\n'\
>> /etc/locale.gen &&  \
usr/sbin/locale-gen

RUN usermod -u 1000 www-data
RUN mkdir "/run/php"

ENV ENVIRONMENT dev
ENV PHP_FPM_USER www-data
ENV PHP_FPM_PORT 9000
ENV PHP_ERROR_REPORTING "E_ALL \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED"
ENV PATH "/root/.composer/vendor/bin:$PATH"
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY php.ini    /etc/php/7.4/fpm/conf.d/
COPY php.ini    /etc/php/7.4/cli/conf.d/
COPY www.conf   /etc/php/7.4/fpm/pool.d/
ADD  run.sh /run.sh

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
