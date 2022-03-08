FROM voyageapp/php:7.4-fpm-alpine

RUN apk --update add supervisor nginx

COPY bootstrap.sh /root
RUN chmod +x /root/bootstrap.sh

RUN mkdir -p /run/nginx && mkdir -p /etc/supervisor/conf.d

EXPOSE 80

ENTRYPOINT ["sh", "/root/bootstrap.sh"]
