resource "azurerm_windows_virtual_machine" "vm" {
  for_each            = var.windows_virtual_machines
  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  size                = each.value.size
  admin_username      = each.value.admin_user
  admin_password      = var.admin_password

  network_interface_ids = [
    var.nic_ids[each.value.nic_key]
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = each.value.os_disk.storage_type
    disk_size_gb         = each.value.os_disk.size_gb
  }

  source_image_reference {
    publisher = each.value.image.publisher
    offer     = each.value.image.offer
    sku       = each.value.image.sku
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_managed_disk" "data_disk" {
  for_each = {
    for d in local.data_disks : "${d.vm_key}-${d.lun}" => d
  }

  name                 = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.rg
  storage_account_type = each.value.storage
  disk_size_gb         = each.value.size_gb
  create_option        = "Empty"
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach" {
  for_each = azurerm_managed_disk.data_disk

  managed_disk_id    = each.value.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm[split("-", each.key)[0]].id
  lun                = tonumber(split("-", each.key)[1])
  caching            = "ReadWrite"
}

