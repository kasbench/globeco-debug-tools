#!/bin/bash
set -e

echo "Applying Kubernetes manifests for globeco-debug-tools..."
kubectl apply -f "$(dirname "$0")/globeco-debug-tools-deployment.yaml" -n globeco
kubectl apply -f "$(dirname "$0")/globeco-debug-tools-service.yaml" -n globeco

echo "\nDeployment applied. To shell into the debug pod, run:"
echo "kubectl exec -it deploy/globeco-debug-tools -n globeco -- bash" 