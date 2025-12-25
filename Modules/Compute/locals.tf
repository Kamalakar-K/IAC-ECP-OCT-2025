locals {
  data_disks = flatten([
    for vm_key, vm in var.windows_virtual_machines : [
      for disk in lookup(vm, "data_disks", []) : {
        vm_key  = vm_key
        name    = disk.name
        size_gb = disk.size_gb
        lun     = disk.lun
        storage = disk.storage_type
        rg      = vm.rg_name
        location= vm.location
      }
    ]
  ])
}
