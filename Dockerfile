# Use the richarvey/nginx-php-fpm base image
FROM richarvey/nginx-php-fpm:latest

# Set working directory
WORKDIR /var/www/html

# Copy the existing application directory contents
COPY . .
# Copy custom nginx configuration file
#COPY nginx.conf /etc/nginx/sites-available/default

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Set file permissions for Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 80 to the outside world
EXPOSE 80
