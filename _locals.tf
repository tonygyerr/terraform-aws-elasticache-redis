locals {
  original_tags = "${join(var.delimiter, compact(concat(list(var.namespace, var.environment, var.name), var.attributes)))}"
}

locals {
  convert_case = "${var.convert_case == "true" ? true : false}"
}

locals {
  transformed_tags = "${local.convert_case == true ? lower(local.original_tags) : local.original_tags}"
}

locals {
  enabled = "${var.enabled == "true" ? true : false}"

  id = "${local.enabled == true ? local.transformed_tags : ""}"

  name        = "${local.enabled == true ? (local.convert_case == true ? lower(format("%v", var.name)) : format("%v", var.name)) : ""}"
  namespace   = "${local.enabled == true ? (local.convert_case == true ? lower(format("%v", var.namespace)) : format("%v", var.namespace)) : ""}"
  environment = "${local.enabled == true ? (local.convert_case == true ? lower(format("%v", var.environment)) : format("%v", var.environment)) : ""}"
  delimiter   = "${local.enabled == true ? (local.convert_case == true ? lower(format("%v", var.delimiter)) : format("%v", var.delimiter)) : ""}"
  attributes  = "${local.enabled == true ? (local.convert_case == true ? lower(format("%v", join(var.delimiter, compact(var.attributes)))) : format("%v", join(var.delimiter, compact(var.attributes)))) : ""}"

  # Merge input tags with our tags.
  # Note: `Name` has a special meaning in AWS and we need to disamgiuate it by using the computed `id`
  tags = "${
    merge(
      map(
        "Name", "${local.id}",
        "Namespace", "${local.namespace}",
        "Environment", "${local.environment}"
      ), var.tags
    )
  }"
}

locals {
  elasticache_subnet_group_name = var.elasticache_subnet_group_name != "" ? var.elasticache_subnet_group_name : join("", aws_elasticache_subnet_group.default.*.name)
}