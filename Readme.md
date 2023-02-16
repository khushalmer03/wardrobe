STEP 1: Dockerfile
    -Created dockerfile using improwised/php-base:latest
    -Copied all the files in /var/www (working directory)
    -Installed dependencies using 
        RUN composer install --no-scripts --no-autoloader
    -Generated autoload and fixed permissions using
        RUN set -ex \
        && composer dump-autoload --optimize \
        && chown -R nginx:nginx /var/www

STEP 2: docker-compose
    -Created docker-compose file with two services
        -php (for app)
        -db (for mysql database)
    -Used mysql:5.7 as base image
    -Gave reference of .env file to php service
    -Exposed ports
        -8080:80 for php
        -3306:3306 for db
        
STEP 3: Built and ran the container using 
            -docker-compose up --build

Step 4: Inside the container
    -Performed migration using
        php artisan migrate
    -Generated app encryption key using
        php artisan ker:generate
    -Ran application using 
        php artisan serve