FROM alpine:3.14

# php-fpm
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk --update add \
        php7 \
        php7-bcmath \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
		php7-mysqli \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-simplexml \
        php7-session \
        php7-soap \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
		curl \
		mariadb-client \
    && rm -rf /var/cache/apk/*

COPY conf/php.ini /etc/php7/conf.d/50-setting.ini
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf

# Add WP CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# wordpress
WORKDIR /app
RUN \
	wget --no-check-certificate https://wordpress.org/latest.tar.gz && \
	tar xf latest.tar.gz --strip-components=1 && \
	rm latest.tar.gz

EXPOSE 9000

COPY tools/setup.sh setup.sh
RUN chmod +x setup.sh

ENTRYPOINT ["/app/setup.sh"]
