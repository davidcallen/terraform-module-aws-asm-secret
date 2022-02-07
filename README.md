# Terraform module to create a Secret (and Version) in AWS Secret Manger (ASM).

Includes an IAM resource policy to protect it.

This will Deny access to all except if from our list of IAM Role (Profiles) and their user ids (unique_ids).

Once AWS Secrets Manager supports the generation of a random password we can adopt this - would be preferable for keeping password out of TF State.