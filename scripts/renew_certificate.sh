#!/bin/sh

docker compose -f /home/ubuntu/site/docker-compose.yaml \
  run --rm certbot renew > /var/log/renew_cert_log.log
