FROM nginx:latest
RUN addgroup --system clp && adduser --system --no-create-home --ingroup clp test-ssh
RUN rm /etc/nginx/conf.d/default.conf
RUN sed -i '/user /d' /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html /var/cache/nginx/client_temp /var/cache/nginx/proxy_temp \
             /var/cache/nginx/fastcgi_temp /var/cache/nginx/uwsgi_temp /var/cache/nginx/scgi_temp \
    && chown -R test-ssh:clp /var/www /var/cache/nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY conf.d/ /etc/nginx/conf.d/
COPY ./certs/test.mgt.com.crt /etc/nginx/certs/test.mgt.com.crt
COPY ./certs/test.mgt.com.crt /etc/nginx/certs/test.mgt.com.crt
EXPOSE 80 443
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
