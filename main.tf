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

data "doormat_aws_credentials" "creds" {
  provider = doormat
  role_arn = "arn:aws:iam::365006510262:role/tfc-doormat-role_multi-product-integration-demo"
}

provider "aws" {
  region     = var.region
  access_key = data.doormat_aws_credentials.creds.access_key
  secret_key = data.doormat_aws_credentials.creds.secret_key
  token      = data.doormat_aws_credentials.creds.token
}

provider "hcp" {
  client_id = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id = var.hcp_project_id
}

module "networking" {
  source = "./networking"
  region = var.region
  stack_id = var.stack_id
}

module "hcp_clusters" {
  source = "./hcp-clusters"
  stack_id = var.stack_id
  hvn_id = module.networking.hvn_id
  boundary_admin_username = var.boundary_admin_username
  boundary_admin_password = var.boundary_admin_password
}