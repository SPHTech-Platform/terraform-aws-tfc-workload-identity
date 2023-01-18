locals {
  tfc_workload_identity_workspaces = distinct(flatten([
    for org, projects in var.tfc_workload_identity_workspaces : [
      for project, workspaces in projects : [
        for workspace in workspaces : "organization:${org}:project:${project}:workspace:${workspace}:run_phase:*"
      ]
    ]
  ]))

  oidc_provider_url = "https://app.terraform.io"
}

data "tls_certificate" "tfc_certificate" {
  url = local.oidc_provider_url
}
