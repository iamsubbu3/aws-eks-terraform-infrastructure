################################################################################
# 1. SHARED SECURITY CONFIGURATION
################################################################################

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the instances."
  type        = list(string)
}

################################################################################
# 2. PUBLIC INSTANCE 1 CONFIGURATION (e.g., Jenkins/Ansible)
################################################################################

variable "public_subnet_1_id" {
  description = "The ID of the first public subnet where Instance 1 will be deployed."
  type        = string
}

variable "name_1" {
  description = "The Name tag for Instance 1."
  type        = string
}

variable "ami_1" {
  description = "The AMI ID to use for Instance 1."
  type        = string
}

variable "type_1" {
  description = "The instance type for Instance 1."
  type        = string
}

variable "key_1" {
  description = "The key pair name to use for Instance 1."
  type        = string
}

variable "vol_size_1" {
  description = "The size of the root volume for Instance 1 (in GiB)."
  type        = number
}

variable "vol_type_1" {
  description = "The type of the root volume for Instance 1 (e.g., gp3)."
  type        = string
}

################################################################################
# 3. PUBLIC INSTANCE 2 CONFIGURATION
################################################################################

variable "public_subnet_2_id" {
  description = "The ID of the second public subnet where Instance 2 will be deployed."
  type        = string
}

variable "name_2" {
  description = "The Name tag for Instance 2."
  type        = string
}

variable "ami_2" {
  description = "The AMI ID to use for Instance 2."
  type        = string
}

variable "type_2" {
  description = "The instance type for Instance 2."
  type        = string
}

variable "key_2" {
  description = "The key pair name to use for Instance 2."
  type        = string
}

variable "vol_size_2" {
  description = "The size of the root volume for Instance 2 (in GiB)."
  type        = number
}

variable "vol_type_2" {
  description = "The type of the root volume for Instance 2 (e.g., gp3)."
  type        = string
}