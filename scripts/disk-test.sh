#!/bin/bash

echo "Creating temporary disk test file..."

fallocate -l 8G ~/disk-test.img

echo "Disk test file created."
df -h /

echo "Remove the test file after testing:"
echo "rm -f ~/disk-test.img"
