# This file Contend all the Tages
# created by sandeep kumar Patel

# Main Server Cration 
resource "aws_instance" "Main_server" {
  #ami                         = data.aws_ami.AmazonAmiName.id
  ami                         = "ami-00eeedc4036573771"
  instance_type               = "t2.micro"
  key_name                    = "terraform_key"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  availability_zone           = "us-east-2a"
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  user_data                   = file("yum.sh")
  tags                        = local.Resource_EC2_Main_server_tags
}

resource "aws_instance" "Staging_server" {
  ami                         = "ami-00eeedc4036573771"
  instance_type               = "t2.micro"
  key_name                    = "terraform_key"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  availability_zone           = "us-east-2a"
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  user_data                   = file("wp.sh")
  tags                        = local.Resource_EC2_Staging_server_tags
}

resource "aws_instance" "Live_server" {
  ami                         = "ami-00eeedc4036573771"
  instance_type               = "t2.micro"
  key_name                    = "terraform_key"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  availability_zone           = "us-east-2a"
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  user_data                   = file("wp.sh")
  tags                        = local.Resource_EC2_Live_server_tags
}

