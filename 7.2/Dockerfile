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
  php7.2-fpm \
  php7.2-mysql \
  php7.2-gd \
  php7.2-imagick \
  php7.2-dev \
  php7.2-curl \
  php7.2-opcache \
  php7.2-cli \
  php7.2-sqlite \
  php7.2-intl \
  php7.2-tidy \
  php7.2-imap \
  php7.2-json \
  php7.2-pspell \
  php7.2-recode \
  php7.2-common \
  php7.2-sybase \
  php7.2-sqlite3 \
  php7.2-bz2 \
  php7.2-common \
  php7.2-apcu-bc \
  php7.2-memcached \
  php7.2-redis \
  php7.2-xml \
  php7.2-shmop \
  php7.2-mbstring \
  php7.2-zip \
  php7.2-bcmath \
  php7.2-soap

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

COPY php.ini    /etc/php/7.2/fpm/conf.d/
COPY php.ini    /etc/php/7.2/cli/conf.d/
COPY www.conf   /etc/php/7.2/fpm/pool.d/
ADD  run.sh /run.sh

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
