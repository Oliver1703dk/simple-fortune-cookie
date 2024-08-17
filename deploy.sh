#!/bin/bash

echo "${KUBECONFIG}" | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig

kubectl --kubeconfig KUBECONFIG apply -f k8s/deploymentfrontend.yaml
kubectl --kubeconfig KUBECONFIG apply -f k8s/servicefrontend.yaml
kubectl --kubeconfig KUBECONFIG apply -f k8s/configfrontend.yaml

kubectl --kubeconfig KUBECONFIG apply -f k8s/deploymentbackend.yaml
kubectl --kubeconfig KUBECONFIG apply -f k8s/servicebackend.yaml
kubectl --kubeconfig KUBECONFIG apply -f k8s/configbackend.yaml

kubectl --kubeconfig KUBECONFIG apply -f k8s/deploymentredis.yaml
kubectl --kubeconfig KUBECONFIG apply -f k8s/serviceredis.yaml

rm kubeconfig