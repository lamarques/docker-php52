FROM centos:5
LABEL maintainer=" Rogerio Lamarques <rogerio.lamarques@gmail.com>"

COPY assets/init.sh /init.sh
COPY assets/utterramblings.repo /etc/yum.repos.d/utterramblings.repo
COPY assets/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY assets/CentOS-Debuginfo.repo /etc/yum.repos.d/CentOS-Debuginfo.repo
COPY assets/CentOS-fasttrack.repo /etc/yum.repos.d/CentOS-fasttrack.repo
COPY assets/CentOS-Media.repo /etc/yum.repos.d/CentOS-Media.repo
COPY assets/CentOS-Sources.repo /etc/yum.repos.d/CentOS-Sources.repo
COPY assets/CentOS-Vault.repo /etc/yum.repos.d/CentOS-Vault.repo
COPY assets/libselinux.repo /etc/yum.repos.d/libselinux.repo

RUN rpm --import http://vault.centos.org/RPM-GPG-KEY-CentOS-5 && \
	yum clean all && yum update && \
	yum install -y epel-release && \
	yum upgrade -y && \
	yum install -y httpd mod_ssl openssl vixie-cron syslog \
	php php-apc php-cli php-common php-gd php-mbstring \
	php-mcrypt php-mhash php-mysql php-odbc php-pdo \
	php-pear php-pear-DB php-soap php-xml php-xmlrpc \
	php-bcmath php-imap \
	postfix && \
	yum clean all && \
	mkdir /etc/httpd/vhost.d && \
	echo "Include vhost.d/*.conf" >> /etc/httpd/conf/httpd.conf && \
	chmod +x /init.sh

EXPOSE 80 443

CMD ["/init.sh"]