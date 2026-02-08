################################################################################
# CORE NETWORKING OUTPUTS
################################################################################

output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

################################################################################
# SUBNET IDENTIFIERS
################################################################################

output "public_subnet_ids" {
  description = "A list of IDs for the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "A list of IDs for the private subnets."
  value       = aws_subnet.private[*].id
}

################################################################################
# OPTIONAL (DEBUGGING / VISIBILITY)
################################################################################

output "public_subnet_azs" {
  description = "AZs used by public subnets."
  value       = aws_subnet.public[*].availability_zone
}

output "private_subnet_azs" {
  description = "AZs used by private subnets."
  value       = aws_subnet.private[*].availability_zone
}
