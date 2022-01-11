#!/usr/bin/sh

# Uncomment to use the code as Jenkinsfile for CICD

##!groovy
#def create_docker_image() {

cat .dhpwd | docker login --username vvs995 --password-stdin
cd docker
echo "========Creating docker images========"
docker build --tag mediawiki:1.37 - < Dockerfile
cd db_docker
docker build --tag mariadb --build-arg MYSQL_ROOT_PASSWORD=P@ssword@123# .
#}

