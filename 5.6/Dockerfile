FROM debian:bullseye

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  curl \
  lsb-release \
  ca-certificates \
  git \
  gnupg2

RUN apt-key adv --fetch-keys 'https://packages.sury.org/php/apt.gpg' && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  vim \
  locales \
  php5.6-fpm \
  php5.6-mysql \
  php5.6-gd \
  php5.6-imagick \
  php5.6-dev \
  php5.6-curl \
  php5.6-opcache \
  php5.6-cli \
  php5.6-sqlite \
  php5.6-intl \
  php5.6-tidy \
  php5.6-imap \
  php5.6-json \
  php5.6-pspell \
  php5.6-recode \
  php5.6-common \
  php5.6-sybase \
  php5.6-sqlite3 \
  php5.6-bz2 \
  php5.6-mcrypt \
  php5.6-common \
  php5.6-apcu \
  php5.6-memcached \
  php5.6-redis \
  php5.6-xml \
  php5.6-shmop \
  php5.6-mbstring \
  php5.6-zip \
  php5.6-bcmath \
  php5.6-soap

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

COPY php.ini    /etc/php/5.6/fpm/conf.d/
COPY php.ini    /etc/php/5.6/cli/conf.d/
COPY www.conf   /etc/php/5.6/fpm/pool.d/
ADD  run.sh /run.sh

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
