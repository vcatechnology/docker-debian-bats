FROM vcatechnology/debian:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN apt-get install -y  \
  bats \
  openssh-client \
  tar \
  bzip2 \
  gzip \
  xz-utils \
  && apt-get clean
