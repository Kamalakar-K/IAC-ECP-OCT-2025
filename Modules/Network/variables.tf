variable "nics" {
  description = "Map of NICs to create"
  type = map(object({
    nic_name  = string
    location  = string
    rg_name   = string
    subnet_id = string
  }))
}
