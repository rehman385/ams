# Use the official PHP image with an Apache web server
FROM php:8.1-apache

# Update package lists and install the PostgreSQL development libraries
RUN apt-get update && apt-get install -y libpq-dev

# Now install the PHP extension for PostgreSQL
RUN docker-php-ext-install pdo pdo_pgsql

# Copy your project files into the web server's public directory
COPY . /var/www/html/