################################################################################
# 1. CLUSTER CONNECTION DETAILS
# Use these to configure your local kubectl and connect to the cluster.
################################################################################

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = module.eks.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster."
  value       = module.eks.certificate_authority_data
}

################################################################################
# 2. INFRASTRUCTURE METADATA
################################################################################

output "region" {
  description = "The AWS region where the cluster is deployed."
  value       = var.aws_region
}

################################################################################
# 3. SECURITY & IDENTITY
################################################################################

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider."
  value       = module.eks.oidc_issuer
}