FROM jwilder/dockerize as dockerize

FROM node:17.6-alpine

COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize
