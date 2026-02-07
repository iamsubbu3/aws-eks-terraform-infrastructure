################################################################################
# 1. INFRASTRUCTURE CONTEXT
# These variables link the security group to your existing networking.
################################################################################

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

################################################################################
# 2. ACCESS CONTROL SETTINGS
# Defines which IP addresses are allowed through the firewall.
################################################################################

variable "my_ip" {
  description = "The local IP address (in CIDR notation) for SSH administrative access."
  type        = string
}

variable "eks_jump_server" {
  description = "The allowed CIDR block for EKS API and management access."
  type        = string
}