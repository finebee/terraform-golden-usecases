variable "name" {
  type        = string
  default     = "terraform_ec2_admin"
  description = "name for aws role"
}

variable "policy_actions" {
  default = [
    "ec2:Describe*",
    "ec2:Get*",
  ]
  type        = list(string)
  description = "account actions that the role will be allowed to perform"
}

variable "policy_resources" {
  default     = ["*"]
  type        = list(string)
  description = "list of resources to apply the actions specified in policy_actions"
}
