FROM debian:jessie

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  wget \
  vim \
  git \
  locales \
  iptables \
  php5-fpm \
  php5-mysql \
  php5-mcrypt \
  php5-gd \
  php5-memcached \
  php5-memcache \
  php5-curl \
  php-pear \
  php5-apcu \
  php5-cli \
  php5-curl \
  php5-mcrypt \
  php5-sqlite \
  php5-intl \
  php5-tidy \
  php5-imap \
  php5-imagick \
  php5-json \
  php5-redis \
  php5-twig \
  php5-imagick \
  php5-xsl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require hirak/prestissimo && \
    composer global require phpro/grumphp

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

EXPOSE 9000

ENV ENVIRONMENT dev
ENV PHP_FPM_USER www-data
ENV PHP_FPM_PORT 9000
ENV PHP_ERROR_REPORTING "E_ALL \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED"
ENV PATH "/root/.composer/vendor/bin:$PATH"
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY php.ini    /etc/php5/fpm/conf.d/
COPY php.ini    /etc/php5/cli/conf.d/
COPY www.conf   /etc/php5/fpm/pool.d/

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
