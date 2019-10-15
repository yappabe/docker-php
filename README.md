![Docker pulls](https://img.shields.io/docker/pulls/yappabe/php.svg?style=flat)
# Yappa PHP FPM Docker Image

## Usage

Add the following to your docker-compose.yml file:

```YAML
php:
    image: yappabe/php
    volumes_from:
        - app
    links:
        - mysql
```

## PHP version

To use a specific PHP version, append the version number to the image name.

Eg: `image: yappabe/php:5.6`

The following PHP versions are available:

* PHP 7.4 (buster stable)
* PHP 7.3 (jessie stable)
* PHP 7.2 (jessie stable)
* PHP 7.1 (jessie stable)
* PHP 7.0 (jessie stable)
* PHP 5.6 (jessie stable)
* PHP 5.4 (wheezy stable)
* PHP 5.3 (squeeze stable)

## Configurations

You can configure the following environment vars, these are the defaults.

```
ENV ENVIRONMENT dev
ENV PHP_FPM_USER www-data
ENV PHP_FPM_PORT 9000
ENV PHP_ERROR_REPORTING "E_ALL \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED"
```

## Development and permissions

Run php-fpm process as `root` user to avoid cli and fpm permission issues.
Never ever use this in production!

```
ENV PHP_FPM_USER root
```


