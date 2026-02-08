################################################################################
# 1. PROVIDER & GLOBAL SETTINGS
################################################################################

variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
}

################################################################################
# 2. VPC & CORE NETWORKING
################################################################################

variable "vpc_name" {
  description = "The name tag for the VPC."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "instance_tenancy" {
  description = "The tenancy of the instances launched into the VPC."
  type        = string
  default     = "default"
}

# --- Public Subnet Layer ---
variable "public_subnet_1_cidr_block" { type = string }
variable "public_subnet_1_avail_zone" { type = string }

variable "public_subnet_2_cidr_block" { type = string }
variable "public_subnet_2_avail_zone" { type = string }

variable "public_subnet_3_cidr_block" { type = string }
variable "public_subnet_3_avail_zone" { type = string }

# --- Private Subnet Layer ---
variable "private_subnet_1_cidr_block" { type = string }
variable "private_subnet_1_avail_zone" { type = string }

variable "private_subnet_2_cidr_block" { type = string }
variable "private_subnet_2_avail_zone" { type = string }

variable "private_subnet_3_cidr_block" { type = string }
variable "private_subnet_3_avail_zone" { type = string }

################################################################################
# 3. SECURITY & ACCESS CONTROL
################################################################################

variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

variable "my_ip" {
  description = "Your local IP address for SSH access."
  type        = string
}

variable "eks_jump_server" {
  description = "The IP address or CIDR allowed to access EKS API."
  type        = string
}

################################################################################
# 4. COMPUTE (MULTI PUBLIC INSTANCES - FOR_EACH)
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

################################################################################
# 5. EKS CLUSTER SETTINGS
################################################################################

variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "eks_cluster_role_name" {
  description = "The IAM role name for the EKS cluster."
  type        = string
}

variable "node_group_name" { type = string }
variable "eks_node_group_role_name" { type = string }

variable "node_instance_types" {
  description = "List of instance types for the EKS node group."
  type        = list(string)
}

variable "node_instance_capacity_type" { type = string }
variable "node_disk_size" { type = number }

variable "node_desired_size" { type = number }
variable "node_max_size" { type = number }
variable "node_min_size" { type = number }

################################################################################
# 6. S3 BACKEND / STATE STORAGE
################################################################################

variable "tfstate_backup_s3_bucket_name" {
  description = "The globally unique name for the S3 bucket."
  type        = string
}

variable "tfstate_backup_s3_tag_name" {
  description = "The Name tag for the S3 bucket."
  type        = string
}

variable "tfstate_backup_s3_environment_name" {
  description = "The environment tag (e.g., Dev, Prod) for the bucket."
  type        = string
}
