################################################################################
# 1. PUBLIC INSTANCE 1 (e.g., Ansible/Jenkins Jump Server)
# Deployed in Public Subnet 1 for administrative and tooling tasks.
################################################################################

resource "aws_instance" "public_1" {
  ami                         = var.ami_1
  instance_type               = var.type_1
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.public_subnet_1_id
  key_name                    = var.key_1
  associate_public_ip_address = true

  # --- Storage Configuration ---
  root_block_device {
    volume_size = var.vol_size_1
    volume_type = var.vol_type_1
  }

  tags = {
    Name = var.name_1
  }
}

################################################################################
# 2. PUBLIC INSTANCE 2
# Deployed in Public Subnet 2 for secondary services or high availability.
################################################################################

resource "aws_instance" "public_2" {
  ami                         = var.ami_2
  instance_type               = var.type_2
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.public_subnet_2_id
  key_name                    = var.key_2
  associate_public_ip_address = true

  # --- Storage Configuration ---
  root_block_device {
    volume_size = var.vol_size_2
    volume_type = var.vol_type_2
  }

  tags = {
    Name = var.name_2
  }
}