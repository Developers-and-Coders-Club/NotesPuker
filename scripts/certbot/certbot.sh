#!/bin/sh

# Check if CERTBOT_EMAIL and CERTBOT_DOMAINS are set and not empty
if [ -z "$CERTBOT_EMAIL" ] || [ -z "$CERTBOT_DOMAINS" ]; then
    echo "Error: You must provide both CERTBOT_EMAIL and at least one domain in CERTBOT_DOMAINS."
    exit 1
fi

# Obtain or renew certificates for specified domains
certbot -n --nginx --agree-tos --email $CERTBOT_EMAIL \
--domains $CERTBOT_DOMAINS

# Restart nginx to apply any certificate changes
nginx -s reload
