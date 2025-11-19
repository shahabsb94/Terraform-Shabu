##################################################### Ec2 Instance #####################################################
resource "aws_instance" "Shabu-Terraform-Instance" {
  count = 3
  ami                    = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.Shabu-Security.id]
  # instance_type = var.instance_type # ------> this is using variable directy with default value
  instance_type = var.Enviroment == "Prod" ? "t3.small" : "t3.micro" # ------> this is using condition in terraform
  tags          = {
    Name = var.instances[count.index]
  }
}
################################################### Ec2 Instance #####################################################

################################################# Security Group #####################################################
resource "aws_security_group" "Shabu-Security" {
  name        = var.sg-name
  description = var.Sg_description

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.cidr_blocks
  }

  tags = var.sg_tags

}
################################################# Security Group #####################################################