variable "aws_region" {
  type    = string
  default = "eu-west-1"
  description = "aws regsion"
}
variable "aws_access_key" {
  type = string
  description = "aws auth details"
}

variable "aws_secret_key" {
  type = string
  description = "aws auth details"
}

variable "name" {
  type        = string
  default     = "terraform_ec2_admin"
  description = "name for aws role"
}

variable "policy_actions" {
  default     = ["ec2:*"]
  type        = list(string)
  description = "account actions that the role will be allowed to perform"
}

variable "policy_resources" {
  default     = ["*"]
  type        = list(string)
  description = "list of resources to apply the actions specified in policy_actions"
}
