FROM centos:7

RUN yum update -y && yum install -y sudo git python3 python3-pip
