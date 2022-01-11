FROM centos:7

MAINTAINER vaishali.sarwadnya

RUN yum install -y mariadb-server mariadb && yum clean all

CMD systemctl start mariadb

CMD mysql_secure_installation

ADD .config.sql /docker-entrypoint-initdb/config.sql

ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE = mediawiki_db

EXPOSE 3306

RUN mysql -u root -p < /docker-entrypoint-initdb/config.sql
#$MYSQL_ROOT_PASSWORD < /docker-entrypoint-initdb/config.sql

