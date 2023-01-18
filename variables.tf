variable "tags" {
  description = "List of tags for resources"
  type        = map(string)
  default     = {}
}

variable "create_tfc_oidc_provider" {
  description = "Create TFC OIDC Provider. Only one can exist in an account"
  type        = bool
  default     = true
}

variable "tfc_oidc_provider_audiences" {
  description = "List of TFC OIDC Provider audiences. This is part of the security configuration between TFC and your AWS account"
  type        = list(string)
  default     = []
}

variable "create_tfc_workload_identity_role" {
  description = "Create IAM Role for TFC Workload Identity"
  type        = bool
  default     = true
}

variable "tfc_workload_identity_role" {
  description = "Name of the IAM Role for TFC"
  type        = string
  default     = "TfcWorkloadIdentity"
}

variable "tfc_workload_identity_role_description" {
  description = "Description of the IAM Role for TFC"
  type        = string
  default     = "Terraform Cloud Workload Identity"
}

variable "tfc_workload_identity_role_max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}

variable "tfc_workload_identity_role_policy_arns" {
  description = "List of ARN to attach the IAM Role for TFC"
  type        = list(string)
  default     = []
}

variable "tfc_workload_identity_role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role for TFC"
  type        = string
  default     = ""
}

variable "tfc_workload_identity_workspaces" {
  description = "Workspaces to allow access to the workload identity for this account"
  type = map(      # Key is Organization
    map(           # Key is Project
      list(string) # List of workspaces
    )
  )
  default = {}
}

variable "tfc_workload_identity_role_audiences" {
  description = "List of allowed audiences for the IAM Role. Defaults to the one for the OIDC provider if unspecified."
  type        = list(string)
  default     = []
}
