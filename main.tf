resource "aws_iam_openid_connect_provider" "tfc_provider" {
  count = var.create_tfc_oidc_provider ? 1 : 0

  url            = local.oidc_provider_url
  client_id_list = var.tfc_oidc_provider_audiences
  thumbprint_list = [
    data.tls_certificate.tfc_certificate.certificates.0.sha1_fingerprint,
  ]
}

module "tfc_workload_identity_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.27"

  # Role must not be created if no workspaces are listed. Otherwise, anyone on TFC with the right
  # audience can assume this role.
  create_role = var.create_tfc_workload_identity_role && (
    length(local.tfc_workload_identity_workspaces) > 0
  )

  role_name        = var.tfc_workload_identity_role
  role_description = var.tfc_workload_identity_role_description

  role_policy_arns              = var.tfc_workload_identity_role_policy_arns
  role_permissions_boundary_arn = var.tfc_workload_identity_role_permissions_boundary_arn
  force_detach_policies         = true

  max_session_duration = var.tfc_workload_identity_role_max_session_duration

  provider_url = var.create_tfc_oidc_provider ? aws_iam_openid_connect_provider.tfc_provider[0].url : local.oidc_provider_url

  oidc_subjects_with_wildcards   = local.tfc_workload_identity_workspaces
  oidc_fully_qualified_audiences = try(coalescelist(var.tfc_workload_identity_role_audiences, aws_iam_openid_connect_provider.tfc_provider[0].client_id_list), [])

  tags = var.tags
}
