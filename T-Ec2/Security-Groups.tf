
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