# Use the official PHP image with an Apache web server
FROM php:8.1-apache

# Install the PHP extension needed to connect to a PostgreSQL database
RUN docker-php-ext-install pdo pdo_pgsql

# Copy all of your project files into the web server's public directory
COPY . /var/www/html/