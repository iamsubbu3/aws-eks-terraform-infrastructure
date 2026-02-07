################################################################################
# 1. CORE NETWORKING OUTPUTS
# These IDs are required by Security Groups and other modules.
################################################################################

output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

################################################################################
# 2. SUBNET IDENTIFIERS
# Exported as lists for use in EC2 instances and EKS Node Groups.
################################################################################

output "public_subnet_ids" {
  description = "A list of IDs for the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "A list of IDs for the private subnets."
  value       = aws_subnet.private[*].id
}