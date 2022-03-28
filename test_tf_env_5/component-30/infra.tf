/*
This file is no longer managed by AWS Proton. The associated resource has been deleted in Proton.
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

