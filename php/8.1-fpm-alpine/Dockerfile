FROM jwilder/dockerize as dockerize

FROM php:8.1-fpm-alpine

COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize

COPY bootstrap.sh /root
RUN chmod +x /root/bootstrap.sh

RUN mkdir -p /init.d

RUN apk add -Uuv \
  curl-dev \
  libtool \
  libxml2-dev \
  postgresql-dev \
  sqlite-dev \
  curl \
  git \
  mysql-client \
  postgresql-libs \
  libintl \
  icu \
  icu-dev \
  libzip-dev \
  libpng-dev \
  nodejs \
  npm \
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
  xml \
  zip \
  intl \
  && curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

ENTRYPOINT ["sh", "/root/bootstrap.sh"]
