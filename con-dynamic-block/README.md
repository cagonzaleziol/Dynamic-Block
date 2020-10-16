En este ejemplo los 4 bloques de ingress son sustituidos por un dinamyc block

```terraform
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
```

En este ejemplo la variable **default_ingress** es usada en el loop. La variable es de tipo mapa y es iterada dentro del loop for_each

```
variable default_ingress {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    22 = { description = "Inbound para SSH", cidr_blocks = [ "127.0.0.1/32" ] }
    80 = { description = "Inbound para HTTP", cidr_blocks = [ "127.0.0.1/32" ] }
    443 = { description = "Inbound para HTTPS", cidr_blocks = [ "127.0.0.1/32" ] }
    5432 = { description = "Inbound para postgres", cidr_blocks = [ "127.0.0.1/32" ] }
  }
}

```
Algo para tener en cuenta con el uso de dynamic block es que cuando queremos acceder a algún valor de esa variable usada en el for_each debemos usar el local_name del dynamic block.
Si el dinamic block se llama "ingress" podemos acceder a las keys de ese mapa con "ingress.key" y al valor de esa llave con "ingress.value".