Autor: Cristian Escribano
Version: 1.0

###

Laboratorio de IaC con Terraform en AWS:
Se crea una infrastructura que consiste en una VPC principal con dos subnets (una pública y una privada).
En la subnet privada se encuentra una instancia de EC2 accesible desde el exterior por SSH o desde la propia consola de AWS.
Para este propósito se crea una Custom Route Table, una Internet Gateway y un Security Group.

Los archivos se encuentran comentados.
La información adicional y los recursos de providers se encuentra en registry.terraform.io.
En la documentación oficial de Amazon Web Services podemos obtener la ayuda para conocer lo necesario a construir para que la instancia sea accesible.
