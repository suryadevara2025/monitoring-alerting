#!/bin/bash

URL="http://localhost:8080/health"

if curl -sf --max-time 5 "$URL" > /dev/null; then
    echo "Application is UP"
    exit 0
else
    echo "Application is DOWN"
    exit 1
fi
