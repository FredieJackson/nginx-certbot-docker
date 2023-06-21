docker run --rm -d --name nginx-container \
-p 443:443 \
-p 80:80 \
-v /etc/nginx-certbot/conf.d:/etc/nginx/conf.d \
-v /etc/nginx-certbot/letsencrypt:/etc/letsencrypt \
nginx-certbot