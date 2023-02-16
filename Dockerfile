FROM improwised/php-base:latest

# Copy Composer
COPY ./composer.* /var/www/
COPY ./.env /var/www

# Install dependencies
RUN composer install --no-scripts --no-autoloader

# Copy app
COPY . /var/www

# Generate autoload and fix permissions
RUN set -ex \
  && composer dump-autoload --optimize \
  && chown -R nginx:nginx /var/www