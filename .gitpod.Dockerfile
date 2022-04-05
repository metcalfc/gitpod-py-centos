FROM centos:7

RUN /sbin/groupadd -g 33333 gitpod && \
    /sbin/useradd -d /home/gitpod -m -g gitpod -u 33333 gitpod
RUN yum update -y && yum install -y sudo git python3 python3-pip
