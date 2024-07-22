variable "aws_region" {
  type = string
}
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}

variable "policy_name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "policy_actions" {
  type = list(string)
}

variable "policy_resources" {
  type = list(string)
}

variable "assume_role_actions" {
  type    = list(string)
}

variable "assume_role_principals_type" {
  type = string
}

variable "kubiya_account_id" {
  type = string
}


variable "kubiya_integration_name" {
  type = string
}

variable "kubiya_integration_description" {
  type = string
}
