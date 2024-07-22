provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

data "aws_iam_policy_document" "policy_doc" {
  statement {
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

data "aws_iam_policy_document" "assume_role_doc" {
  statement {
    actions = var.assume_role_actions
    principals {
      type        = var.assume_role_principals_type
      identifiers = ["arn:aws:iam::${var.kubiya_account_id}:root"]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
}

resource "aws_iam_policy" "policy" {
  name   = var.policy_name
  policy = data.aws_iam_policy_document.policy_doc.json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "kubiya_integration" "integration" {
  depends_on = [
    aws_iam_role.role,
    aws_iam_policy.policy
  ]
  name        = var.kubiya_integration_name
  description = var.kubiya_integration_description

  config = [
    {
      name       = aws_iam_role.role.name
      is_default = true
      vendor_specific = {
        region = var.aws_region
        arn    = aws_iam_role.role.arn
      }
    }
  ]
}
