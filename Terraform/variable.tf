variable "vpc-cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "subnet-cidr" {
  type        = list(string)
  description = "the cidr block for the subnets"
}

variable "instance-ami" {
  description = "ami for instance"
  type = string
}