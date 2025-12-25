resource "azurerm_windows_virtual_machine" "vm" {
  count               = var.vm_count
  name                = local.vm_names[count.index]
  location            = var.location
  resource_group_name = var.resource_group
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [var.nic_ids[count.index]]

  os_disk {
    caching              = "ReadWrite"
    disk_size_gb         = var.os_disk_size
    storage_account_type = var.os_disk_tier
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "data" {
  for_each = { for d in local.data_disks : d.key => d }

  name                 = each.key
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = each.value.tier
  disk_size_gb         = each.value.size
  create_option        = "Empty"
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach" {
  for_each           = azurerm_managed_disk.data
  managed_disk_id    = each.value.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm[
    index(local.vm_names, each.value.vm_name)
  ].id
  lun     = each.value.lun
  caching = "ReadWrite"
}
