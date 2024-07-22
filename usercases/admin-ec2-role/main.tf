resource "aws_iam_role" "role" {
  name = var.name
}

resource "aws_iam_policy" "policy" {
  name   = var.name
  policy = data.aws_iam_policy_document.document.json
}

data "aws_iam_policy_document" "document" {
  statement {
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
