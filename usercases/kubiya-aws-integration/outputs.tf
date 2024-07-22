output "role" {
  value = aws_iam_role.role
}

output "policy" {
  value = aws_iam_policy.policy
}

output "integration" {
  value = kubiya_integration.integration
}
