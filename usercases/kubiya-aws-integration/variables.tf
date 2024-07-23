variable "name" {
  type    = string
}
variable "description" {
  type    = string
}

variable "policy_effect" {
  type    = string
}
variable "policy_actions" {
  type    = list(string)
}
variable "policy_resources" {
  type    = list(string)
}

variable "integration_type" {
  type    = string
}
variable "integration_region" {
  type    = string
}
variable "integration_auth_type" {
  type    = string
}