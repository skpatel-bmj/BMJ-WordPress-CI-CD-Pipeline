# Main VPC Block
resource "aws_vpc" "MyVpc" {
  cidr_block = "10.0.0.0/16"
  tags       = local.Resource_VPC
}

# Private Subnet Block
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.MyVpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2a"
  tags              = local.Resource_VPC_Subnet
}

# Internetgateway Block
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.MyVpc.id
  tags   = local.Resource_VPC_InternetGateway
}

# Route Table Block
resource "aws_route_table" "RT_1" {
  vpc_id = aws_vpc.MyVpc.id
  tags   = local.Resource_VPC_Route_table
}

# Route table association 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.RT_1.id
}

# Internet getway Block
resource "aws_route" "route_igw" {
  route_table_id         = aws_route_table.RT_1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IG.id
  depends_on             = [aws_route_table.RT_1]
}