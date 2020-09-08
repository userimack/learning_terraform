terraform {
  required_version = ">= 0.13, < 0.14"
  backend "s3" {
    key = "prod/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-2"

  # Allow any 3.x version of the AWS provider
  version = "~> 3.3"
}

terraform {
  backend "s3" {
    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    # bucket         = "<YOUR S3 BUCKET>"
    # key            = "<SOME PATH>/terraform.tfstate"
    # region         = "us-east-2"
    # dynamodb_table = "<YOUR DYNAMODB TABLE>"
    # encrypt        = true
  }
}

module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}
