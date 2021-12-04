variable "vpc_config" {
  type        = map(string)
  description = "VPC Configuration"
  default     = {}
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = ""
}

variable "app_name" {
  type = string
  default = ""
}

variable "subnets" {
  type        = list(string)
  description = "Subnet IDs"
  default     = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
  default     = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
  default     = []
}

variable "replication_group_description" {
  type        = string
  description = "Descriptionof replication group"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "cluster_size" {
  type        = number
  description = "Number of nodes in cluster"
}

variable "instance_type" {
  type        = string
  description = "Elastic cache instance type"
}

variable "family" {
  type        = string
  description = "Redis family"
}

variable "engine_version" {
  type        = string
  description = "Redis engine version"
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "Enable encryption at rest"
}

variable "automatic_failover_enabled" {
  type = bool
}
variable "transit_encryption_enabled" {
  type        = bool
  description = "Enable TLS"
}

variable "zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
}

variable "environment" {
  type    = string
  default = ""
}

variable "application" {
  type    = string
  default = ""
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ map(\"BusinessUnit\",\"ABC\")"
  default     = {}
}

variable "number_of_subnets" {
  description = "The number of subnets needed"
  type        = string
  default     = null
}