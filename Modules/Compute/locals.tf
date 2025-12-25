locals {
  vm_names = [
    for i in range(1, var.vm_count + 1) :
    format("%s-%02d", var.vm_base_name, i)
  ]

  data_disks = flatten([
    for vm_index, vm_name in local.vm_names : [
      for disk_index, disk in var.data_disks : {
        key      = "${vm_name}-disk-${disk_index}"
        vm_name  = vm_name
        lun      = disk_index
        size     = disk.size
        tier     = disk.tier
      }
    ]
  ])
}
