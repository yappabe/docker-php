FROM debian:jessie

ENV ENVIRONMENT dev

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  wget

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
    echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.org.list && \
    wget -O- http://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  wget \
  vim \
  git \
  locales \
  iptables \
  php7.0-fpm \
  php7.0-mysql \
  # php7.0-mcrypt \
  php7.0-gd \
  # php7.0-memcached \
  php7.0-curl \
  # php-pear \
  # php7.0-apcu \
  php7.0-opcache \
  php7.0-cli \
  php7.0-curl \
  php7.0-sqlite \
  php7.0-intl \
  php7.0-tidy \
  php7.0-imap \
  php7.0-json
  # php7.0-redis \
  # php7.0-twig \
  # php7.0-imagick \
  # php7.0-xsl

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

COPY php.ini    /etc/php7.0/fpm/conf.d/
COPY php.ini    /etc/php7.0/cli/conf.d/
COPY www.conf   /etc/php7.0/fpm/pool.d/

EXPOSE 9000

CMD ["/usr/sbin/php7.0-fpm", "--allow-to-run-as-root", "-c", "/etc/php7.0/fpm", "--nodaemonize"]
