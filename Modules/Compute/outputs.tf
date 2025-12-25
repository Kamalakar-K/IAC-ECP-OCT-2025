output "vm_ids" {
  value = azurerm_windows_virtual_machine.vm[*].id
}
