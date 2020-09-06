provider "aws" {
  region  = "us-east-2"
  version = "~> 3.3"
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name     = each.value
}
