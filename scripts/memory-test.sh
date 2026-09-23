#!/bin/bash

echo "Starting memory stress test..."

stress-ng --vm 1 --vm-bytes 3000M --vm-keep --timeout 5m

echo "Memory stress test completed."
