#!/bin/bash

echo "Starting CPU stress test..."

stress-ng --cpu 0 --cpu-load 100 --timeout 5m

echo "CPU stress test completed."
