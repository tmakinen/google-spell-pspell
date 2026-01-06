FROM php:8.3.29-apache

RUN set -eux ; \
    apt-get update ; \
    apt-get -y install --no-install-recommends \
        aspell-\* \
        libonig-dev \
        libpspell-dev \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux ; \
    docker-php-ext-install \
        mbstring \
        pspell

RUN set -eux ; \
    a2enmod rewrite

COPY --chmod=0644 *.php .htaccess .

CMD ["apache2-foreground"]
