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

RUN rpm --import http://vault.centos.org/RPM-GPG-KEY-CentOS-5
RUN yum clean all 
RUN yes | yum update -y
RUN yum install -y epel-release
RUN yes | yum upgrade
RUN yum install -y yum-utils
RUN yum install -y httpd 
# RUN yum install -y mod_ssl 
# RUN yum install -y openssl 
RUN yum install -y vixie-cron 
RUN yum install -y syslog 
RUN yum install -y php 
RUN yum install -y php-apc 
RUN yum install -y php-cli 
RUN yum install -y php-common 
RUN yum install -y php-gd 
RUN yum install -y php-mbstring
RUN yum install -y php-mcrypt 
# RUN yum install -y php-mhash 
RUN yum install -y php-mysql 
RUN yum install -y php-odbc 
RUN yum install -y php-pdo
RUN yum install -y php-pear 
RUN yum install -y php-pear-DB 
RUN yum install -y php-soap 
RUN yum install -y php-xml 
RUN yum install -y php-xmlrpc
# RUN yum install -y php-bcmath 
RUN yum install -y php-imap
RUN yum install -y postfix
RUN mkdir /etc/httpd/vhost.d && \
	echo "Include vhost.d/*.conf" >> /etc/httpd/conf/httpd.conf && \
	chmod +x /init.sh

EXPOSE 80 443

CMD ["/init.sh"]