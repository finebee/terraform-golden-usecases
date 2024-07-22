variable "name" {
  type    = string
  default = "terraform-aws-role"
}
variable "policy_actions" {
  default = [""]
  type    = list(string)
}
variable "policy_resources" {
  default = [""]
  type    = list(string)
}

variable "assume_type" {
  type    = string
  default = "Service"
}
variable "assume_actions" {
  type    = list(string)
  default = ["sts:AssumeRole"]
}
variable "assume_identifiers" {
  type    = list(string)
  default = ["ec2.amazonaws.com"]
}
