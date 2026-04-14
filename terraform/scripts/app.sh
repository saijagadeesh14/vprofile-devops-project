#!/bin/bash
set -e

exec > /var/log/user-data.log 2>&1

# Update
yum update -y

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Install Git
yum install git -y

# Install docker-compose
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create app directory
mkdir -p /home/ec2-user/vprofile-project
cd /home/ec2-user/vprofile-project

# Clone repo (CHANGE THIS)

git clone https://github.com/devopshydclub/vprofile-project.git


# Start containers
/usr/local/bin/docker-compose up -d