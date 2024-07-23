provider "aws" {}
data "aws_iam_policy_document" "policy" {
  statement {
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

data "aws_iam_policy_document" "assume_role_doc" {
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
  name        = var.name
  description = var.description

  configs = [
    {
      is_default = true
      name       = var.name
      vendor_specific = {
        arn    = aws_iam_role.role.arn
        region = var.aws_integration_region
      }
    }
  ]
}
