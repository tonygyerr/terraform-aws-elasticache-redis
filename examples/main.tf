# module "vpc" {
#   source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.8.1"
#   namespace  = var.namespace
#   stage      = var.stage
#   name       = var.name
#   cidr_block = "172.16.0.0/16"
# }

# module "subnets" {
#   source               = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.18.1"
#   availability_zones   = var.availability_zones
#   namespace            = var.namespace
#   stage                = var.stage
#   name                 = var.name
#   vpc_id               = module.vpc.vpc_id
#   igw_id               = module.vpc.igw_id
#   cidr_block           = module.vpc.vpc_cidr_block
#   nat_gateway_enabled  = true
#   nat_instance_enabled = false
# }

module "redis" {
  source                     = "git::https://github.com/tonygyerr/terraform-aws-elasticache-redis.git"
  availability_zones         = var.availability_zones
  app_name                   = var.app_name
  namespace                  = var.namespace
  stage                      = var.stage
  name                       = var.name
  zone_id                    = var.zone_id
  vpc_id                     = var.vpc_config.vpc_id               #module.vpc.vpc_id
  allowed_security_groups    = [module.redis.security_group_id] #[var.vpc_config.security_group_ids]   #[module.vpc.api_security_group_id]
  subnets                    = module.redis.subnet_ids #[var.vpc_config.private_db_subnets] #module.vpc.private_db_subnets #module.vpc.private_db_subnets
  cluster_size               = var.cluster_size
  instance_type              = var.instance_type
  apply_immediately          = true
  automatic_failover_enabled = var.automatic_failover_enabled
  engine_version             = var.engine_version
  family                     = var.family
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled

  parameter = [
    {
      name  = "notify-keyspace-events"
      value = "lK"
    }
  ]
}