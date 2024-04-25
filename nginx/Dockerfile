# Use the official Varnish image as the base
FROM varnish:6

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx

# Create a directory for SSL certificates
RUN mkdir /etc/nginx/ssl
# RUN mkdir /var/www/html

# Copy the Varnish and Nginx configuration files
COPY ./default.vcl /etc/varnish/default.vcl
COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY ./default-ssl.conf /etc/nginx/sites-available/default.conf
COPY ./ssl/* /etc/nginx/ssl/

# Set environment variables for Varnish
ENV VARNISH_SIZE 256m
ENV VARNISH_BACKEND_ADDRESS 127.0.0.1
ENV VARNISH_BACKEND_PORT 8888

# Expose ports for Varnish and Nginx
EXPOSE 80 443

# Start Nginx and Varnish
CMD service nginx start && varnishd -F \
    -f /etc/varnish/default.vcl \
    -s malloc,$VARNISH_SIZE \
    -a :80 \
    -b $VARNISH_BACKEND_ADDRESS:$VARNISH_BACKEND_PORT
