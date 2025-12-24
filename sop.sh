#!/bin/bash
# Stop all services

echo "Stopping Spring Boot instances..."
for pid in logs/*.pid; do
    if [ -f "$pid" ]; then
        kill $(cat "$pid") 2>/dev/null
        rm "$pid"
    fi
done

echo "Done!"