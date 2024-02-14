#!/bin/bash

# Attendre que la base de données soit prête
while ! nc -z db 3306; do   
  sleep 1 # attendre 1 seconde avant de vérifier à nouveau
done


# Migration de la base de données
php artisan migrate --force

# Seed de la base de données
php artisan db:seed --force

# Lancement de l'application
php artisan serve --host=0.0.0.0 --port=9000