output "tfc_workload_identity_role_arn" {
  description = "IAM Role ARN for TFC Workload Identity"
  value       = module.tfc_workload_identity_role.iam_role_arn
}

output "tfc_workload_identity_audience" {
  description = "Audience value for TFC workload identity"
  value       = var.create_tfc_oidc_provider ? aws_iam_openid_connect_provider.tfc_provider[0].client_id_list : []
}

output "tfc_workload_identity_workspaces" {
  description = "Workspaces allowed to assume the Workload Identity IAM Role"
  value       = local.tfc_workload_identity_workspaces
}
