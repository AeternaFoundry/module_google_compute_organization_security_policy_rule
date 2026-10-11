variable "compute_organization_security_policy_rules" {
  description = <<EOT
Map of compute_organization_security_policy_rules, attributes below
Required:
    - action
    - policy_id
    - priority
    - match (block):
        - config (optional, block):
            - src_ip_ranges (optional)
        - description (optional)
        - expr (optional, block):
            - expression (required)
        - versioned_expr (optional)
Optional:
    - deletion_policy
    - description
    - preview
    - header_action (block):
        - request_headers_to_adds (optional, block):
            - header_name (optional)
            - header_value (optional)
    - preconfigured_waf_config (block):
        - exclusion (optional, block):
            - request_cookie (optional, block):
                - operator (required)
                - value (optional)
            - request_header (optional, block):
                - operator (required)
                - value (optional)
            - request_query_param (optional, block):
                - operator (required)
                - value (optional)
            - request_uri (optional, block):
                - operator (required)
                - value (optional)
            - target_rule_ids (optional)
            - target_rule_set (required)
    - redirect_options (block):
        - target (optional)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    action          = string
    policy_id       = string
    priority        = number
    deletion_policy = optional(string)
    description     = optional(string)
    preview         = optional(bool)
    match = object({
      config = optional(object({
        src_ip_ranges = optional(list(string))
      }))
      description = optional(string)
      expr = optional(object({
        expression = string
      }))
      versioned_expr = optional(string)
    })
    header_action = optional(object({
      request_headers_to_adds = optional(list(object({
        header_name  = optional(string)
        header_value = optional(string)
      })))
    }))
    preconfigured_waf_config = optional(object({
      exclusion = optional(list(object({
        request_cookie = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_header = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_query_param = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        request_uri = optional(list(object({
          operator = string
          value    = optional(string)
        })))
        target_rule_ids = optional(list(string))
        target_rule_set = string
      })))
    }))
    redirect_options = optional(object({
      target = optional(string)
      type   = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.compute_organization_security_policy_rules : (
        v.preconfigured_waf_config == null || (v.preconfigured_waf_config.exclusion == null || alltrue([for item in v.preconfigured_waf_config.exclusion : (item.request_cookie == null || alltrue([for item in item.request_cookie : (contains(["EQUALS", "STARTS_WITH", "ENDS_WITH", "CONTAINS", "EQUALS_ANY"], item.operator))]))]))
      )
    ])
    error_message = "must be one of: \"EQUALS\", \"STARTS_WITH\", \"ENDS_WITH\", \"CONTAINS\", \"EQUALS_ANY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.compute_organization_security_policy_rules : (
        v.preconfigured_waf_config == null || (v.preconfigured_waf_config.exclusion == null || alltrue([for item in v.preconfigured_waf_config.exclusion : (item.request_header == null || alltrue([for item in item.request_header : (contains(["EQUALS", "STARTS_WITH", "ENDS_WITH", "CONTAINS", "EQUALS_ANY"], item.operator))]))]))
      )
    ])
    error_message = "must be one of: \"EQUALS\", \"STARTS_WITH\", \"ENDS_WITH\", \"CONTAINS\", \"EQUALS_ANY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.compute_organization_security_policy_rules : (
        v.preconfigured_waf_config == null || (v.preconfigured_waf_config.exclusion == null || alltrue([for item in v.preconfigured_waf_config.exclusion : (item.request_query_param == null || alltrue([for item in item.request_query_param : (contains(["EQUALS", "STARTS_WITH", "ENDS_WITH", "CONTAINS", "EQUALS_ANY"], item.operator))]))]))
      )
    ])
    error_message = "must be one of: \"EQUALS\", \"STARTS_WITH\", \"ENDS_WITH\", \"CONTAINS\", \"EQUALS_ANY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.compute_organization_security_policy_rules : (
        v.preconfigured_waf_config == null || (v.preconfigured_waf_config.exclusion == null || alltrue([for item in v.preconfigured_waf_config.exclusion : (item.request_uri == null || alltrue([for item in item.request_uri : (contains(["EQUALS", "STARTS_WITH", "ENDS_WITH", "CONTAINS", "EQUALS_ANY"], item.operator))]))]))
      )
    ])
    error_message = "must be one of: \"EQUALS\", \"STARTS_WITH\", \"ENDS_WITH\", \"CONTAINS\", \"EQUALS_ANY\""
  }
}

