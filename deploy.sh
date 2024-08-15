#!/bin/bash

echo "${KUBECONFIG}" | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig

kubectl apply -f frontend/deployment.yaml
kubectl apply -f frontend/service.yaml

kubectl apply -f backend/deployment.yaml
kubectl apply -f backend/service.yaml

rm kubeconfig
