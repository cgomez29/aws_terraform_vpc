resource "random_id" "random_id_prefix"  {
  byte_length = 2
}


locals {
     production_availability_zone_a = "${var.region}a"
     production_availability_zone_b = "${var.region}b"
}

module "vpc" {
    source                   = "./modules/vpc"
    environment              = var.environment
    vpc_cidr                 = var.vpc_cidr
    public_subnets_cidr_a1   = var.public_subnets_cidr_a1
    private_subnets_cidr_a2  = var.private_subnets_cidr_a2
    private_subnets_cidr_a3  = var.private_subnets_cidr_a3
    availability_zone_a      = local.production_availability_zone_a
    availability_zone_b      = local.production_availability_zone_b
}


module "ec2" {
    source                = "./modules/ec2"
    key_name              = var.key_name
    instance_ami          = var.instance_ami
    instance_type         = var.instance_type
    instance_count        = var.instance_count

    environment           = var.environment
    availability_zone_a   = local.production_availability_zone_a
    availability_zone_b   = local.production_availability_zone_b
    
    private_subnets_a2_id = module.vpc.private_subnets_a2_id
    private_subnets_a3_id = module.vpc.private_subnets_a3_id
    vpc_id                = module.vpc.vpc_id
}