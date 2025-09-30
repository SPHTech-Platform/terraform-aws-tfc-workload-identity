locals {
  tfc_workload_identity_workspaces = distinct(flatten([
    for org, projects in var.tfc_workload_identity_workspaces : [
      for project, workspaces in projects : [
        for workspace in workspaces : "organization:${org}:project:${project}:workspace:${workspace}:run_phase:*"
      ]
    ]
  ]))
  tfc_workload_identity_stacks = distinct(flatten([
    for org, projects in var.tfc_workload_identity_stacks : [
      for project, stacks in projects : [
        for stack in stacks : "organization:${org}:project:${project}:stacks:${stack}:*"
      ]
    ]
  ]))
  tfc_workload_identity_allowed_subs = distinct(concat(local.tfc_workload_identity_workspaces, local.tfc_workload_identity_stacks))

  oidc_provider_url = "https://app.terraform.io"
}

data "tls_certificate" "tfc_certificate" {
  url = local.oidc_provider_url
}
