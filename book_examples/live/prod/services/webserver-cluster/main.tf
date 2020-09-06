terraform {
  backend "s3" {
    key = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

provider "aws" {
  region  = "us-east-2"
  version = "~> 3.3"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-up-and-running-mahendra"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate" # intentionaly using the same RDS

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 4

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale_out_during_business_hours"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  recurrence            = "0 9 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale_in_at_name"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 1
  recurrence            = "0 17 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}
