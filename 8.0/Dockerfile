FROM debian:buster

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  wget \
  apt-transport-https \
  lsb-release \
  ca-certificates \
  gnupg2 \
  git

RUN wget -O- https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN \
  apt-get update && \
  apt-get install -y \
  vim \
  locales \
  php8.0-fpm \
  php8.0-mysql \
  php8.0-gd \
  php8.0-imagick \
  php8.0-dev \
  php8.0-curl \
  php8.0-opcache \
  php8.0-cli \
  php8.0-sqlite \
  php8.0-intl \
  php8.0-tidy \
  php8.0-imap \
  php8.0-pspell \
  php8.0-common \
  php8.0-sybase \
  php8.0-sqlite3 \
  php8.0-bz2 \
  php8.0-common \
  php8.0-apcu-bc \
  php8.0-memcached \
  php8.0-redis \
  php8.0-xml \
  php8.0-shmop \
  php8.0-mbstring \
  php8.0-zip \
  php8.0-bcmath \
  php8.0-soap

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

COPY php.ini    /etc/php/8.0/fpm/conf.d/
COPY php.ini    /etc/php/8.0/cli/conf.d/
COPY www.conf   /etc/php/8.0/fpm/pool.d/
ADD  run.sh /run.sh

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
