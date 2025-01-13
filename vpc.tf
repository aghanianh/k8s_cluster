module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = "${var.cluster_name}-vpc"
  cidr                 = var.vpc_cidr
  instance_tenancy     = "default"
  azs                  = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets      = var.private_subnet
  public_subnets       = var.public_subnet
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

