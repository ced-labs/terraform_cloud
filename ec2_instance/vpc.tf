# En este archivo creamos las redes necesarias para el laboratorio

# NETWORK_BLOCK
# VPC
resource "aws_vpc" "vpc_paris" {
  cidr_block = var.vpc_paris_cidr
}

# SUBNETS_BLOCK

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_paris.id
  cidr_block = var.public_subnet_cidr
  # map_public_ip_on_lunch: Asigna una IP Publica a cada instancia que se encuentre en esta red
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_paris.id
  cidr_block = var.private_subnet_cidr
}

# EXTERNAL_CONNECTION_BLOCK
# SECURITY_GROUP
resource "aws_security_group" "sg_instancia01" {
  description = "sg_instancia01"
  name        = "Allow SSH ingress/egress traffic"
  vpc_id      = aws_vpc.vpc_paris.id

  # Reglas de entrada
  ingress {
    description = "SSH over Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Debemos sustituir el bloque ALL-ZERO nuestra IP Publica
    cidr_blocks = [var.ingress_cidr]
  }

  # Reglas de salida
  egress {
    description = "SSH Traffic"
    from_port   = 0
    to_port     = 100
    protocol    = "-1"
    # Debemos sustituir el bloque ALL-ZERO nuestra IP Publica
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# INTERNET_GATEWAY
resource "aws_internet_gateway" "igw_vpc_paris" {
  vpc_id = aws_vpc.vpc_paris.id
}

# ROUTE_TABLE
resource "aws_route_table" "crt_public_subnet" {
  vpc_id = aws_vpc.vpc_paris.id

  route {
    # Con el CIDR le indicamos a la route table que los recursos pueden ir a cualquier destino
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_paris.id
  }
}

# CRT Association
# Asociamos la tabla creada anteriormente con la subnet de la instancia
resource "aws_route_table_association" "crt_assoc_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.crt_public_subnet.id
}
