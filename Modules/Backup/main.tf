locals {
  vault_name  = "existing-rsvault"
  policy_name = var.environment == "prod" ? "Prod-Policy" : "NonProd-Policy"
}

data "azurerm_recovery_services_vault" "vault" {
  name                = local.vault_name
  resource_group_name = "rg-backup"
}

data "azurerm_backup_policy_vm" "policy" {
  name                = local.policy_name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name
  resource_group_name = data.azurerm_recovery_services_vault.vault.resource_group_name
}

resource "azurerm_backup_protected_vm" "vm" {
  for_each            = toset(var.vm_ids)

  resource_group_name = data.azurerm_recovery_services_vault.vault.resource_group_name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name
  source_vm_id        = each.value
  backup_policy_id    = data.azurerm_backup_policy_vm.policy.id
}
