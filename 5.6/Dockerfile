FROM debian:jessie

ENV ENVIRONMENT dev

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
    composer global require hirak/prestissimo

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

COPY php.ini    /etc/php5/fpm/conf.d/
COPY php.ini    /etc/php5/cli/conf.d/
COPY www.conf   /etc/php5/fpm/pool.d/

EXPOSE 9000

CMD ["/usr/sbin/php5-fpm", "--allow-to-run-as-root", "-c", "/etc/php5/fpm", "--nodaemonize"]
