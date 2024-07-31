#!/usr/bin/env bash

# Turn on maintenance mode
php artisan down || true

# scripts/00-laravel-deploy.sh
echo "Running composer"
composer install --no-interaction --no-dev --prefer-dist --working-dir=/var/www/html

echo "Running migrations..."
php artisan migrate --force

# Clear caches
php artisan cache:clear

# Clear expired password reset tokens
php artisan auth:clear-resets

echo "Caching routes..."
php artisan route:cache

echo "Caching config..."
php artisan config:cache

# Clear and cache views
php artisan view:cache

# Turn off maintenance mode
php artisan up
