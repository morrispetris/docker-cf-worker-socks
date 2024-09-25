### Local Testing
```bash

sudo docker build -t morrispetris/docker-cf-worker-socks .
sudo docker push morrispetris/docker-cf-worker-socks

sudo docker stop docker-cf-worker-socks
sudo docker rm docker-cf-worker-socks
sudo docker logs docker-cf-worker-socks

sudo docker exec -it docker-cf-worker-socks netstat -tuln
sudo docker exec -it docker-cf-worker-socks sh

sudo docker run \
  --name docker-cf-worker-socks \
  --detach \
  -e DOMAIN="example.domain" \
  -e PSW="example password" \
  -p 1080:1080 \
  morrispetris/docker-cf-worker-socks 

curl --socks5 127.0.0.1:1080 ipinfo.io

```
