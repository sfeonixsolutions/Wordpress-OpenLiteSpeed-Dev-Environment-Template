FROM litespeedtech/openlitespeed:1.7.16-lsphp81

# Install PHP modules
RUN apt update && apt install -y unzip php8.1-xdebug php8.1-mysql
COPY config/server/xdebug.ini /usr/local/lsws/lsphp81/etc/php/8.1/mods-available/xdebug.ini

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" 
RUN php composer-setup.php
RUN mv composer.phar /usr/local/bin/composer
RUN php -r "unlink('composer-setup.php');"

# WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


WORKDIR /var/www/vhosts/localhost/html
COPY composer.json composer.lock entrypoint.sh ./
RUN wp core download --allow-root

ENTRYPOINT [ "/var/www/vhosts/localhost/html/entrypoint.sh" ]

