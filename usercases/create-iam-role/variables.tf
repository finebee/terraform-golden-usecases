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
