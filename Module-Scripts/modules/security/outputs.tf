################################################################################
# 1. SECURITY GROUP OUTPUTS
# This ID is used by EC2 and EKS modules to attach the firewall to resources.
################################################################################

output "sg_id" {
  description = "The ID of the security group created for the infrastructure."
  value       = aws_security_group.sg.id
}