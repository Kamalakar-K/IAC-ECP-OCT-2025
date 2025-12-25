output "nic_ids" {
  value = {
    for i, nic in azurerm_network_interface.nic :
    i => nic.id
  }
}
