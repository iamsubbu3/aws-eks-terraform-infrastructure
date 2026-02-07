################################################################################
# 1. GLOBAL SETTINGS
################################################################################
aws_region = "us-east-1"

################################################################################
# 2. VPC & NETWORKING
################################################################################
vpc_cidr_block   = "10.0.0.0/16"
instance_tenancy = "default"
vpc_name         = "terraform-vpc"

# Public Subnets
public_subnet_1_cidr_block = "10.0.1.0/24"
public_subnet_1_avail_zone = "us-east-1a"
public_subnet_2_cidr_block = "10.0.2.0/24"
public_subnet_2_avail_zone = "us-east-1b"
public_subnet_3_cidr_block = "10.0.3.0/24"
public_subnet_3_avail_zone = "us-east-1c"

# Private Subnets
private_subnet_1_cidr_block = "10.0.4.0/24"
private_subnet_1_avail_zone = "us-east-1a"
private_subnet_2_cidr_block = "10.0.5.0/24"
private_subnet_2_avail_zone = "us-east-1b"
private_subnet_3_cidr_block = "10.0.6.0/24"
private_subnet_3_avail_zone = "us-east-1c"

################################################################################
# 3. SECURITY GROUPS
################################################################################
sg_name         = "terraform-sg"
my_ip           = "49.206.131.83/32"
eks_jump_server = "0.0.0.0/0"

################################################################################
# 4. EC2 PUBLIC INSTANCES
################################################################################
public_instance_ami_1         = "ami-0ecb62995f68bb549"
public_instance_type_1        = "t3.large"
public_instance_key_pair_1    = "iamsubbu-keypair"
public_instance_volume_size_1 = 50
public_instance_volume_type_1 = "gp3"
public_instance_name_1        = "terraform-public-instance-1"

public_instance_ami_2         = "ami-0ecb62995f68bb549"
public_instance_type_2        = "t3.medium"
public_instance_key_pair_2    = "iamsubbu-keypair"
public_instance_volume_size_2 = 50
public_instance_volume_type_2 = "gp3"
public_instance_name_2        = "terraform-public-instance-2"

################################################################################
# 5. EKS CLUSTER SETTINGS
################################################################################
eks_cluster_name            = "subbu-cluster"
eks_cluster_role_name       = "eks-cluster-role"
eks_node_group_role_name    = "eks-node-group-role"
node_group_name             = "SPOT-node-group"
node_instance_capacity_type  = "SPOT"
node_instance_type          = "t3.large"
node_desired_size           = 2
node_max_size               = 3
node_min_size               = 1
node_disk_size              = 50

################################################################################
# 6. S3 BACKEND / STATE STORAGE
################################################################################

tfstate_backup_s3_bucket_name      = "terraform-subbu-tf-test-bucket"
tfstate_backup_s3_tag_name         = "terraform-subbu-tf-test-bucket"
tfstate_backup_s3_environment_name = "Dev"