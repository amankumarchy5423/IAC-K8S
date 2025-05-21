resource "aws_vpc" "aman-vpc" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "subnet" {
    count = length(var.subnet-cidr)
  vpc_id = aws_vpc.aman-vpc.id
  cidr_block = var.subnet-cidr[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnets-name[count.index]
  }

}