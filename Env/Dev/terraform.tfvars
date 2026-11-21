network_interfaces = {
  nic1 = {
    nic_name  = "vm01-nic"
    location  = "CentralUS"
    rg_name   = "RG-OCT-AZ-01"
    subnet_id = "/subscriptions/f13abd97-15cb-4218-a2e9-d8fc7376e907/resourceGroups/RG-OCT-AZ-01/providers/Microsoft.Network/virtualNetworks/vnet-cus-01/subnets/dev-subnet"
  }

#nic2 = {
#    nic_name  = "vm01-nic2"
 #   location  = "CentralUS"
 #   rg_name   = "RG-OCT-AZ-01"
 #   subnet_id = "/subscriptions/f13abd97-15cb-4218-a2e9-d8fc7376e907/resourceGroups/RG-OCT-AZ-01/providers/Microsoft.Network/virtualNetworks/vnet-cus-01/subnets/dev-subnet"
#  }

#   nic3 = {
#    nic_name  = "vm01-nic3"
#    location  = "CentralUS"
#    rg_name   = "RG-OCT-AZ-01"
#    subnet_id = "/subscriptions/f13abd97-15cb-4218-a2e9-d8fc7376e907/resourceGroups/RG-OCT-AZ-01/providers/Microsoft.Network/virtualNetworks/vnet-cus-01/subnets/dev-subnet"
#  }
}

windows_virtual_machines = {
#  vm01 = {
#    vm_name    = "winvm01"
#    location   = "CentralUS"
#    rg_name    = "RG-OCT-AZ-01"
#    size       = "Standard_B2s"
#    admin_user = "cscadmin"
#    nic_key    = "nic1"
#    os_disk = {
#      storage_type = "Standard_LRS"
#      size_gb      = 128
#    }
#    data_disks = [
#      {
#        name         = "winvm0-disk1"
#        size_gb      = 32
#        lun          = 0
#        storage_type = "Standard_LRS"
#      }
#    ]
#    image = {
#      publisher = "MicrosoftWindowsServer"
#      offer     = "WindowsServer"
#      sku       = "2022-Datacenter"
#    }
#    tags = {
#      Environment = "dev"
#    }
#  }

#  vm02 = {
#    vm_name    = "winvm02"
#    location   = "CentralUS"
#    rg_name    = "RG-OCT-AZ-01"
#    size       = "Standard_B2s"
#    admin_user = "cscadmin"
#    nic_key    = "nic2"
#    os_disk = {
#      storage_type = "Standard_LRS"
#      size_gb      = 128
#    }
#    data_disks = [
#      {
#        name         = "winvm02-disk1"
#        size_gb      = 32
#        lun          = 0
#        storage_type = "Standard_LRS"
#      }
#    ]
#    image = {
#      publisher = "MicrosoftWindowsServer"
#      offer     = "WindowsServer"
#      sku       = "2022-Datacenter"
#    }
#    tags = {
#      Environment = "dev"
#    }
#  }

#  vm03 = {
#    vm_name    = "winvm03"
#    location   = "CentralUS"
#    rg_name    = "RG-OCT-AZ-01"
#    size       = "Standard_B2s"
#    admin_user = "cscadmin"
#    nic_key    = "nic3"
#    os_disk = {
#      storage_type = "Standard_LRS"
#      size_gb      = 128
#    }
#    data_disks = [
#      {
#        name         = "winvm0-disk1"
#        size_gb      = 32
#        lun          = 0
#        storage_type = "Standard_LRS"
#      }
#    ]
#    image = {
#      publisher = "MicrosoftWindowsServer"
#      offer     = "WindowsServer"
#      sku       = "2022-Datacenter"
#    }
#    tags = {
#      Environment = "dev"
#    }
#  }
}

admin_password = "Onesimple@123"
