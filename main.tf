provider "aws" {
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"
}

variable "minimum_password_length" {
  type    = number
  default = 8
}

variable "require_lowercase_characters" {
  type    = bool
  default = true
}

resource "aws_iam_account_password_policy" "missing" {
  minimum_password_length = 8
}

resource "aws_iam_account_password_policy" "present" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 3
}

resource "aws_iam_account_password_policy" "variables" {
  minimum_password_length        = var.minimum_password_length
  require_lowercase_characters   = var.require_lowercase_characters
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 3
}
