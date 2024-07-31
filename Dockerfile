# Use the richarvey/nginx-php-fpm base image
FROM richarvey/nginx-php-fpm:latest

# Set working directory
#COPY . .
COPY src/ .

# Image config
ENV SKIP_CHOWN 1
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ARG APP_ENV=production
ARG APP_DEBUG=false
ARG LOG_CHANNEL=stderr

ENV APP_ENV ${APP_ENV}
ENV APP_DEBUG ${APP_DEBUG}
ENV LOG_CHANNEL ${LOG_CHANNEL}

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]
