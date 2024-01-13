#!/bin/sh

# Renew all certificates managed by Certbot
certbot renew

# Optionally, reload Nginx to apply renewed certificates
nginx -s reload
