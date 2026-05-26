# Data Block
data "aws_availability_zones" "available" {
  state = "available"
}

# Locals Block
locals {
  azs = slice(data.aws_availability_zones.names,0,3)

  public_subnets = [for k, az in local.azs: cidrsubnet(var.var.var.vpc_cidr,var.var.subnet_newbits,k)]

  private_subnet = [for k, az in local.azs: cidrsubnet(var.var.var.vpc_cidr,var.var.subnet_newbits,k+10)]
}
