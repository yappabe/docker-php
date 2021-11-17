FROM debian:bullseye

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  lsb-release \
  ca-certificates \
  gnupg2 \
  git

RUN apt-key adv --fetch-keys 'https://packages.sury.org/php/apt.gpg' && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN \
  apt-get update && \
  apt-get install -y \
  vim \
  locales \
  php8.1-fpm \
  php8.1-mysql \
  php8.1-gd \
  php8.1-imagick \
  php8.1-dev \
  php8.1-curl \
  php8.1-opcache \
  php8.1-cli \
  php8.1-sqlite \
  php8.1-intl \
  php8.1-tidy \
  php8.1-imap \
  php8.1-pspell \
  php8.1-common \
  php8.1-sybase \
  php8.1-sqlite3 \
  php8.1-bz2 \
  php8.1-common \
  php8.1-apcu \
  php8.1-memcached \
  php8.1-redis \
  php8.1-xml \
  php8.1-shmop \
  php8.1-mbstring \
  php8.1-zip \
  php8.1-bcmath \
  php8.1-soap

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

COPY php.ini    /etc/php/8.1/fpm/conf.d/
COPY php.ini    /etc/php/8.1/cli/conf.d/
COPY www.conf   /etc/php/8.1/fpm/pool.d/
ADD  run.sh /run.sh

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
