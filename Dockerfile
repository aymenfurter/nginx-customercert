# Use the official Nginx image as the base image
FROM nginx:latest

# Set environment variable for the domain name
ENV DOMAIN_NAME=localhost

# Copy custom configuration file and startup script
COPY default.conf.template /etc/nginx/conf.d/
COPY start-nginx.sh /start-nginx.sh

# Grant execution permissions to the startup script
RUN chmod +x /start-nginx.sh

# Start Nginx and provision self-signed certificate on container start
CMD ["/start-nginx.sh"]
