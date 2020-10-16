Vemos que dentro del main.tf el bloque de ingress es repetido 4 veces
```
ingress {
    description = "Inbound para SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }
```  
