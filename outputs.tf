output "secret_arn" {
  value = aws_secretsmanager_secret.secret.arn
}
output "secret_id" {
  value = aws_secretsmanager_secret.secret.id
}