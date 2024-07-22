variable "name" {
  type        = string
  default     = "terraform_ec2_admin"
  description = "name for aws role"
}

variable "policy_actions" {
  default = [
    "s3:Get*",
    "s3:List*",
    "s3:Describe*",
    "s3-object-lambda:Get*",
    "s3-object-lambda:List*",
  ]
  type        = list(string)
  description = "account actions that the role will be allowed to perform"
}

variable "policy_resources" {
  default     = ["*"]
  type        = list(string)
  description = "list of resources to apply the actions specified in policy_actions"
}
