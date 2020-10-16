resource "aws_security_group" "sin-dynamic-block" {
  name        = "example-sg"
  description = "SG de test, sin dynamic-block"
  vpc_id      = "vpc-0b3245742eaae580a"

  ingress {
    description = "Inbound para SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    description = "Inbound para HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    description = "Inbound para HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    description = "Inbound para postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  tags = {
    Name = "example-sin-dinamic-block"
  }
}
