variable "region" {
  type = string
  default = "us-east-2"
}

variable "stack_id" {
    type = string
    default = "hashistack"
}

variable "boundary_admin_username" {
  type = string
}

variable "boundary_admin_password" {
  type = string
  sensitive = true
}

variable "my_email" {
  type = string
}