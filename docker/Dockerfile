FROM centos:7 AS mediawiki

# Pre-requisites

RUN yum install centos-release-scl wget

RUN yum install httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml

# Install MediaWiki tarball

WORKDIR "/home/centos"

RUN wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz && wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz.sig && gpg --verify mediawiki-1.37.1.tar.gz.sig mediawiki-1.37.1.tar.gz 

RUN cd /var/www && tar -zxf /home/centos/mediawiki-1.37.1.tar.gz && mv mediawiki-1.37.1 mediawiki && rm -f mediawiki-1.37.1.tar.gz

RUN chown -R apache:apache /var/www/mediawiki

# Configure
# Webserver (Apache) post-install configuration

RUN sed -i -e 's|^DocumentRoot "/var/www"|DocumentRoot "/var/www/mediawiki"|' -e 's|    DirectoryIndex index.html|    DirectoryIndex index.html index.html.var index.php|' -e 's|^<Directory "/var/www">|<Directory "/var/www/mediawiki">|' /etc/httpd/conf/httpd.conf

RUN service httpd restart

# Firewall

RUN firewall-cmd --permanent --zone=public --add-service=http && firewall-cmd --permanent --zone=public --add-service=https && systemctl restart firewalld

# Security (selinux) - Check for correct context set as system_u:object_r:httpd_sys_content_t:s0

RUN sudo restorecon -FR /var/www/mediawiki/ && ls -lZ /var/www/

CMD /usr/sbin/apachectl -DFOREGROUND



