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
