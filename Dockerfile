FROM php:8.1.2-fpm

# Installation des dépendances
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    libcurl4-openssl-dev \
    netcat \
    pkg-config \
    libssl-dev \
    && docker-php-ext-install pdo_mysql curl mbstring exif pcntl bcmath gd

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . /var/www/html

RUN composer install --no-interaction

EXPOSE 9000
