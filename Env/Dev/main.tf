module "Network" {
  source     = "../../Modules/Network"
  subnet_id = var.existing_subnet_id
  vm_count  = var.vm_count
  vm_base_name = var.vm_base_name
}

module "compute" {
  source              = "../../Modules/Compute"
  resource_group      = var.existing_resource_group
  location            = "eastus"
  vm_base_name         = var.vm_base_name
  vm_count            = var.vm_count
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  nic_ids             = module.network.nic_ids
  os_disk_size        = var.os_disk_size
  os_disk_tier        = var.os_disk_tier
  data_disks          = var.data_disks
}

module "backup" {
  source          = "../../Modules/Backup"
  vm_ids          = module.compute.vm_ids
  environment     = var.environment
}
