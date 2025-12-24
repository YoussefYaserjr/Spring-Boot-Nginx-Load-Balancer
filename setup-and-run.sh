#!/bin/bash
# Automated setup script for Linux

echo "=== Spring Boot + Nginx Setup ==="

# Install Nginx
if ! command -v nginx &> /dev/null; then
    sudo apt update
    sudo apt install -y nginx
fi

# Build application
echo "Building application..."
mvn clean package -DskipTests

# Create logs directory
mkdir -p logs

# Configure Nginx
echo "Configuring Nginx..."
sudo cp nginx.conf /etc/nginx/sites-available/spring-app
sudo ln -sf /etc/nginx/sites-available/spring-app /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t

# Start Nginx
sudo systemctl restart nginx

# Start Spring Boot instances
echo "Starting Spring Boot instances..."

java -jar target/spring-nginx-loadbalancer-1.0.0.jar --server.port=8081 > logs/instance1.log 2>&1 &
echo $! > logs/instance1.pid
sleep 5

java -jar target/spring-nginx-loadbalancer-1.0.0.jar --server.port=8082 > logs/instance2.log 2>&1 &
echo $! > logs/instance2.pid
sleep 5

java -jar target/spring-nginx-loadbalancer-1.0.0.jar --server.port=8083 > logs/instance3.log 2>&1 &
echo $! > logs/instance3.pid

echo ""
echo "=== Setup Complete! ==="
echo "Access at: http://localhost"