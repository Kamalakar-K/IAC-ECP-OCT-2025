variable "windows_virtual_machines" {
  description = "Map of Windows VMs to create"
  type = map(object({
    vm_name     = string
    location    = string
    rg_name     = string
    size        = string
    admin_user  = string
    nic_key     = string
    os_disk = object({
      storage_type = string
      size_gb      = number
    })
    data_disks = optional(list(object({
      name         = string
      size_gb      = number
      lun          = number
      storage_type = string
    })), [])
    image = object({
      publisher = string
      offer     = string
      sku       = string
    })
    tags = map(string)
  }))
}

variable "admin_password" {
  description = "Admin password for VMs"
  type      = string
  sensitive = true
}

variable "nic_ids" {
  description = "Map of NIC names to NIC IDs created from network module"
  type        = map(string)
}
