resource "aws_security_group" "con-dynamic-block" {
  name        = "example-sg"
  description = "SG de test, con dynamic-block"
  vpc_id      = "vpc-0b3245742eaae580a"

  dynamic "ingress" {
    for_each = var.default_ingress
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  tags = {
    Name = "example-con-dinamic-block"
  }
}



