FROM richarvey/nginx-php-fpm:3.1.6

RUN apk update
RUN apk add --no-cache postgresql-dev
RUN docker-php-ext-install pdo pdo_pgsql bcmath

# Set working directory
COPY src/ .

# Image config
ENV SKIP_CHOWN=1
ENV SKIP_COMPOSER=1
ENV WEBROOT=/var/www/html/public
ENV PHP_ERRORS_STDERR=1
ENV RUN_SCRIPTS=1
ENV REAL_IP_HEADER=1

# Laravel config
ARG APP_ENV=production
ARG APP_DEBUG=false
ARG LOG_CHANNEL=stderr

ENV APP_ENV=${APP_ENV}
ENV APP_DEBUG=${APP_DEBUG}
ENV LOG_CHANNEL=${LOG_CHANNEL}

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER=1

CMD ["/start.sh"]
