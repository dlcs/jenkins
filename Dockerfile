FROM jenkins/jenkins:lts

USER root

# Import Docker's Debian signing key and install the Docker CE package.

ADD share/keys/docker-signing-key.gpg /root/docker-signing-key.gpg
RUN apt-key add /root/docker-signing-key.gpg
RUN apt-get update && apt-get install -y software-properties-common apt-transport-https
RUN add-apt-repository \
       "deb [arch=amd64] http://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update && apt-get install -y \
  docker-ce \
  libunwind8 \
  gettext \
  apt-transport-https \
  sudo \
  python3-pip && \
  pip3 install awscli
