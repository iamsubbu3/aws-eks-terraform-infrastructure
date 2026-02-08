################################################################################
# SECURITY GROUP DEFINITION
# Firewall for EC2 instances and EKS access
################################################################################

resource "aws_security_group" "sg" {

  name        = var.sg_name
  description = "Security group for EC2, Ansible, Jenkins, and EKS access"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }

  ################################################################################
  # INBOUND RULES (INGRESS)
  ################################################################################

  # SSH from your laptop to Control Node
  ingress {
    description = "SSH access from admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # SSH between Control Node and Jenkins Worker (Ansible communication)
  ingress {
    description = "SSH between instances in same SG"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    self        = true
  }

  # EKS API Access (kubectl / eksctl)
  ingress {
    description = "HTTPS access for EKS management"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.eks_jump_server]
  }

  # Web + Jenkins + SonarQube access
  ingress {
    description = "HTTP, Jenkins, SonarQube"
    from_port   = 80
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ################################################################################
  # OUTBOUND RULES (EGRESS)
  ################################################################################

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
