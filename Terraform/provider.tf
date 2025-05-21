terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.0"
    }
  # }
  #   backend "s3" {
  #   bucket   = "terraform-backend-faa8ca0bcf "
  #   key      = "terraform.tfstate"
  #   region   = "ap-south-1"
  }

}

provider "aws" {
  region = "ap-south-1"
}