FROM debian:jessie

RUN \
  apt-get update && \
  apt-get install -y \
  curl \
  wget \
  apt-transport-https \
  lsb-release \
  ca-certificates \
  git

RUN wget -O- https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list


RUN \
  apt-get update && \
  apt-get install -y \
  vim \
  locales \
  php7.1-fpm \
  php7.1-mysql \
  php7.1-gd \
  php7.1-imagick \
  php7.1-dev \
  php7.1-curl \
  php7.1-opcache \
  php7.1-cli \
  php7.1-sqlite \
  php7.1-intl \
  php7.1-tidy \
  php7.1-imap \
  php7.1-json \
  php7.1-pspell \
  php7.1-recode \
  php7.1-common \
  php7.1-sybase \
  php7.1-sqlite3 \
  php7.1-bz2 \
  php7.1-mcrypt \
  php7.1-common \
  php7.1-apcu-bc \
  php7.1-memcached \
  php7.1-redis \
  php7.1-xml \
  php7.1-shmop \
  php7.1-mbstring \
  php7.1-zip \
  php7.1-bcmath \
  php7.1-soap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require hirak/prestissimo && \
    composer global require phpro/grumphp && \
    wget http://robo.li/robo.phar && \
    chmod +x robo.phar && mv robo.phar /usr/bin/robo

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

COPY php.ini    /etc/php/7.1/fpm/conf.d/
COPY php.ini    /etc/php/7.1/cli/conf.d/
COPY www.conf   /etc/php/7.1/fpm/pool.d/
ADD  run.sh /run.sh

COPY run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
