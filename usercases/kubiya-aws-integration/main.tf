provider "aws" {}
data "aws_iam_policy_document" "policy" {
  statement {
    effect    = var.policy_effect
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::564407622114:root"]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_iam_policy" "policy" {
  name   = var.name
  policy = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

provider "kubiya" {}

resource "kubiya_integration" "integration" {
  name        = var.name
  description = var.description
  auth_type = var.integration_auth_type
  integration_type = var.integration_type

  configs = [
    {
      is_default = true
      name       = var.name
      vendor_specific = {
        arn    = aws_iam_role.role.arn
        region = var.integration_region
      }
    }
  ]
}
