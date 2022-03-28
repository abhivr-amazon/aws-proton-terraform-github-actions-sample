/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:us-east-1:101381735630:component/component-30

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  // This tells terraform to store the state file in s3 at the location
  // s3://terraform-state-bucket/tf-os-sample/terraform.tfstate
  backend "s3" {
    bucket = "aws-proton-terraform-bucket-101381735630"
    key    = "tf-component-sample/terraform.tfstate"
    region = "us-east-1"
  }
}

// Configure the AWS Provider
provider "aws" {}

variable "aws_region" {
  type = string
}

resource "aws_ssm_parameter" "test_ssm_1" {
  name = "test_ssm_1"
  type = "String"
  // Use the Proton environment.outputs. namespace
  value = var.environment.outputs.vpc_arn
}

