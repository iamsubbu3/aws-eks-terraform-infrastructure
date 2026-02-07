################################################################################
# 1. SECURITY GROUP DEFINITION
# Acts as a virtual firewall for your EC2 instances and EKS environment.
################################################################################

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "Security group for inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }

  ################################################################################
  # 2. INBOUND RULES (INGRESS)
  ################################################################################

  # --- Administrative & Management Access ---
  
  ingress {
    description = "SSH access for admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTPS access for EKS Management"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.eks_jump_server]
  }

  # --- Application & Tooling Traffic ---

  ingress {
    description = "HTTP, Jenkins, and SonarQube traffic"
    from_port   = 80
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ################################################################################
  # 3. OUTBOUND RULES (EGRESS)
  ################################################################################

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}