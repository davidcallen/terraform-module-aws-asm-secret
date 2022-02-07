variable "name" {
  description = "Name for the secret"
  default     = ""
  type        = string
  validation {
    condition     = length(var.name) > 0
    error_message = "Error : the variable 'name' must be non-empty."
  }
}
variable "description" {
  description = "Describes secret"
  type        = string
}
variable "recovery_window_in_days" {
  description = "The number of days to wait after Secret has been deleted before it is actually actioned."
  type        = number
  default     = 5
}
variable "account_id" {
  description = "The current account id"
  type        = string
  validation {
    condition     = length(var.account_id) > 0
    error_message = "Error : the variable 'account_id' must be non-empty."
  }
}
variable "password" {
  description = "The Jenkins internal Admin user password details. Will be stored in a secret."
  type        = string
  validation {
    condition     = length(var.password) > 0
    error_message = "Error : the variable 'password' must be non-empty."
  }
}
variable "allowed_iam_user_ids" {
  description = "The IAM unique_ids that are allowed access to Read the Secret"
  type        = list(string)
  validation {
    condition     = length(var.allowed_iam_user_ids) > 0
    error_message = "Error : the variable 'allowed_iam_user_ids' must be a non-empty list."
  }
}