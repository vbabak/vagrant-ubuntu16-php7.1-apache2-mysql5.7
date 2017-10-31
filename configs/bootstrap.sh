#!/bin/sh

serviceCommand() {
  if service --status-all | grep -Fq ${1}; then
    service ${1} ${2}
  fi
}

serviceCommand apache2 restart
serviceCommand mysql restart

# service apache2 restart
# service mysql restart
