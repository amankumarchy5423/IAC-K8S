

module "vpc" {
  source = "./module/vpc"
  vpc-cidr = var.vpc-cidr
  subnet-cidr = var.subnet-cidr
}

module "security-group" {
  source = "./module/sg"
  vpc_id = module.vpc.vpc-id
}

module "instance" {
  source = "./module/ec2"
  instance-ami = var.instance-ami
  subnet_id = module.vpc.subnet_id
  security_groups = [ 
    module.security-group.k8s-sg-name,
    module.security-group.k8s-worker-name,
    module.security-group.sg-common-name
   ]
}

output "public-url" {
  value = module.instance.public-url
}

output "public_ip" {
  value = module.instance.public_ip
}