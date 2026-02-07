################################################################################
# 1. VPC CONFIGURATION
# Core settings for the Virtual Private Cloud.
################################################################################

variable "vpc_name" {
  description = "The name of the VPC (used for Name tags)."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC."
  type        = string
  default     = "default"
}

################################################################################
# 2. NETWORK TOPOLOGY
# Defines how the network is split across Availability Zones.
################################################################################

variable "azs" {
  description = "A list of Availability Zones names in the region."
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnet CIDRs."
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnet CIDRs."
  type        = list(string)
}