FROM debian:wheezy

ENV ENVIRONMENT dev

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  wget \
  git \
  iptables \
  php5-fpm \
  php5-mysql \
  php5-mcrypt \
  php5-gd \
  php5-memcached \
  php5-curl \
  php-pear \
  php-apc \
  php5-cli \
  php5-curl \
  php5-mcrypt \
  php5-sqlite \
  php5-intl \
  php5-tidy \
  php5-imap \
  php5-imagick \
  php5-json \
  php5-imagick

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN usermod -u 1000 www-data

COPY php.ini    /etc/php5/fpm/conf.d/
COPY php.ini    /etc/php5/cli/conf.d/
COPY www.conf   /etc/php5/fpm/pool.d/

EXPOSE 9000

CMD ["/usr/sbin/php5-fpm", "--allow-to-run-as-root", "-c", "/etc/php5/fpm", "--nodaemonize"]
