#!/bin/bash

# Check if unzip is installed
if ! command -v unzip &> /dev/null; then
    echo "unzip command not found. Installing unzip..."
    sudo apt update
    sudo apt install -y unzip
fi

# Download AWS CLI version 2 installer
echo "Downloading AWS CLI version 2 installer..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip installer package
echo "Extracting AWS CLI version 2..."
unzip awscliv2.zip

# Install AWS CLI version 2
echo "Installing AWS CLI version 2..."
sudo ./aws/install

# Verify installation
echo "Verifying AWS CLI installation..."
aws --version

# Clean up downloaded files
echo "Cleaning up..."
rm -rf aws awscliv2.zip

echo "AWS CLI version 2 installation completed."



# Check if kubectl is already installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl is not installed. Proceeding with installation..."
else
    echo "kubectl is already installed."
    exit 0
fi

# Download the latest kubectl binary
echo "Downloading kubectl binary..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make the kubectl binary executable
chmod +x ./kubectl

# Move the kubectl binary to a directory in your PATH
sudo mv ./kubectl /usr/local/bin/kubectl

# Verify the installation
echo "Verifying kubectl installation..."
kubectl version --client

echo "kubectl installation completed successfully."

