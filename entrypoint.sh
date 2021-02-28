#!/bin/bash
cmd=""

until mysqladmin ping -u root -proot -h db --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 3
done

exec "$@"
