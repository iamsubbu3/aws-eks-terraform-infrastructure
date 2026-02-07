################################################################################
# 1. CLUSTER CONNECTION DETAILS
# These outputs are used to configure kubectl and connect to the cluster API.
################################################################################

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.main.name # [cite: 20]
}

output "endpoint" {
  description = "The endpoint for the EKS Kubernetes API server."
  value       = aws_eks_cluster.main.endpoint # [cite: 21]
}

output "certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster."
  value       = aws_eks_cluster.main.certificate_authority[0].data # [cite: 22]
}

################################################################################
# 2. IDENTITY & SECURITY
# Used for setting up IAM Roles for Service Accounts (IRSA).
################################################################################

output "oidc_issuer" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider."
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer # [cite: 26]
}