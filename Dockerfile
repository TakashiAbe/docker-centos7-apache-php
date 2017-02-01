FROM takashiabe/centos7-apache
RUN yum clean all && yum -y update

RUN curl -O http://repo.mysql.com/RPM-GPG-KEY-mysql && rpm --import RPM-GPG-KEY-mysql && rm -f RPM-GPG-KEY-mysql
RUN yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm && yum -y install mysql-community-client

RUN curl -O http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && rpm --import RPM-GPG-KEY-EPEL-7 && rm -f RPM-GPG-KEY-EPEL-7
RUN yum -y install epel-release

RUN curl -O http://rpms.remirepo.net/RPM-GPG-KEY-remi && rpm --import RPM-GPG-KEY-remi && rm -f RPM-GPG-KEY-remi
RUN curl -O http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && rpm -Uvh remi-release-7.rpm && rm -f remi-release-7.rpm

RUN yum --enablerepo=epel,remi,remi-php71 -y install php php-cli php-common php-devel php-gd php-json php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-pear php-pecl-apcu php-pecl-imagick php-pecl-redis php-pecl-uuid php-pecl-xdebug php-pecl-yaml php-pecl-zip

RUN yum clean all

RUN sed -i -e'151,151s/None/All/' /etc/httpd/conf/httpd.conf

RUN sed -i -e"s/\;date\.timezone\ \=/date\.timezone\ \= \'Asia\/Tokyo\'/" /etc/php.ini
RUN sed -i -e"s/memory_limit\ \=\ 128M/memory_limit\ \=\ 512M/" /etc/php.ini
RUN sed -i -e"s/post_max_size\ \=\ 8M/post_max_size\ \=\ 50M/" /etc/php.ini
RUN sed -i -e"s/upload_max_filesize\ \=\ 2M/upload_max_filesize\ \=\ 50M/" /etc/php.ini

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

EXPOSE 80
CMD ["/usr/sbin/init"]

