#!/bin/sh

# Obtain or renew certificates for specified domains
certbot -n --nginx --agree-tos --email example@email.com \
--domains example.com,example2.com,example3.com

# Restart nginx to apply any certificate changes
nginx -s reload
