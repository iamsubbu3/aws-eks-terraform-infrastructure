################################################################################
# 1. CORE NETWORKING
# This module creates the VPC, Subnets, IGW, and NAT Gateway.
################################################################################
module "vpc" {
  source           = "./modules/vpc"
  vpc_name         = var.vpc_name
  vpc_cidr_block   = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  
  # Lists are required by the module's count logic
  azs              = [var.public_subnet_1_avail_zone, var.public_subnet_2_avail_zone, var.public_subnet_3_avail_zone]
  public_subnets   = [var.public_subnet_1_cidr_block, var.public_subnet_2_cidr_block, var.public_subnet_3_cidr_block]
  private_subnets  = [var.private_subnet_1_cidr_block, var.private_subnet_2_cidr_block, var.private_subnet_3_cidr_block]
}

################################################################################
# 2. SECURITY GROUPS
# Creates the firewall rules. Depends on the VPC ID output from the VPC module.
################################################################################
module "security" {
  source          = "./modules/security"
  vpc_id          = module.vpc.vpc_id
  sg_name         = var.sg_name
  my_ip           = var.my_ip
  eks_jump_server = var.eks_jump_server
}

################################################################################
# 3. COMPUTE (EC2)
# Deploys Jenkins/Ansible instances into the Public Subnets.
################################################################################
module "compute" {
  source                 = "./modules/compute"
  vpc_security_group_ids = [module.security.sg_id]
  
  # Referencing specific subnet IDs from the module's output list
  public_subnet_1_id    = module.vpc.public_subnet_ids[0]
  ami_1                 = var.public_instance_ami_1
  type_1                = var.public_instance_type_1
  key_1                 = var.public_instance_key_pair_1
  vol_size_1            = var.public_instance_volume_size_1
  vol_type_1            = var.public_instance_volume_type_1
  name_1                = var.public_instance_name_1

  public_subnet_2_id    = module.vpc.public_subnet_ids[1]
  ami_2                 = var.public_instance_ami_2
  type_2                = var.public_instance_type_2
  key_2                 = var.public_instance_key_pair_2
  vol_size_2            = var.public_instance_volume_size_2
  vol_type_2            = var.public_instance_volume_type_2
  name_2                = var.public_instance_name_2
}

################################################################################
# 4. EKS CLUSTER
# Deploys the Kubernetes Control Plane and Worker Nodes.
################################################################################
module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.eks_cluster_name
  cluster_role    = var.eks_cluster_role_name
  node_role       = var.eks_node_group_role_name
  node_group_name = var.node_group_name
  
  # Merging public and private subnets for the EKS control plane
  all_subnet_ids  = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnets = module.vpc.private_subnet_ids

  instance_types  = [var.node_instance_type]
  capacity_type   = var.node_instance_capacity_type
  desired_size    = var.node_desired_size
  max_size        = var.node_max_size
  min_size        = var.node_min_size
  disk_size       = var.node_disk_size
}