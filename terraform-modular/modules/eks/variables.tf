################################################################################
# 1. EKS CLUSTER CONFIGURATION (CONTROL PLANE)
################################################################################

variable "cluster_name" {
  description = "Name of the EKS Cluster."
  type        = string
}

variable "cluster_role" {
  description = "IAM Role name used by the EKS Control Plane."
  type        = string
}

variable "all_subnet_ids" {
  description = "List of all subnet IDs (public + private) used by the cluster."
  type        = list(string)
}

variable "node_security_group_id" {
  description = "Security Group attached to EKS control plane endpoint"
  type        = string
}

# ADD THIS BLOCK HERE
variable "my_ip" {
  description = "CIDR allowed to access EKS API."
  type        = string
}

################################################################################
# 2. NODE GROUP CONFIGURATION (DATA PLANE)
################################################################################

variable "node_group_name" {
  description = "Name of the EKS Managed Node Group."
  type        = string
}

variable "node_role" {
  description = "IAM Role name assigned to worker nodes."
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs where worker nodes will be launched."
  type        = list(string)
}

################################################################################
# 3. NODE INSTANCE SETTINGS
################################################################################

variable "capacity_type" {
  description = "Capacity type for nodes (ON_DEMAND or SPOT)."
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types used by the node group."
  type        = list(string)
}

variable "disk_size" {
  description = "Root disk size (GiB) for worker nodes."
  type        = number
}

################################################################################
# 4. AUTO SCALING CONFIGURATION
################################################################################

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}
