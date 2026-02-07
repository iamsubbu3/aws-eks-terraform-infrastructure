################################################################################
# 1. CLUSTER CONFIGURATION (CONTROL PLANE)
# Primary settings for the EKS Cluster and its IAM role.
################################################################################

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_role" {
  description = "The name of the IAM role for the EKS cluster."
  type        = string
}

variable "all_subnet_ids" {
  description = "A list of all subnet IDs (public and private) for the cluster VPC config."
  type        = list(string)
}

################################################################################
# 2. NODE GROUP SETTINGS (DATA PLANE)
# Hardware and scaling configurations for the worker nodes.
################################################################################

variable "node_group_name" {
  description = "The name of the EKS node group."
  type        = string
}

variable "node_role" {
  description = "The name of the IAM role for the node group."
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnet IDs where the nodes will be deployed."
  type        = list(string)
}

# --- Instance & Capacity Specs ---

variable "capacity_type" {
  description = "Type of capacity for the node group (ON_DEMAND or SPOT)."
  type        = string
}

variable "instance_types" {
  description = "A list of instance types associated with the node group."
  type        = list(string)
}

variable "disk_size" {
  description = "The disk size (in GiB) for the worker nodes."
  type        = number
}

# --- Scaling Configuration ---

variable "desired_size" {
  description = "The desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes."
  type        = number
}