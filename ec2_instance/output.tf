# Para conectar a nuestra instancia necesitamos saber la IP Publica, y esta no se conoce hasta despues de desplegar la infraestructura
# Con aws_instance hacemos referencia al tipo de recurso (la instancia) y en especifico al valor que se puede obtener tras el despliegue
# Consultar Terraform Registry para comprobar que informacion mas se puede obtener

output "ec2_public_ip" {
  description = "IP Publica de la instancia: instancia01"
  value       = aws_instance.instancia01.public_ip
}