# ---------------------------------------------------------------------------------------------------------------------
# Secrets
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_secretsmanager_secret" "secret" {
  name_prefix = "${var.name}-"
  description = var.description
}
resource "aws_secretsmanager_secret_version" "secret" {
  secret_id = aws_secretsmanager_secret.secret.id
  # TODO : at some point ASM may support the generation of a random password which would be preferable for keeping password out of TF State
  secret_string = var.password
}
# Deny access to all except if from our list of IAM Role (Profiles) and their user ids (unique_ids)
resource "aws_secretsmanager_secret_policy" "secret" {
  secret_arn = aws_secretsmanager_secret.secret.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "GetSecretForRoles"
        Effect = "Deny"
        Principal = {
          "AWS" = "arn:aws:iam::${var.account_id}:root"
        }
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = [
          aws_secretsmanager_secret.secret.arn
        ]
        Condition = {
          StringNotLike = {
            # Deny access to all except if from our list of IAM Role (Profiles) and their user ids (unique_ids)
            "aws:userId" = concat(var.allowed_iam_user_ids[*])
          }
        }
      }
    ]
  })
}