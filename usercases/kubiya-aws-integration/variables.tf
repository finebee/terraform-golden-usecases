variable "aws_region" {
  type    = string
  default = "eu-west-1"
  description = "aws regsion"
}
variable "aws_access_key" {
  type = string
  description = "aws auth details"
}

variable "aws_secret_key" {
  type = string
  description = "aws auth details"
}

variable "policy_name" {
  type        = string
  description = "iam policy name to attach"
}

variable "role_name" {
  type        = string
  description = "name for aws role"
}

variable "policy_actions" {
  type        = list(string)
  default     = ["sts:AssumeRole"]
  description = "account actions that the role will be allowed to perform"
}

variable "policy_principals_type" {
  type        = string
  default     = "AWS"
  description = "the type of principal"
}

variable "policy_principals_identifiers" {
  type        = list(string)
  description = "the principal that is getting this permission"
}

variable "policy_resources" {
  default     = ["*"]
  type        = list(string)
  description = "list of resources to apply the actions specified in policy_actions"
}

variable "assume_role_actions" {
  type        = list(string)
  default     = ["sts:AssumeRole"]
  description = "account actions that the role will be allowed to perform"
}

variable "assume_role_principals_type" {
  type        = string
  default     = "AWS"
  description = "the type of principal"
}

variable "kubiya_account_id" {
  type        = string
  default     = "595218598350"
  description = "kubiya.ai aws account id"
}

variable "assume_role_principals_identifiers" {
  type = list(string)
  #   default     = ["arn:aws:iam::${var.kubiya_account_id}:root"]
  description = "the principal that is getting this permission"
}


variable "integration_name" {
 type = string
 description = "name for kubiya integration"
}

variable "integration_description" {
  type = string
  description = "description for kubiya integration"
 }
