variable "region" {
  type = string
  default = "us-east-2"
}

variable "stack_id" {
    type = string
    default = "hashistack"
}

variable "hcp_client_id" {
    type = string
}

variable "hcp_client_secret" {
  type = string
  sensitive = true
}

variable "hcp_project_id" {
  type = string
}

variable "boundary_admin_username" {
  type = string
}

variable "boundary_admin_password" {
  type = string
  sensitive = true
}