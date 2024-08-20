variable "do_token" {
  type     = string
  nullable = false
}

variable "do_region" {
  type    = string
  default = "nyc1"
}

variable "wps_user" {
  type    = string
  default = "wordpress"
}

variable "wps_vm_count" {
  default = 2
  type    = number
  validation {
    condition = var.wps_vm_count >= 1
    error_message = "Quantity of VMs is below 1..."
  }
}
