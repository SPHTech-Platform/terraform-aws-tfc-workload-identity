locals {
  tfc_workload_identity_workspaces_exact = flatten([
    for org, workspaces in var.tfc_workload_identity_workspaces : [
      for workspace in workspaces : [
        "organization:${org}:workspace:${workspace}:run_phase:plan",
        "organization:${org}:workspace:${workspace}:run_phase:apply",
      ] if !can(regex("\\*+", workspace))
    ]
  ])
  tfc_workload_identity_workspaces_wildcard = flatten([
    for org, workspaces in var.tfc_workload_identity_workspaces : [
      for workspace in workspaces : "organization:${org}:workspace:${workspace}:run_phase:*" if can(regex("\\*+", workspace))
    ]
  ])

  oidc_provider_url = "https://app.terraform.io"
}

data "tls_certificate" "tfc_certificate" {
  url = local.oidc_provider_url
}
