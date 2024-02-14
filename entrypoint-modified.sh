#!/bin/bash

# Démarrage du service MySQL
service mysql start

# Suite du script original...
while ! nc -z localhost 3306; do   
  sleep 1
done

# Migration de la base de données
php artisan migrate --force

# Seed de la base de données
php artisan db:seed --force

# Lancement de l'application
php artisan serve --host=0.0.0.0 --port=9000
