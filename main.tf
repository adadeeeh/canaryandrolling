provider "aws" {
  region = var.region
}

data "aws_availability_zone" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "canary-rolling-deployment"
  cidr = var.vpc_cidr_block

  azs             = data.aws_availability_zone.available.name
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks

  enable_nat_gateway = false
  enable_vpn_gateway = false
}

module "app_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/web"
  version = "~> 4.0"

  name        = "web-sg"
  description = "Security griyp for web servers with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}