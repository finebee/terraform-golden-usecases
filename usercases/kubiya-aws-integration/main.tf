provider "aws" {}
data "aws_iam_policy_document" "policy" {
  statement {
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

data "aws_iam_policy_document" "assume_role_doc" {
  statement {
    actions = var.assume_actions
    principals {
      type        = var.assume_type
      identifiers = var.assume_identifiers
    }
  }
}

resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
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
  depends_on = [
    aws_iam_role.role,
    aws_iam_policy.policy
  ]
  name        = var.name
  description = var.description

  configs = [
    {
      name       = var.name
      is_default = true
      vendor_specific = {
        region = var.aws_region
        arn    = aws_iam_role.role.arn
      }
    }
  ]
}
