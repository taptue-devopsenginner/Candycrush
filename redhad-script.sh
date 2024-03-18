#!/bin/bash
# This script is valid for Red Hat-based servers.

# Update package manager
sudo yum update -y

# Add Adoptium repository
sudo rpm --import https://adoptium.net/archive.key
sudo yum-config-manager --add-repo https://adoptium.net/archive/rpm/centos/adoptium.repo

# Install Temurin JDK 17
sudo yum install adoptium-jdk-17 -y

# Check Java version
/usr/bin/java --version

# Install Trivy
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/trivy.repo https://aquasecurity.github.io/trivy-repo/rpm/trivy.repo
sudo yum install trivy -y

# Install Terraform
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/hashicorp.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install terraform -y

# Install kubectl
sudo yum install curl -y
sudo curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# Install AWS CLI
sudo yum install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Node.js 16 and npm
sudo yum install -y gcc-c++ make
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install -y nodejs

