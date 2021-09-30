FROM alpine:3.14
RUN apk add --no-cache nginx openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key \
		-out localhost.crt  -subj "/C=RU/CN=ksinistr-CA" \
	&& cp localhost.crt /etc/ssl/certs/localhost.crt \
	&& cp localhost.key /etc/ssl/private/localhost.key
COPY conf/website.conf /etc/nginx/http.d/
EXPOSE 443
