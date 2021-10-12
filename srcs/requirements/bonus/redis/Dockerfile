FROM alpine:3.14

RUN apk add --no-cache tini && \
    apk add --no-cache redis 

EXPOSE 6379

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/bin/redis-server", "--protected-mode", "no","--port", "6379"]
