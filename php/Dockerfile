FROM php:8.1-fpm
RUN addgroup --system clp && adduser --system --no-create-home --ingroup clp test-ssh
RUN echo "memory_limit = 2G" > /usr/local/etc/php/conf.d/memory-limit.ini
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    libonig-dev \
    libicu-dev \
    libmcrypt-dev \
    git \
    unzip \
    curl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd \
    bcmath \
    intl \
    mbstring \
    soap \
    xsl \
    zip \
    pdo_mysql \
    sockets
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/html/
COPY auth.json /root/.composer/auth.json
RUN chown -R test-ssh:clp /var/www/html/
USER test-ssh
CMD ["php-fpm"]

#RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition
# RUN ls -la /var/www/html/project-community-edition/magento/project-community-edition/
# RUN chmod +x /var/www/html/project-community-edition/bin/magento
# RUN cd /var/www/html/project-community-edition &&  php /bin/magento setup:install \
#     --base-url="${MAGENTO_BASE_URL}" \
#     --db-host="${DB_HOST}" \
#     --db-name="${DB_NAME}" \
#     --db-user="${DB_USER}" \
#     --db-password="${DB_PASSWORD}" \
#     --admin-firstname="${ADMIN_FIRSTNAME}" \
#     --admin-lastname="${ADMIN_LASTNAME}" \
#     --admin-email="${ADMIN_EMAIL}" \
#     --admin-user="${ADMIN_USER}" \
#     --admin-password="${ADMIN_PASSWORD}" \
#     --language="${LANGUAGE}" \
#     --currency="${CURRENCY}" \
#     --timezone="${TIMEZONE}" \
#     --search-engine="${SEARCH_ENGINE}" \
#     --elasticsearch-host="${ELASTICSEARCH_HOST}" \
#     --elasticsearch-port="${ELASTICSEARCH_PORT}" \
#     --use-rewrites="${USE_REWRITES}" \
#     --backend-frontname="${BACKEND_FRONTNAME}" \
#     --use-sample-data