# Bloque data usado para obtener la información de la clave pública en nuestra consola de AWS.

data "aws_key_pair" "key" {
  key_name = "instancia01"
}