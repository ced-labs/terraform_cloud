# En este archivo creamos la instancia con la informacion necesaria segun la documentacion de Terraform Registry
# Informacion previa
# ami: Es el ID de la imagen del SO sumado a la zona de despliegue
# instance_type: Es el SKU de la MV
# subnet_id: Toda MV necesita estar asociada a una red si queremos que sea accesible desde el exterior
# key_name: Obtenemos la clave publica que asociaremos a nuestra MV para conectar desde el exterior
# vpc_security_group_ids: Toda MV necesita estar asociada a un grupo de seguridad

resource "aws_instance" "instancia01" {
  ami                    = "ami-0111c5910da90c2a7"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  tags                   = var.default_tags
  vpc_security_group_ids = [aws_security_group.sg_instancia01.id]
}