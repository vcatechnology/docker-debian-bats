FROM vcatechnology/debian:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Build-time metadata as defined at http://label-schema.org
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="$PROJECT_NAME" \
      org.label-schema.description="An up-to-date Debian image with shell script testing packages" \
      org.label-schema.url="https://www.debian.org/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/vcatechnology/docker-debian-bats" \
      org.label-schema.vendor="VCA Technology" \
      org.label-schema.version=$VERSION \
      org.label-schema.license=MIT \
      org.label-schema.schema-version="1.0"

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
  shellcheck \
  git \
  tar \
  bzip2 \
  gzip \
  xz-utils \
  && apt-get clean
