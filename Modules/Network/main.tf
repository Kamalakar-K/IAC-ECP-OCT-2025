resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_base_name}-${format("%02d", count.index + 1)}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
