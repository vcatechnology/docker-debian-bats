FROM vcatechnology/debian-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN sudo apt-get install -y  \
  bats \
  openssh-client \
  tar \
  bzip2 \
  gzip \
  xz-utils \
  && sudo apt-get clean
