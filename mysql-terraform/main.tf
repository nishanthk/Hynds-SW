terraform {
  backend "s3" {
    bucket         = "HSW-TERRAFORM-STATE-UAT"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = "ap-southeast-2"
}

resource "aws_instaaws_db_instancence" "HSW-MYSQL-UAT" {
  allocated_storage                     = 100
  apply_immediately                     = true
  copy_tags_to_snapshot                 = true
  engine                                = "mysql"
  engine_version                        = "8.0.23"
  instance_class                        = "db.r6g.large"
  kms_key_id                            = "arn:aws:kms:ap-southeast-2:350838549319:key/24324967-d210-4b4f-8bf2-84f016751d2f"
  maintenance_window                    = "Thu:13:00-Thu:13:30"
  monitoring_interval                   = 60
  max_allocated_storage                 = 1000
  identifier                            = "HSW-MYSQL-UAT"
  parameter_group_name                  = "default.mysql8.0"
  availability_zone                     = "ap-southeast-2a"
  backup_retention_period               = 7
  db_subnet_group_name                  = "default-vpc-bcce3cda"
  vpc_id                                = "vpc-bcce3cda"
  enabled_cloudwatch_logs_exports       = ["audit","error","general"]
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = "arn:aws:kms:ap-southeast-2:350838549319:key/24324967-d210-4b4f-8bf2-84f016751d2f"
  performance_insights_retention_period = 7
  port                                  = 3306
  publicly_accessible                   = true
  storage_encrypted                     = true
  # username                              = ""
  # password                              = ""
}