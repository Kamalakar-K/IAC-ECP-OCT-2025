variable "resource_group" {}
variable "location" {}
variable "vm_base_name" {}
variable "vm_count" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" { sensitive = true }
variable "nic_ids" { type = map(string) }
variable "os_disk_size" {}
variable "os_disk_tier" {}
variable "data_disks" {}
