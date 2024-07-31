#!/usr/bin/env bash
# scripts/00-laravel-deploy.sh
echo "Running composer"
composer install --no-dev --working-dir=/var/www/html

php artisan cache:clear

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force
