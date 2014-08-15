#!/bin/bash
if [[ -f /usr/bin/mysqlshow && -f /usr/bin/mysql ]]
then
	mysqlshow="$(mysqlshow -uroot -pblank 2>&1)"
	if [[ $mysqlshow != *Access?denied* ]]
	then
		echo "Update mysql root password"
		mysql -uroot -pblank -e " UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'; FLUSH PRIVILEGES; "
	fi
fi
