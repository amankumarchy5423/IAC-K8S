variable "vpc-cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc-name" {
  type        = string
  description = "The name of the VPC"
  default = "aman-vpc"
}

variable "subnet-cidr" {
  type        = list(string)
  description = "the cidr block for the subnets"
}
variable "subnets-name" {
  type        = list(string)
  description = "the name block for the subnets"
  default = [ "public-subnet" ,"private-subnet" ]
}