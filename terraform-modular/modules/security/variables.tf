################################################################################
# 1. INFRASTRUCTURE CONTEXT
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
################################################################################

variable "my_ip" {
  description = "Your local IP address (CIDR format) for SSH access."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.my_ip))
    error_message = "my_ip must be a valid CIDR block (example: 49.xxx.xxx.xxx/32)."
  }
}

variable "eks_jump_server" {
  description = "CIDR block allowed to access EKS API."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.eks_jump_server))
    error_message = "eks_jump_server must be a valid CIDR block."
  }
}
