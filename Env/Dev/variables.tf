variable "network_interfaces" {
  type = map(object({
    nic_name  = string
    location  = string
    rg_name   = string
    subnet_id = string
  }))
}

variable "windows_virtual_machines" {
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
  type      = string
  sensitive = true
}
