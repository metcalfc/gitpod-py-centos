FROM centos:7

RUN /sbin/groupadd -g 33333 gitpod && \
    /sbin/useradd -d /home/gitpod -m -g gitpod -u 33333 gitpod

RUN yum update -y && yum install -y sudo git python3 python3-pip \
    zlib zlib-devel bzip2-devel openssl-devel sqlite-devel readline-devel \
    yum-utils

RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce docker-ce-cli containerd.io

RUN curl -o /usr/bin/slirp4netns -fsSL https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.12/slirp4netns-$(uname -m) \
    && chmod +x /usr/bin/slirp4netns

RUN curl -o /usr/local/bin/docker-compose -fsSL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-$(uname -m) \
    && chmod +x /usr/local/bin/docker-compose && mkdir -p /usr/local/lib/docker/cli-plugins && \
    ln -s /usr/local/bin/docker-compose /usr/local/lib/docker/cli-plugins/docker-compose

USER gitpod
WORKDIR /home/gitpod

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

COPY .bashrc /home/gitpod/.bashrc
