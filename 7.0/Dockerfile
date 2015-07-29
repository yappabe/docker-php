FROM debian:jessie

ENV ENVIRONMENT dev
ENV PHP_INI_DIR /usr/local/etc/php
ENV PHP_VERSION 7.0.0beta2

RUN mkdir -p $PHP_INI_DIR/conf.d
COPY php.ini "{$PHP_INI_DIR}/conf.d"

RUN apt-get update && \
    apt-get install -y ca-certificates \
    curl \
    libpcre3 \
    librecode0 \
    libsqlite3-0 \
    libxml2 \
    autoconf \
    file \
    g++ \
    gcc \
    libc-dev \
    make \
    pkg-config \
    re2c \
    git-core \
    bison \
    libbz2-dev \
    libmcrypt-dev \
    libltdl-dev \
    libpng-dev \
    libpspell-dev \
    libcurl4-openssl-dev \
    libpcre3-dev \
    libreadline6-dev \
    librecode-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    xz-utils \
    --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

RUN set -x \
  && apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
  && curl -SL "https://downloads.php.net/~ab/php-$PHP_VERSION.tar.xz" -o php.tar.xz \
  && mkdir -p /usr/src/php \
  && tar -xof php.tar.xz -C /usr/src/php --strip-components=1 \
  && rm php.tar.xz* \
  && cd /usr/src/php \
  && ./configure \
    --with-config-file-path="$PHP_INI_DIR" \
    --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
    --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data \
    --disable-cgi \
    --with-openssl \
    --with-pcre \
    --with-readline \
    --with-recode \
    --with-zlib \
    --enable-bcmath \
    --with-bz2 \
    --enable-calendar \
    --enable-exif \
    --enable-dba \
    --enable-ftp \
    --with-gettext \
    --with-gd \
    --enable-mbstring \
    --with-mcrypt \
    --with-mhash \
    --enable-mysqlnd \
    --with-mysql=mysqlnd \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --enable-pcntl \
    --with-pspell \
    --enable-shmop \
    --enable-soap \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --with-zlib \
    --enable-zip \
    --with-readline \
    --with-curl \
  && make -j"$(nproc)" \
  && make install \
  && { find /usr/local/bin /usr/local/sbin -type f -executable -exec strip --strip-all '{}' + || true; } \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps \
  && make clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN usermod -u 1000 www-data

COPY php.ini    $PHP_INI_DIR/fpm/conf.d/
COPY php.ini    $PHP_INI_DIR/cli/conf.d/
COPY www.conf   /usr/local/etc/php-fpm.conf

EXPOSE 9000

CMD ["php-fpm", "--allow-to-run-as-root"]
