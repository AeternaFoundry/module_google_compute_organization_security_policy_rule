resource "google_compute_organization_security_policy_rule" "compute_organization_security_policy_rules" {
  for_each = var.compute_organization_security_policy_rules

  action          = each.value.action
  policy_id       = each.value.policy_id
  priority        = each.value.priority
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  preview         = each.value.preview

  match {
    dynamic "config" {
      for_each = each.value.match.config != null ? [each.value.match.config] : []
      content {
        src_ip_ranges = config.value.src_ip_ranges
      }
    }
    description = each.value.match.description
    dynamic "expr" {
      for_each = each.value.match.expr != null ? [each.value.match.expr] : []
      content {
        expression = expr.value.expression
      }
    }
    versioned_expr = each.value.match.versioned_expr
  }

  dynamic "header_action" {
    for_each = each.value.header_action != null ? [each.value.header_action] : []
    content {
      dynamic "request_headers_to_adds" {
        for_each = header_action.value.request_headers_to_adds != null ? header_action.value.request_headers_to_adds : []
        content {
          header_name  = request_headers_to_adds.value.header_name
          header_value = request_headers_to_adds.value.header_value
        }
      }
    }
  }

  dynamic "preconfigured_waf_config" {
    for_each = each.value.preconfigured_waf_config != null ? [each.value.preconfigured_waf_config] : []
    content {
      dynamic "exclusion" {
        for_each = preconfigured_waf_config.value.exclusion != null ? preconfigured_waf_config.value.exclusion : []
        content {
          dynamic "request_cookie" {
            for_each = exclusion.value.request_cookie != null ? exclusion.value.request_cookie : []
            content {
              operator = request_cookie.value.operator
              value    = request_cookie.value.value
            }
          }
          dynamic "request_header" {
            for_each = exclusion.value.request_header != null ? exclusion.value.request_header : []
            content {
              operator = request_header.value.operator
              value    = request_header.value.value
            }
          }
          dynamic "request_query_param" {
            for_each = exclusion.value.request_query_param != null ? exclusion.value.request_query_param : []
            content {
              operator = request_query_param.value.operator
              value    = request_query_param.value.value
            }
          }
          dynamic "request_uri" {
            for_each = exclusion.value.request_uri != null ? exclusion.value.request_uri : []
            content {
              operator = request_uri.value.operator
              value    = request_uri.value.value
            }
          }
          target_rule_ids = exclusion.value.target_rule_ids
          target_rule_set = exclusion.value.target_rule_set
        }
      }
    }
  }

  dynamic "redirect_options" {
    for_each = each.value.redirect_options != null ? [each.value.redirect_options] : []
    content {
      target = redirect_options.value.target
      type   = redirect_options.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

