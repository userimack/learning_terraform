provider "aws" {
  region  = "us-east-2"
  version = "~> 3.3"
}

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}
