FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libxml2-dev libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    libonig-dev libicu-dev curl tar \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        gd mysqli pdo_mysql zip mbstring intl bcmath opcache ftp gettext \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

# Ajustes de PHP para OMP (subidas y ejecución)
RUN echo "upload_max_filesize = 128M\npost_max_size = 128M\nmemory_limit = 256M\nmax_execution_time = 300" > /usr/local/etc/php/conf.d/omp-settings.ini

RUN mkdir -p /var/www/files && chown -R www-data:www-data /var/www/html /var/www/files
WORKDIR /var/www/html
