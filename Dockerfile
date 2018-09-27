FROM php:7.2-fpm

RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && pecl install mongodb \
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

# 安装 php zip 扩展

RUN apt-get update && apt-get install -y \
    libzip-dev \
  && pecl install zip-1.15.3 \
  && docker-php-ext-enable zip \
  && rm -rf /var/lib/apt/lists/* && apt-get clean
