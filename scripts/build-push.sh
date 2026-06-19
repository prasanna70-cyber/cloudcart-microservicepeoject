#!/bin/bash
set -e

if [ -z "$DOCKER_USER" ]; then
  echo "Please export DOCKER_USER first"
  echo "Example: export DOCKER_USER=yourdockerhubusername"
  exit 1
fi

SERVICES=(
  api-gateway
  auth-service
  user-service
  product-service
  inventory-service
  cart-service
  order-service
  payment-service
  shipping-service
  notification-service
  review-service
)

for svc in "${SERVICES[@]}"; do
  echo "Building $svc"
  docker build -t $DOCKER_USER/cloudcart-$svc:v1 services/$svc
  docker push $DOCKER_USER/cloudcart-$svc:v1
done

echo "Building frontend"
docker build -t $DOCKER_USER/cloudcart-frontend:v1 frontend
docker push $DOCKER_USER/cloudcart-frontend:v1

echo "Updating Kubernetes image placeholders"
sed -i "s|DOCKER_USER_PLACEHOLDER|$DOCKER_USER|g" k8s/backend.yaml
sed -i "s|DOCKER_USER_PLACEHOLDER|$DOCKER_USER|g" k8s/frontend.yaml

echo "Done"
