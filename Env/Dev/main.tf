module "network" {
  source = "../../Modules/Network"
  nics   = var.network_interfaces
}

module "compute" {
  source                   = "../../Modules/Compute"
  windows_virtual_machines = var.windows_virtual_machines
  admin_password           = var.admin_password
  nic_ids                  = module.network.nic_ids
}
