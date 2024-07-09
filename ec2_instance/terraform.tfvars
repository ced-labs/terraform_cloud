# En este archivo se refleja toda la información que contiene cada variable del archivo variables.tf

# NETWORK
vpc_paris_cidr      = "10.10.0.0/16"
private_subnet_cidr = "10.10.0.0/24"
public_subnet_cidr  = "10.10.1.0/24"

# DEFAULT TAGS
default_tags = {
  "Autor"   = "ced_labs"
  "Version" = "1.0"
  "Project" = "iac_training"
}

# REGLAS
ingress_cidr = "0.0.0.0/0"