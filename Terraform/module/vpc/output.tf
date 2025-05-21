output "vpc-id" {
  value = aws_vpc.aman-vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet[0].id
}