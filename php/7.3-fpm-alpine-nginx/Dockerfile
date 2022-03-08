FROM voyageapp/php:7.3-fpm-alpine

RUN apk --update add supervisor nginx

COPY bootstrap.sh /root
RUN chmod +x /root/bootstrap.sh

RUN sed -i \
  -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" \
  -e "s/pm.max_children = 5/pm.max_children = 4/g" \
  -e "s/pm.start_servers = 2/pm.start_servers = 3/g" \
  -e "s/pm.min_spare_servers = 1/pm.min_spare_servers = 2/g" \
  -e "s/pm.max_spare_servers = 3/pm.max_spare_servers = 4/g" \
  -e "s/;pm.max_requests = 500/pm.max_requests = 200/g" \
  -e "s/user = www-data/user = nginx/g" \
  -e "s/group = www-data/group = nginx/g" \
  -e "s/;listen.mode = 0660/listen.mode = 0666/g" \
  -e "s/;listen.owner = www-data/listen.owner = nginx/g" \
  -e "s/;listen.group = www-data/listen.group = nginx/g" \
  -e "s/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/g" \
  -e "s/^;clear_env = no$/clear_env = no/" \
  /usr/local/etc/php-fpm.d/www.conf

COPY supervisord.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx && mkdir -p /etc/supervisor/conf.d

EXPOSE 80

ENTRYPOINT ["sh", "/root/bootstrap.sh"]
