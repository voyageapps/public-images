FROM php:7.4-fpm-alpine3.10

ENV DOCKERIZE_VERSION v0.6.1

COPY bootstrap.sh /root
RUN chmod +x /root/bootstrap.sh

RUN mkdir -p /init.d

RUN apk add --no-cache --virtual .build-deps \
  $PHPIZE_DEPS \
  oniguruma-dev \
  curl-dev \
  imagemagick-dev \
  libtool \
  libxml2-dev \
  postgresql-dev \
  sqlite-dev \
  && apk add --no-cache \
  curl \
  git \
  imagemagick \
  mysql-client \
  postgresql-libs \
  libintl \
  icu \
  icu-dev \
  libzip-dev \
  libpng-dev \
  nodejs \
  nodejs-npm \
  && pecl install imagick \
  && docker-php-ext-enable imagick \
  && docker-php-ext-install \
  gd \
  sockets \
  bcmath \
  curl \
  iconv \
  pdo \
  pdo_mysql \
  pdo_pgsql \
  pdo_sqlite \
  pcntl \
  tokenizer \
  xml \
  zip \
  intl \
  && curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
  && apk del -f .build-deps \
  && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENTRYPOINT ["sh", "/root/bootstrap.sh"]
