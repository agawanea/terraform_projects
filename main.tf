terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
    }
  }
}

variable "account_1_region" {}
variable "account_2_region" {}
variable "custom_domain_name_prefix" {}
variable "domain_name" {}

# Configure the AWS Provider
provider "aws" {
 profile = "default"
 region  = "${var.account_1_region}"
}
 
#Production account
provider "aws" {
 profile = "crossaccount"
 region  = "${var.account_2_region}"
 alias   = "crossaccount"
}

data "aws_caller_identity" "current" {
  provider = aws.crossaccount
}




