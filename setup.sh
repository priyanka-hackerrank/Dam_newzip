#!/bin/bash

npm install
cd ..


if pgrep mongod > /dev/null; then
  echo "mongod is running"
else
  mongod --config /etc/mongod.conf --fork > /dev/null
  echo "mongod started"
fi


# Install dependencies from requirements.txt
pip install -r requirements.txt
pip install django djangorestframework django-cors-headers
pip install pytest pytest-django

# Change to the backend directory
cd backend
python3 manage.py makemigrations
python3 manage.py migrate
