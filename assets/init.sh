#!/bin/bash

# if [ ! -f /firstrundone ]; then
# 	if [ "$RELAY_HOST" != "" ]; then
# 		echo "relayhost = $RELAY_HOST" >> /etc/postfix/main.cf
# 	fi
# 	if [ "$MASQ_DOMAINS" != "" ]; then
# 		echo "masquerade_domains = $MASQ_DOMAINS" >> /etc/postfix/main.cf
# 	fi
# 	echo "smtp_generic_maps = hash:/etc/postfix/generic" >> /etc/postfix/main.cf
# 	echo "root	no-reply@$MASQ_DOMAINS" >> /etc/postfix/generic
# 	postmap /etc/postfix/generic
# 	echo "done" >> /firstrundone
# fi

service syslog start
service postfix start
service crond start

#remove pid if it exists to fix restart
rm -f /var/run/httpd.pid
apachectl -D FOREGROUND