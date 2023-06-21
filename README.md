# Setup
## Build
To build `nginx-certbot` docker image execute the next command from a directory containing `Dockerfile`
```
docker build -t nginx-certbot:latest .
```

To be able to use docker's dns and make requests to services using their names it is required to have all services in the same network.\
To create a new network use
```
docker network create nginx_network
```
and then use option `--net=nginx_network` when starting services under docker. This option is already present in `start_nginx.sh` script.

## Run
Before a run it is expected to store all site configs in `/etc/nginx-certbot/conf.d` folder.\
To start `nginx-certbot` just run the script `./start_nginx.sh`

## Request certs
To request a let's encrypt certificate for a particular domain use
```
docker exec -it nginx-container certbot --nginx -n -d <domain> -m <owner's email> --agree-tos
```
To test the certbot configuration without affecting letsencrypt's limits it is possible to use `--test-cert` flag.

## Useful commands
To reload nginx configuration use
```
docker exec -it nginx-container nginx -s reload
```
or
```
docker exec -it service nginx reload
```
