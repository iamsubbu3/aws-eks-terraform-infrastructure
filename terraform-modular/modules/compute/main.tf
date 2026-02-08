################################################################################
# PUBLIC EC2 INSTANCES (FOR_EACH BASED)
################################################################################

resource "aws_instance" "public" {

  for_each = { for idx, inst in var.public_instances : inst.name => inst }

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids

  # Automatically distribute across subnets
  subnet_id = element(var.public_subnet_ids, index(var.public_instances, each.value) % length(var.public_subnet_ids))

  associate_public_ip_address = true

  root_block_device {
    volume_size = each.value.volume_size
    volume_type = each.value.volume_type
  }

  tags = {
    Name = each.value.name
  }
}
