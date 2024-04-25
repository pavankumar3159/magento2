#!/bin/sh

if [ -d "/var/www/html" ]; then
    chown -R test-ssh:clp /var/www/html
fi

exec "$@"
