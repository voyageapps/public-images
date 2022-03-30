FROM php:7.3-apache

RUN apt-get update

RUN apt-get install -y \
    git \
    zip \
    curl \
    wget \
    sudo \
    unzip \
    ca-certificates \
    libzip-dev \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    nodejs \
    npm \
    libpq-dev \
    libxml2-dev \
    g++

RUN docker-php-ext-install \
    bz2 \
    sockets \
    pcntl \
    intl \
    iconv \
    bcmath \
    opcache \
    calendar \
    mbstring \
    pdo_mysql \
    pdo \
    zip \
    xml \
    pdo_pgsql \
    gd

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN mkdir -p /init.d

ENV APACHE_DOCUMENT_ROOT /app/public

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN echo "Listen 8080" >> /etc/apache2/ports.conf \
      && a2enmod rewrite

WORKDIR /app

RUN chown -R www-data:www-data /app;
RUN find /app/ -type f -exec chmod 644 {} \;
RUN find /app/ -type d -exec chmod 755 {} \;

COPY bootstrap.sh /root

ENTRYPOINT ["sh", "/root/bootstrap.sh"]