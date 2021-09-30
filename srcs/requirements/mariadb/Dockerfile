FROM alpine:3.14
VOLUME /sys/fs/cgroup
RUN apk add --no-cache openrc mariadb mariadb-client \
  && rm -f /var/cache/apk/* \
	&& mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-status

WORKDIR /tmp/
COPY ./tools/start.sh ./
RUN chmod 755 ./start.sh
EXPOSE 3306

ENTRYPOINT ["./start.sh"]
