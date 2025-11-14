##################################################### Ec2 Instance #####################################################
resource "aws_instance" "Shabu-Terraform-Instance" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.Shabu-Security.id]
  instance_type          = "t3.micro"

  tags = {
    Name    = "Terraform-Shabu-Demo"
    Purpose = "creating ec2 using terraform"
  }
}
################################################### Ec2 Instance #####################################################

################################################# Security Group #####################################################
resource "aws_security_group" "Shabu-Security" {
  name        = "Shabu-Security"
  description = "allow-all with out any restriciton"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "allow-all"
  }
}
################################################# Security Group #####################################################