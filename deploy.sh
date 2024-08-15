#!/bin/bash

# Decode and save kubeconfig from the secret
echo "${KUBECONFIG}" | base64 -d > kubeconfig

# Set the context for kubectl to use the correct kubeconfig file
export KUBECONFIG=kubeconfig

# Apply your Kubernetes manifests frontend 
kubectl apply -f frontend/deployment.yaml
kubectl apply -f frontend/service.yaml

# Apply your Kubernetes manifests backend 
kubectl apply -f backend/deployment.yaml
kubectl apply -f backend/service.yaml

# Optional: clean up kubeconfig file if desired
rm kubeconfig
