#!/bin/bash

set -e

create_package() {
DIR=$1
NAME=$2
DEPS=$3

cat > services/$DIR/package.json <<EOF
{
  "name": "$NAME",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
$DEPS
  }
}
EOF
}

create_package api-gateway api-gateway '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "http-proxy-middleware": "^3.0.3",
    "prom-client": "^15.1.3"
'

create_package auth-service auth-service '
    "bcryptjs": "^3.0.2",
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "jsonwebtoken": "^9.0.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package user-service user-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package product-service product-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "redis": "^4.7.0",
    "prom-client": "^15.1.3"
'

create_package inventory-service inventory-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package cart-service cart-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "redis": "^4.7.0",
    "prom-client": "^15.1.3"
'

create_package order-service order-service '
    "axios": "^1.8.1",
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package payment-service payment-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package shipping-service shipping-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package notification-service notification-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

create_package review-service review-service '
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql2": "^3.14.1",
    "prom-client": "^15.1.3"
'

echo "✅ All package.json files have been fixed."
