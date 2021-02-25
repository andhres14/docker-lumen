FROM php:8.0-cli-buster

CMD php -S 0.0.0.0:8000 -t /src/public

FROM php:8.0-fpm-buster

# install dependencies
RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-install -j$(nproc) pdo pdo_pgsql
