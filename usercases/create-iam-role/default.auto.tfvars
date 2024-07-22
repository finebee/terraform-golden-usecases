name = "terraform-aws-role"

policy_resources = ["*"]
policy_actions   = ["ec2:Describe*"]

assume_type        = "Service"
assume_actions     = ["sts:AssumeRole"]
assume_identifiers = ["ec2.amazonaws.com"]
