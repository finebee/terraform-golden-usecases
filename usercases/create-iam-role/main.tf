provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_iam_role" "role" {
  name = var.role_name
}

resource "aws_iam_policy" "policy" {
  name   = var.policy_name
  policy = data.aws_iam_policy_document.doc.json
}

data "aws_iam_policy_document" "doc" {
  statement {
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
