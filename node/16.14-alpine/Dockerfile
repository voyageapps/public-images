FROM jwilder/dockerize as dockerize

FROM node:16.14-alpine

COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize
