resource "aws_instance" "Shabu-Terraform-Instance" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.Shabu-Security.id]
  instance_type          = "t3.micro"

  root_block_device {
    volume_size = 30 # in GB <<----- I increased this!
    volume_type = "gp3"
  }
  user_data = file("docker.sh")

  tags = {
    Name = "docker"
  }
}

resource "aws_security_group" "Shabu-Security" {
  name        = "Shabu-Security"
  description = "allow-all with out any restriciton"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Semantically equivalent to "all"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic from anywhere (IPv4)"
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