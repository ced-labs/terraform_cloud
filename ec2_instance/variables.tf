# En este archivo definimos las variables que usaremos, como su nombre, tipo o descripcion

variable "vpc_paris_cidr" {
  description = "CIDR Paris"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR Private Subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR Public Subnet"
  type        = string
}

variable "default_tags" {
  description = "Lista de tags por defecto"
  type        = map(string)
}

variable "ingress_cidr" {
  description = "CIDR ingress"
  type        = string
}

# Estas variables sirven para conectar con Terraform Cloud
variable "access_key" {
  
}

variable "secret_key" {
  
}