variable "name" {
  type    = string
}
variable "description" {
  type    = string
}

variable "policy_actions" {
  type    = list(string)
}
variable "policy_resources" {
  type    = list(string)
}

variable "aws_integration_region" {
  type    = string
}
