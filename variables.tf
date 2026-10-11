variable "ecr_pull_through_cache_rule_lookup" {
  description = <<EOT
Map of ecr_pull_through_cache_rule_lookup, attributes below
Required:
    - ecr_repository_prefix
Optional:
    - region
EOT

  type = map(object({
    ecr_repository_prefix = string
    region                = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.ecr_pull_through_cache_rule_lookup : (
        (length(v.ecr_repository_prefix) >= 2 && length(v.ecr_repository_prefix) <= 30) && (can(regex("(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*", v.ecr_repository_prefix)))
      )
    ])
    error_message = "all of: must be between 2 and 30 characters; must only include alphanumeric, underscore, period, hyphen, or slash characters"
  }
}

