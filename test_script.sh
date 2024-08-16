#!/bin/bash

FRONTEND_URL="http://localhost:8080"
BACKEND_URL="http://localhost:8081"

check_service() {
    local url=$1
    echo "Checking service at $url..."
    
    if curl -s --head --fail "$url"; then
        echo "Service at $url is up!"
    else
        echo "Service at $url is down!"
        exit 1
    fi
}

check_service $FRONTEND_URL
check_service $BACKEND_URL
