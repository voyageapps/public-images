#!/bin/sh

cat >/usr/local/etc/php/conf.d/docker-env.ini <<EOL
file_uploads=On
memory_limit=${PHP_MEMORY_LIMIT:-256M}
upload_max_filesize=${UPLOAD_MAX_FILESIZE:-1G}
post_max_size=${POST_MAX_SIZE:-1G}
max_execution_time=${MAX_EXECUTION_TIME:-30}
EOL

for file in /init.d/*; do
  [ -f "$file" ] && [ -x "$file" ] && "$file"
done

php-fpm
