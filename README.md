# Setup
## Build
To build `nginx-certbot` docker image execute the next command from a directory containing `Dockerfile`
```Shell
docker build -t nginx-certbot:latest .
```

## Run
Before a run it is expected to store all site configs in `/etc/nginx-certbot/conf.d` folder.\
To start `nginx-certbot` just run the script `./start_nginx.sh`

## Request certs
To request a let's encrypt certificate for a particular domain use
```Shell
docker exec -it nginx-container certbot --nginx -n -d <domain> -m <owner's email> --agree-tos
```
To test the certbot configuration without affecting letsencrypt's limits it is possible to use `--test-cert` flag.

## Useful commands
To reload nginx configuration use
```Shell
docker exec -it nginx-container nginx -s reload
```
or
```Shell
docker exec -it service nginx reload
```
