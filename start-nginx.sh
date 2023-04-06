#!/bin/bash

# Create the required directories for the certificate and private key
mkdir -p /etc/nginx/ssl/certs /etc/nginx/ssl/private

# Provision a self-signed certificate using the domain name specified in the environment variable
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=US/ST=California/L=San Francisco/O=Your Company/OU=IT/CN=${DOMAIN_NAME}" \
    -keyout /etc/nginx/ssl/private/nginx-selfsigned.key \
    -out /etc/nginx/ssl/certs/nginx-selfsigned.crt

# Replace environment variables in the Nginx configuration template
envsubst '${DOMAIN_NAME}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
nginx -g "daemon off;"
