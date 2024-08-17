#!/bin/bash

echo "${KUBECONFIG}" | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig

kubectl apply -f k8s/deploymentfrontend.yaml
kubectl apply -f k8s/servicefrontend.yaml
kubectl apply -f k8s/configfrontend.yaml

kubectl apply -f k8s/deploymentbackend.yaml
kubectl apply -f k8s/servicebackend.yaml
kubectl apply -f k8s/configbackend.yaml

kubectl apply -f k8s/deploymentredis.yaml
kubectl apply -f k8s/serviceredis.yaml

rm kubeconfig
