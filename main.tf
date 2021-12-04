# module "label" {
#   source      = "../../management/label/"
#   namespace   = var.namespace
#   stage       = var.stage
#   name        = var.name
#   attributes  = var.attributes
#   tags        = var.tags
#   application = var.application
#   environment = var.environment
# }

# module "cache_cpu" {
#   source                          = "../../management/cloudwatch/"
#   cloud_watch_metric_name         = "${module.label.id}-cpu-utilization"
#   cloud_watch_description         = "Redis cluster CPU utilization"
#   cloud_watch_comparison_operator = "GreaterThanThreshold"
#   cloud_watch_evaluation_periods  = "1"
#   cloud_watch_namespace           = "AWS/ElastiCache"
#   cloud_watch_period              = "300"
#   cloud_watch_statistic           = "Average"
#   cloud_watch_threshold           = "30"
#   cache_cluster_id                = module.label.id
#   #alarm_actions                   = "" #module.users_unencrypted.sns_topic_arn
#   #ok_actions                      = "" #module.users_encrypted.sns_topic_arn
#   #depends_on    = [aws_elasticache_replication_group.default]
# }

# module "cache_memory" { 
#   source                          = "../../management/cloudwatch/"
#   cloud_watch_metric_name         = "${module.label.id}-freeable-memory"
#   cloud_watch_description         = "Redis cluster freeable memory"
#   cloud_watch_comparison_operator = "LessThanThreshold"
#   cloud_watch_evaluation_periods  = "1"
#   cloud_watch_namespace           = "AWS/ElastiCache"
#   cloud_watch_period              = "60"
#   cloud_watch_statistic           = "Average"
#   cloud_watch_threshold           = "30"
#   cache_cluster_id                = module.label.id
#   #alarm_actions                   = "" #module.users_unencrypted.sns_topic_arn
#   #ok_actions                      = "" #module.users_encrypted.sns_topic_arn
#   #depends_on    = [aws_elasticache_replication_group.default]
# }

# module "dns" {
#   source  = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-hostname.git?ref=tags/0.3.0"
#   enabled = var.enabled && var.zone_id != "" ? true : false
#   name    = var.dns_subdomain != "" ? var.dns_subdomain : var.name
#   ttl     = 60
#   zone_id = var.zone_id
#   records = var.cluster_mode_enabled ? [join("", aws_elasticache_replication_group.default.*.configuration_endpoint_address)] : [join("", aws_elasticache_replication_group.default.*.primary_endpoint_address)]
# }
