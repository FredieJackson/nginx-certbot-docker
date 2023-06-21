FROM nginx:1.24

RUN apt update && \
    apt install -y certbot python3-certbot-nginx cron && \
    rm /etc/nginx/conf.d/default.conf

RUN echo "0 */12 * * * root certbot -q renew --deploy-hook \"service nginx reload\"" > /etc/cron.d/certbot