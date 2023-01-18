locals {
  tfc_workload_identity_workspaces = distinct(flatten([
    for org, workspaces in var.tfc_workload_identity_workspaces : [
      for workspace in workspaces : "organization:${org}:project:${var.tfc_project_support_match}:workspace:${workspace}:run_phase:*"
    ]
  ]))

  oidc_provider_url = "https://app.terraform.io"
}

data "tls_certificate" "tfc_certificate" {
  url = local.oidc_provider_url
}
