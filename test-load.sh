#!/bin/bash
# Load testing script

echo "=== Load Balancer Test ==="
echo ""

# Test load distribution
echo "Testing load distribution (20 requests)..."
for i in {1..20}; do
    curl -s http://localhost/ | grep -o '"port":"[0-9]*"'
    sleep 0.2
done

echo ""
echo "Distribution count (100 requests)..."
for i in {1..100}; do
    curl -s http://localhost/ | grep -o '"port":"[0-9]*"'
done | sort | uniq -c

echo ""
echo "Apache Bench test..."
if command -v ab &> /dev/null; then
    ab -n 1000 -c 10 http://localhost/
else
    echo "Install Apache Bench: sudo apt install apache2-utils"
fi