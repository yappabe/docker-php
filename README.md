# Yappa PHP FPM Docker Image

## Usage

Add the following to your docker-compose.yml file:

```YAML
php:
    image: yappabe/php
    expose:
        - 9000:9000
    volumes_from:
        - app
    links:
        - mysql
```

## PHP version

* PHP 5.6 (jessie stable)
* PHP 5.4 (wheezy stable)
* PHP 5.3 (squeeze stable)

