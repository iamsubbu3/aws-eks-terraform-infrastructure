################################################################################
# 1. CORE NETWORKING (VPC, Subnets, IGW, NAT)
################################################################################

module "vpc" {
  source           = "./modules/vpc"
  vpc_name         = var.vpc_name
  vpc_cidr_block   = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  azs = [
    var.public_subnet_1_avail_zone,
    var.public_subnet_2_avail_zone,
    var.public_subnet_3_avail_zone
  ]

  public_subnets = [
    var.public_subnet_1_cidr_block,
    var.public_subnet_2_cidr_block,
    var.public_subnet_3_cidr_block
  ]

  private_subnets = [
    var.private_subnet_1_cidr_block,
    var.private_subnet_2_cidr_block,
    var.private_subnet_3_cidr_block
  ]
}

################################################################################
# 2. SECURITY GROUPS
################################################################################

module "security" {
  source = "./modules/security"

  vpc_id          = module.vpc.vpc_id
  sg_name         = var.sg_name
  my_ip           = var.my_ip
  eks_jump_server = var.eks_jump_server
}

################################################################################
# 3. COMPUTE
################################################################################

module "compute" {
  source = "./modules/compute"

  vpc_security_group_ids = [module.security.sg_id]
  public_subnet_ids      = module.vpc.public_subnet_ids
  public_instances       = var.public_instances

  depends_on = [
    module.vpc,
    module.security
  ]
}

################################################################################
# 4. EKS CLUSTER
################################################################################

module "eks" {
  source = "./modules/eks"

  # Cluster
  cluster_name = var.eks_cluster_name
  cluster_role = var.eks_cluster_role_name
  my_ip        = var.my_ip

  # Node Group
  node_role       = var.eks_node_group_role_name
  node_group_name = var.node_group_name

  # Networking
  all_subnet_ids  = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnets = module.vpc.private_subnet_ids

  node_security_group_id = module.security.sg_id

  # Node Config
  instance_types = var.node_instance_types
  capacity_type  = var.node_instance_capacity_type
  desired_size   = var.node_desired_size
  max_size       = var.node_max_size
  min_size       = var.node_min_size
  disk_size      = var.node_disk_size

  depends_on = [
    module.vpc,
    module.security
  ]
}
