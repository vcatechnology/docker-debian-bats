FROM vcatechnology/debian:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Eventually 'bats' will land in 'stable', for now we just install it manually
RUN apt-get install -y wget && \
  wget https://codeload.github.com/sstephenson/bats/tar.gz/v0.4.0 -q -Obats.tar.gz && \
  tar -zxf bats.tar.gz && \
  ./bats-0.4.0/install.sh /usr/local \
  rm -r bats-* && \
  apt-get remove -y --purge wget && \
  apt-get autoremove -y && \
  apt-get clean -y

RUN apt-get install -y \
  openssh-client \
  tar \
  bzip2 \
  gzip \
  xz-utils \
  && apt-get clean
