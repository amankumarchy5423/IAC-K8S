# vpc
resource "aws_vpc" "aman-vpc" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc-name
  }
}

# subnets
resource "aws_subnet" "subnet" {
    count = length(var.subnet-cidr)
  vpc_id = aws_vpc.aman-vpc.id
  cidr_block = var.subnet-cidr[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnets-name[count.index]
  }

}

# Internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.aman-vpc.id

  tags = {
    Name = var.ig-name
  }
}

# Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.aman-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
}

# Route table association
resource "aws_route_table_association" "name" {
   subnet_id = aws_subnet.subnet[0].id
   route_table_id = aws_route_table.rt.id
}

