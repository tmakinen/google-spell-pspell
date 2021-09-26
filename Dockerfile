FROM php:7.4-apache-buster

LABEL maintainer="Thomas Bruederli <thomas@roundcube.net>"

RUN set -ex; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    aspell-am \
    aspell-ar \
    aspell-ar \
    aspell-bg \
    aspell-br \
    aspell-ca \
    aspell-cs \
    aspell-cy \
    aspell-da \
    aspell-de \
    aspell-el \
    aspell-en \
    aspell-eo \
    aspell-es \
    aspell-et \
    aspell-eu \
    aspell-fa \
    aspell-fr \
    aspell-ga \
    aspell-he \
    aspell-hr \
    aspell-hu \
    aspell-hy \
    aspell-is \
    aspell-it \
    aspell-ku \
    aspell-lt \
    aspell-lv \
    aspell-nl \
    aspell-pl \
    aspell-pt \
    aspell-ro \
    aspell-ru \
    aspell-sk \
    aspell-sl \
    aspell-sv \
    aspell-tl \
    aspell-uk \
    aspell-uz \
  ;

RUN set -ex; \
  apt-get install -y --no-install-recommends \
    libpspell-dev \
    libonig-dev \
    ; \
  docker-php-ext-install \
    pspell \
    mbstring \
  ;

RUN a2enmod rewrite

COPY *.php .
COPY .htaccess .

CMD ["apache2-foreground"]
