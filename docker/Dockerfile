FROM centos:7 AS mediawiki

MAINTAINER vaishali.sarwadnya

# Pre-requisites

RUN yum install -y centos-release-scl wget

RUN yum install -y httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml

# Install MediaWiki tarball

#WORKDIR "/home/centos"
WORKDIR "/opt/rh/httpd24/root/var/www"

RUN wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz 

RUN wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz.sig 

RUN wget https://www.mediawiki.org/keys/keys.txt && gpg --import keys.txt
#RUN gpg --recv-key 9D3BB7B0
#RUN gpg --keyserver pgpkeys.mit.edu --recv-key 9D3BB7B0

RUN gpg --verify mediawiki-1.37.1.tar.gz.sig mediawiki-1.37.1.tar.gz

RUN tar -zxf mediawiki-1.37.1.tar.gz && mv mediawiki-1.37.1 mediawiki && rm -f mediawiki-1.37.1.tar.gz

# Configure
# Webserver (Apache) post-install configuration

RUN sed -i -e 's|^DocumentRoot "/opt/rh/httpd24/root/var/www"|DocumentRoot "/opt/rh/httpd24/root/var/www/mediawiki"|g' -e 's|    DirectoryIndex index.html|    DirectoryIndex index.html index.html.var index.php|g' -e 's|^<Directory "/opt/rh/httpd24/root/var/www">|<Directory "/opt/rh/httpd24/root/var/www/mediawiki">|g' /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf

#RUN chown -R apache:apache /opt/rh/httpd24/root/var/www/mediawiki

# Firewall

#RUN firewall-cmd --permanent --zone=public --add-service=http && firewall-cmd --permanent --zone=public --add-service=https && systemctl restart firewalld

# Security (selinux) - Check for correct context set as system_u:object_r:httpd_sys_content_t:s0

#RUN sudo restorecon -FR /var/www/mediawiki/ && ls -lZ /var/www/

CMD /opt/rh/httpd24/root/usr/sbin/apachectl -DFOREGROUND
