# Security Group for DB server
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.MyVpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.Resource_SG_Main_Server
}

# Security Group for WP-Staging-server
resource "aws_security_group" "WP-Staging-server" {
  name        = "WP-Staging-server"
  description = "Allow all inbound traffic in WP-Staging-server"
  vpc_id      = aws_vpc.MyVpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.Resource_SG_Staging_Server
}

# Security Group for WP-Live-Server
resource "aws_security_group" "WP-Live-server" {
  name        = "WP-Live-Server"
  description = "Allow all inbound traffic in WP Live Server"
  vpc_id      = aws_vpc.MyVpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.Resource_SG_Live_Server
}