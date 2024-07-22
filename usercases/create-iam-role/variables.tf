variable "name" {
  type = string
}
variable "policy_actions" {
  type = list(string)
}
variable "policy_resources" {
  type = list(string)
}

variable "assume_type" {
  type = string
}
variable "assume_actions" {
  type = list(string)
}
variable "assume_identifiers" {
  type = list(string)
}
