provider "aws" {}
data "aws_iam_policy_document" "policy" {
  statement {
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}
data "aws_iam_policy_document" "assume_policy" {
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
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
}
resource "aws_iam_policy" "policy" {
  name   = var.name
  policy = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
