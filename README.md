# TFC Workload Identity for AWS

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfc_workload_identity_role"></a> [tfc\_workload\_identity\_role](#module\_tfc\_workload\_identity\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 5.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.tfc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [tls_certificate.tfc_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_tfc_oidc_provider"></a> [create\_tfc\_oidc\_provider](#input\_create\_tfc\_oidc\_provider) | Create TFC OIDC Provider. Only one can exist in an account | `bool` | `true` | no |
| <a name="input_create_tfc_workload_identity_role"></a> [create\_tfc\_workload\_identity\_role](#input\_create\_tfc\_workload\_identity\_role) | Create IAM Role for TFC Workload Identity | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags for resources | `map(string)` | `{}` | no |
| <a name="input_tfc_oidc_provider_audiences"></a> [tfc\_oidc\_provider\_audiences](#input\_tfc\_oidc\_provider\_audiences) | List of TFC OIDC Provider audiences. This is part of the security configuration between TFC and your AWS account | `list(string)` | `[]` | no |
| <a name="input_tfc_workload_identity_role"></a> [tfc\_workload\_identity\_role](#input\_tfc\_workload\_identity\_role) | Name of the IAM Role for TFC | `string` | `"TfcWorkloadIdentity"` | no |
| <a name="input_tfc_workload_identity_role_audiences"></a> [tfc\_workload\_identity\_role\_audiences](#input\_tfc\_workload\_identity\_role\_audiences) | List of allowed audiences for the IAM Role. Defaults to the one for the OIDC provider if unspecified. | `list(string)` | `[]` | no |
| <a name="input_tfc_workload_identity_role_description"></a> [tfc\_workload\_identity\_role\_description](#input\_tfc\_workload\_identity\_role\_description) | Description of the IAM Role for TFC | `string` | `"Terraform Cloud Workload Identity"` | no |
| <a name="input_tfc_workload_identity_role_max_session_duration"></a> [tfc\_workload\_identity\_role\_max\_session\_duration](#input\_tfc\_workload\_identity\_role\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `3600` | no |
| <a name="input_tfc_workload_identity_role_permissions_boundary_arn"></a> [tfc\_workload\_identity\_role\_permissions\_boundary\_arn](#input\_tfc\_workload\_identity\_role\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role for TFC | `string` | `""` | no |
| <a name="input_tfc_workload_identity_role_policy_arns"></a> [tfc\_workload\_identity\_role\_policy\_arns](#input\_tfc\_workload\_identity\_role\_policy\_arns) | List of ARN to attach the IAM Role for TFC | `list(string)` | `[]` | no |
| <a name="input_tfc_workload_identity_workspaces"></a> [tfc\_workload\_identity\_workspaces](#input\_tfc\_workload\_identity\_workspaces) | Workspaces to allow access to the workload identity for this account | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_workload_identity_audience"></a> [tfc\_workload\_identity\_audience](#output\_tfc\_workload\_identity\_audience) | Audience value for TFC workload identity |
| <a name="output_tfc_workload_identity_role_arn"></a> [tfc\_workload\_identity\_role\_arn](#output\_tfc\_workload\_identity\_role\_arn) | IAM Role ARN for TFC Workload Identity |
| <a name="output_tfc_workload_identity_workspaces"></a> [tfc\_workload\_identity\_workspaces](#output\_tfc\_workload\_identity\_workspaces) | Workspaces allowed to assume the Workload Identity IAM Role |
<!-- END_TF_DOCS -->
