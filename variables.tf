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