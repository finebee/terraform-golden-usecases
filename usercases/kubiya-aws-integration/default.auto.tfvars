name        = "terraform-role"
description = "aws role to allow kubiya get access"

policy_resources = ["*"]
policy_actions   = ["ec2:Describe*"]

assume_type        = "AWS"
assume_actions     = ["sts:AssumeRole"]
assume_identifiers = ["arn:aws:iam::595218598350:root"]
