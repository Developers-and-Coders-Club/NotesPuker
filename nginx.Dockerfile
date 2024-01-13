# base nginx alpine image
FROM nginx:stable-alpine

# update and install certbot-nginx
RUN apk update && apk add --no-cache certbot-nginx

# copy certbot.sh and certbot_renew.sh to /usr/local/bin
COPY scripts/certbot/certbot.sh /usr/local/bin/
COPY scripts/certbot/certbot_renew.sh /usr/local/bin/

# make certbot.sh and certbot_renew.sh executable
RUN chmod +x /usr/local/bin/certbot.sh
RUN chmod +x /usr/local/bin/certbot_renew.sh

# add certbot_renew.sh to crontab
RUN echo "0 0 * * 0 /usr/local/bin/certbot_renew.sh" >> /etc/crontabs/root

# switch to non root user
USER nginx

# start nginx run certbot.sh and start cron
CMD ["sh", "-c", "nginx -g 'daemon off;' & /usr/local/bin/certbot.sh & crond -f"]
