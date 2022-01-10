FROM centos:7

RUN yum install centos-release-scl wget

RUN yum install httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml

RUN cd /home/centos

RUN wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz

# Download the GPG signature for the tarball and verify the tarball's integrity:
RUN wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.1.tar.gz.sig

RUN gpg --verify mediawiki-1.37.1.tar.gz.sig mediawiki-1.37.1.tar.gz

RUN cd /var/www

RUN tar -zxf /home/centos/mediawiki-1.37.1.tar.gz

RUN ln -s mediawiki-1.37.1/ mediawiki

