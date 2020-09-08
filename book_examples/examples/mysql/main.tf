terraform {
  required_version = ">= 0.13, < 0.14"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 3.x version of the AWS provider
  version = "~> 3.3"
}

module "mysql" {
  source = "../../modules/data-stores/mysql"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}