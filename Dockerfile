FROM php:8.5.1-apache

RUN set -eux ; \
    apt-get update ; \
    apt-get -y install --no-install-recommends \
        aspell-\* \
        libenchant-2-dev \
        libonig-dev \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux ; \
    docker-php-ext-install \
        enchant \
        mbstring

RUN set -eux ; \
    a2enmod rewrite

COPY --chmod=0644 *.php .htaccess .

CMD ["apache2-foreground"]
