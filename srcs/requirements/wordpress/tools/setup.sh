#!/usr/bin/env bash
# https://transang.me/best-practice-to-make-a-shell-script/
set -Eeuo pipefail
if [[ ! -f "/app/wp-config.php" ]]
then
	wp config create \
		--dbname=wordpress \
		--dbuser=$MYSQL_USER_NAME \
		--dbpass=$MYSQL_USER_PASSWORD \
		--dbhost=mariadb \
		--locale=ru_RU \
		--allow-root
	wp db create --allow-root
	wp core install \
		--url=$DOMAIN_NAME \
		--title=Your_Blog_Title \
		--admin_user=$WORDPRESS_ADMIN_NAME \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
		--admin_email=$WORDPRESS_ADMIN_EMAIL \
		--allow-root
	wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL \
		--role=author \
		--user_pass=$WORDPRESS_USER_PASSWORD \
		--allow-root
fi
exec "$@"
