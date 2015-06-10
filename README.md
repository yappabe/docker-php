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
