#!/bin/sh
# Adds the rsa public key to known_hosts and authorized_keys (so the host can
# connect to itself via ssh without a tty) and then starts the ssh deamon for
# the Docker image.

set -eu
IFS='
	'


start_sshd() {
  readonly ssh="${HOME}/.ssh"
  readonly public="${ssh}/id_rsa.pub"
  readonly known_hosts="${ssh}/known_hosts"
  readonly authorized="${ssh}/authorized_keys"

  # Note the trailing space (after "localhost ") is required for the known_hosts format.
  printf "localhost " >> "$known_hosts"
  cat "$public" >> "$known_hosts"
  cat "$public" >> "$authorized"

  /usr/sbin/sshd -h "$HOME/.ssh/id_rsa"
}

start_sshd "$@"
