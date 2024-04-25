FROM php:8.1-fpm

# Setting PHP memory limit
RUN echo "memory_limit = 2G" > /usr/local/etc/php/conf.d/memory-limit.ini

# Install OS packages
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

# Install PHP extensions
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


# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer



# Copy the Composer auth.json if you have one
COPY auth.json /root/.composer/auth.json

# Start PHP-FPM
CMD ["php-fpm"]

RUN composer create-project --repository-url=https://github.com/markshust/docker-magento.git magento2 /var/www/html
# Set working directory
WORKDIR /var/www/html/magento2/
RUN php /bin/magento setup:install \
    --base-url="${MAGENTO_BASE_URL}" \
    --db-host="${DB_HOST}" \
    --db-name="${DB_NAME}" \
    --db-user="${DB_USER}" \
    --db-password="${DB_PASSWORD}" \
    --admin-firstname="${ADMIN_FIRSTNAME}" \
    --admin-lastname="${ADMIN_LASTNAME}" \
    --admin-email="${ADMIN_EMAIL}" \
    --admin-user="${ADMIN_USER}" \
    --admin-password="${ADMIN_PASSWORD}" \
    --language="${LANGUAGE}" \
    --currency="${CURRENCY}" \
    --timezone="${TIMEZONE}" \
    --search-engine="${SEARCH_ENGINE}" \
    --elasticsearch-host="${ELASTICSEARCH_HOST}" \
    --elasticsearch-port="${ELASTICSEARCH_PORT}" \
    --use-rewrites="${USE_REWRITES}" \
    --backend-frontname="${BACKEND_FRONTNAME}" \
    --use-sample-data  