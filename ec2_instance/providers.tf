# Este archivo define los providers con los que construiremos
# Definimos el provider externo en este caso, AWS y la version

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

# Definimos la region con la que trabajaremos y los tags por defecto que tendran todos los recursos creados

provider "aws" {
  region = "eu-west-3"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = var.default_tags
  }
}