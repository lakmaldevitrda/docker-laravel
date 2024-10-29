# Use the official PHP image with Apache
FROM php:8.2-apache

# Install dependencies and PHP extensions required by Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the project files to the container
COPY . .

# Set permissions for the Laravel project
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && find /var/www/html -type f -exec chmod 644 {} \; \
    && find /var/www/html -type d -exec chmod 755 {} \;

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy custom Apache configuration
COPY ./apache-setup.conf /etc/apache2/sites-available/000-default.conf

# Expose the container port
EXPOSE 80
