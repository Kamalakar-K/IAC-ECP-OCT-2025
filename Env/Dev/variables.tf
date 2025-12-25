variable "subscription_id" {}
variable "existing_resource_group" {}
variable "existing_vnet_id" {}
variable "existing_subnet_id" {}

variable "environment" {
  type    = string
  validation {
    condition     = contains(["prod", "nonprod"], var.environment)
    error_message = "environment must be prod or nonprod"
  }
}

variable "vm_base_name" {}
variable "vm_count" { type = number }
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" { sensitive = true }

variable "os_disk_size" { type = number }
variable "os_disk_tier" {}

variable "data_disks" {
  type = list(object({
    size = number
    tier = string
  }))
}
