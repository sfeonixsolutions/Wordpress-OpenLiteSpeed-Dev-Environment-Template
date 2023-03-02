#!/bin/bash

wp core install \
    --title="Example"\
    --url=localhost:13080\
    --admin_user=admin\
    --admin_password=admin\
    --admin_email="admin@example.com"\
    --allow-root
composer install
/entrypoint.sh