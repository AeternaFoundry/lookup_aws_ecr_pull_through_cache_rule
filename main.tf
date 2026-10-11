data "aws_ecr_pull_through_cache_rule" "ecr_pull_through_cache_rule_lookup" {
  for_each = var.ecr_pull_through_cache_rule_lookup

  ecr_repository_prefix = each.value.ecr_repository_prefix
  region                = each.value.region
}

