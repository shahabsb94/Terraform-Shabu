module "VPC" {
  source = "../VPC-Module"
  vpc_cidr = var.vpc_cidr
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
}