FROM php:7.2-fpm

RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && pecl install mongodb-1.4.3 \
    && docker-php-ext-enable redis xdebug mongodb

# 安装 composer 相关
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    wget \
  && rm -rf /var/lib/apt/lists/* && apt-get clean \
  && wget -O /usr/local/bin/composer https://getcomposer.org/download/1.6.2/composer.phar \
  && chmod +x /usr/local/bin/composer
