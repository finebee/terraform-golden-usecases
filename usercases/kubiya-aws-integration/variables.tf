variable "name" {
  type    = string
  default = "terraform-role"
}
variable "description" {
  type    = string
  default = "aws role to allow kubiya get access"
}

variable "policy_actions" {
  type    = list(string)
  default = []
}
variable "policy_resources" {
  type    = list(string)
  default = []
}

variable "aws_integration_region" {
  type    = string
  default = "eu-west-1"
}
