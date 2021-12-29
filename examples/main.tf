module "redis" {
  source                     = "git::https://github.com/tonygyerr/terraform-aws-elasticache-redis.git"
  availability_zones         = var.availability_zones
  app_name                   = var.app_name
  aws_region                 = var.aws_region
  namespace                  = var.namespace
  stage                      = var.stage
  name                       = var.name
  zone_id                    = var.zone_id
  vpc_id                     = var.vpc_id
  allowed_security_groups    = [module.redis.security_group_id] #[var.vpc_config.security_group_ids]   #[module.vpc.api_security_group_id]
  private_db_subnet_ids      = var.private_db_subnets_ids
  cluster_size               = var.cluster_size
  instance_type              = var.instance_type
  number_of_subnets          = var.number_of_subnets
  apply_immediately          = true
  automatic_failover_enabled = var.automatic_failover_enabled
  profile                    - var.profile
  engine_version             = var.engine_version
  family                     = var.family
  replication_group_description = var.replication_group_description
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled

  parameter = [
    {
      name  = "notify-keyspace-events"
      value = "lK"
    }
  ]
}