# Wordpress dev setup using Composer & Docker

## Components

<ol>
    <li>
        Docker Containers ( throught <code>docker compose</code> )
        <ol>
            <li>
            Wordpress 6.1 - Wordpress container running PHP through openlitespeed server.
            </li>
            <li>
            Mysql 8.0.
            </li>
            <li>
            Adminer 4.0
            </li>
        </ol>
    </li>
    <li>
        Composer
        <ul>
            <li>Composer is used to version control wordpress installation & dependencies.</li>
        </ul>
    </li>
</ol>

## Usage

Docker containers are configured through the `docker-compose.yml` file. The compose file will generate three containers.

1. Wordpress Container - This container is built on top of openlitespeed container and adds some extra features to it ( Steps in [Dockerfile](./Dockerfile) ). The container when created, will download and install `composer`, `xdebug` & `unzip` packages. It will also run an initial composer install to setup wordpress and mount your theme in the `wp-content/themes` directory. You can also choose to connect a php debugger with built in configuration for VScode.<br>
   You can access the site at `http://<your_host>:13080`
2. MySQL & Adminer - Mysql container will also be created with default root/root credentials and will also create another user as wordpress/wordpress with a database `example.com`. <br/>
   Adminer is also started in another container which can be accessed at `http://<your_host>:13081`

The whole env can be brought up using `docker compose` or the shortcut available in the codebase `./dc`

e.g

```
./dc build --no-cache wordpress.server

./dc up -d
```

## What to change

To change the theme name, database name etc, look for `example.com` and change it to your liking.

## What is next!

This is a first iteration, there will be more things to come. List of the things will be managed here

- [ ] Version Control Wordpress releases with LS version.
- [ ] Futureproof `fancyguy/webroot-installer` package for wordpress web root install.
- [ ] List of helpful Command.
- [ ] Automate initial bootstrap.
- ...
