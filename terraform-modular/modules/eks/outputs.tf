################################################################################
# 1. CLUSTER CONNECTION DETAILS
# Used to configure kubectl and connect to the Kubernetes API server.
################################################################################

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.main.name
}

output "endpoint" {
  description = "The endpoint for the EKS Kubernetes API server."
  value       = aws_eks_cluster.main.endpoint
}

output "certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster."
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_version" {
  description = "The Kubernetes version of the EKS cluster."
  value       = aws_eks_cluster.main.version
}

################################################################################
# 2. IDENTITY & SECURITY
# Used for IAM Roles for Service Accounts (IRSA) and auditing.
################################################################################

output "oidc_issuer" {
  description = "The URL for the OpenID Connect identity provider of the EKS cluster."
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "cluster_arn" {
  description = "ARN of the EKS Cluster."
  value       = aws_eks_cluster.main.arn
}
