

module "vpc" {
  source = "./module/vpc"
  vpc-cidr = var.vpc-cidr
  subnet-cidr = var.subnet-cidr
}