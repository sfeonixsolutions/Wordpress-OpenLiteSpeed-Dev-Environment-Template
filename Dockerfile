FROM litespeedtech/openlitespeed:1.7.16-lsphp81

RUN apt install -y unzip php8.1-xdebug
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" 
RUN php composer-setup.php
RUN mv composer.phar /usr/local/bin/composer
RUN php -r "unlink('composer-setup.php');"
COPY config/server/xdebug.ini /usr/local/lsws/lsphp81/etc/php/8.1/mods-available/xdebug.ini

WORKDIR /var/www/vhosts/localhost/html
COPY composer.json composer.lock ./
RUN composer install

