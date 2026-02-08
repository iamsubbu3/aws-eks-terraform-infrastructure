################################################################################
# 1. SHARED SECURITY CONFIGURATION
################################################################################

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the instances."
  type        = list(string)
}

################################################################################
# 2. PUBLIC SUBNETS (USED FOR DISTRIBUTION ACROSS AZs)
################################################################################

variable "public_subnet_ids" {
  description = "List of public subnet IDs where instances will be deployed."
  type        = list(string)
}

################################################################################
# 3. PUBLIC INSTANCES CONFIGURATION (FOR_EACH BASED)
################################################################################

variable "public_instances" {
  description = "List of public EC2 instances configuration."

  type = list(object({
    name          = string
    ami           = string
    instance_type = string
    key_name      = string
    volume_size   = number
    volume_type   = string
  }))
}
