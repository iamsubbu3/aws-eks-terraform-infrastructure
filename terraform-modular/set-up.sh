#!/bin/bash

# Exit on any error
set -e

echo "Step 1: Initializing Terraform with LOCAL state..."
# We rename backend.tf so Terraform doesn't try to use a bucket that doesn't exist yet
mv backend.tf backend.tf.ignore || true
terraform init

echo "Step 2: Creating S3 Bucket and Infrastructure..."
terraform apply -auto-approve

echo "Step 3: Migrating state to S3 Backend..."
# Now that the bucket is created, we enable the backend
mv backend.tf.ignore backend.tf
terraform init -force-copy

echo "Deployment and state migration complete!"