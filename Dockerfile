FROM php:8.2-apache

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip

WORKDIR /app
COPY . /app

RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000
