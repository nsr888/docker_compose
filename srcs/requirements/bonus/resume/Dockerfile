FROM alpine:3.14
ENV VER 0.72.0
RUN \
	wget https://github.com/gohugoio/hugo/releases/download/v${VER}/hugo_${VER}_Linux-64bit.tar.gz && \
    mkdir hugo && tar -xf hugo_${VER}_Linux-64bit.tar.gz --directory hugo

FROM alpine:3.14
RUN apk update && apk add --no-cache git curl unzip
ENV BIND_IP="0.0.0.0"
ENV HUGO_BASEURL=http://ksinistr.42.fr
ENV HUGO_ENV=production
COPY --from=0 /hugo/hugo /usr/bin

WORKDIR /app
COPY ./site /app

RUN \
    mkdir -p /app/themes && \
    curl -sSL https://github.com/austingebauer/devise/archive/refs/heads/master.zip -o /app/themes/master.zip && \
    unzip /app/themes/master.zip -d /app/themes/ && \
    mv /app/themes/devise-master /app/themes/devise && \
    rm /app/themes/master.zip

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 1313

ONBUILD RUN hugo -d /app/

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
