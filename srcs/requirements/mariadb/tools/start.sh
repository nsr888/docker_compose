#!/usr/bin/env bash
# https://transang.me/best-practice-to-make-a-shell-script/
set -Eeuo pipefail
if [[ ! -f "/run/mysqld" ]]
then
	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
	sed -i "s|.*skip-networking.*||g" /etc/my.cnf.d/mariadb-server.cnf
	sed -i "s|\[mysqld\]|\[mysqld\]\nskip-networking = false\nbind_address = 0.0.0.0\nport = 3306|g" /etc/my.cnf.d/mariadb-server.cnf

	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	/etc/init.d/mariadb setup
	rc-update add mariadb default
	rc-service mariadb start

	apk add expect

	SECURE_MYSQL=$(expect -c "
	set timeout 3
	spawn mysql_secure_installation
	expect \"Enter current password for root (enter for none): \"
	send \"n\r\"
	expect \"Switch to unix_socket authentication \[Y/n\] \"
	send \"n\r\"
	expect \"Change the root password? \[Y/n\] \"
	send \"y\r\"
	expect \"New password: \"
	send \"$MYSQL_ROOT_PASSWORD\r\"
	expect \"Re-enter new password: \"
	send \"ft\r\"
	expect \"Remove anonymous users? \[Y/n\] \"
	send \"y\r\"
	expect \"Disallow root login remotely? \[Y/n\] \"
	send \"y\r\"
	expect \"Remove test database and access to it? \[Y/n\] \"
	send \"y\r\"
	expect \"Reload privilege tables now? \[Y/n\] \"
	send \"y\r\"
	expect eof
	")

	echo "${SECURE_MYSQL}"
	apk del expect
	mysql -u root -e "CREATE USER '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
	GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER_NAME'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
	FLUSH PRIVILEGES;"
	rc-service mariadb stop
fi
exec "$@"
