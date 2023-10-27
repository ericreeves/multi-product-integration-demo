terraform {
  required_providers {
    doormat = {
      source  = "doormat.hashicorp.services/hashicorp-security/doormat"
      version = "~> 0.0.6"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.8.0"
    }

    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.66.0"
    }
  }
}

variable "region" {
  type = string
  default = "us-east-2"
}

variable "stack_id" {
    type = string
    default = "hashistack"
}

module "networking" {
  source = "./networking"
  region = var.region
  stack_id = var.stack_id
}