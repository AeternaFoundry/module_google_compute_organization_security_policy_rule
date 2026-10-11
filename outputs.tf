output "compute_organization_security_policy_rules_id" {
  description = "Map of id values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no id are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "compute_organization_security_policy_rules_action" {
  description = "Map of action values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no action are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.action if v.action != null && length(v.action) > 0 }
}
output "compute_organization_security_policy_rules_deletion_policy" {
  description = "Map of deletion_policy values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no deletion_policy are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "compute_organization_security_policy_rules_description" {
  description = "Map of description values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no description are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.description if v.description != null && length(v.description) > 0 }
}
output "compute_organization_security_policy_rules_header_action" {
  description = "Map of header_action values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no header_action are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => one(v.header_action) if v.header_action != null && length(v.header_action) > 0 }
}
output "compute_organization_security_policy_rules_match" {
  description = "Map of match values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no match are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => one(v.match) if v.match != null && length(v.match) > 0 }
}
output "compute_organization_security_policy_rules_policy_id" {
  description = "Map of policy_id values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no policy_id are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.policy_id if v.policy_id != null && length(v.policy_id) > 0 }
}
output "compute_organization_security_policy_rules_preconfigured_waf_config" {
  description = "Map of preconfigured_waf_config values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no preconfigured_waf_config are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => one(v.preconfigured_waf_config) if v.preconfigured_waf_config != null && length(v.preconfigured_waf_config) > 0 }
}
output "compute_organization_security_policy_rules_preview" {
  description = "Map of preview values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no preview are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.preview if v.preview != null }
}
output "compute_organization_security_policy_rules_priority" {
  description = "Map of priority values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no priority are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => v.priority if v.priority != null }
}
output "compute_organization_security_policy_rules_redirect_options" {
  description = "Map of redirect_options values across all compute_organization_security_policy_rules, keyed the same as var.compute_organization_security_policy_rules except keys with no redirect_options are omitted"
  value       = { for k, v in google_compute_organization_security_policy_rule.compute_organization_security_policy_rules : k => one(v.redirect_options) if v.redirect_options != null && length(v.redirect_options) > 0 }
}

