terraform {
  required_version = ">= 0.13, < 0.14"
  backend "s3" {
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region  = "us-east-2"
  version = "~> 3.3"
}

module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }

# resource "aws_autoscaling_group_rule" "allow_testing_inbound" {
#   type              = "ingress"
#   security_group_id = module.webserver_cluster.alb_security_group_id
#
#   from_port   = 12345
#   to_port     = 12345
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
# }
