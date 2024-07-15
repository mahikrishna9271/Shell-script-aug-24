#!/bin/bash

# Prompt for AWS Access Key ID
read -p "Enter AWS Access Key ID: " aws_access_key_id

# Prompt for AWS Secret Access Key
read -p "Enter AWS Secret Access Key: " aws_secret_access_key

# Prompt for default AWS region
read -p "Enter default AWS region (e.g., us-east-1): " aws_default_region

# Prompt for default output format
read -p "Enter default output format (e.g., json): " aws_output_format

# Configure AWS CLI with provided credentials and settings
echo "Configuring AWS CLI..."
aws configure set aws_access_key_id "$aws_access_key_id"
aws configure set aws_secret_access_key "$aws_secret_access_key"
aws configure set default.region "$aws_default_region"
aws configure set default.output "$aws_output_format"

# Verify the configuration
echo "Verifying AWS CLI configuration..."
aws configure list

echo "AWS CLI configuration completed."

